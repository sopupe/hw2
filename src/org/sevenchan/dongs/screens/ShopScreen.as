package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class ShopScreen extends Screen 
	{
		private var act:String = "main";
		private var text:String = "";
		private var tax:Number = 0;
		private var inventory:Array = [];
		private var town:Town;
		public function ShopScreen(t:Town, tax:Number, itemsSold:Array) 
		{
			this.town = t;
			clearButtons();
			this.tax = tax;
			for each(var id:int in itemsSold) {
				var item:Item = Item.findByID(id);
				item.amount = 10+MathUtils.rand(-10,5);
				inventory.push(item);
			}
			trace(inventory);
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			clearButtons();
			var item:Item = null;
			if (act == "main") {
				text = "<h2>Shop</h2>";
				text += town.onShopWelcome();
				setButton(0, "EXIT");
				setButton(1, "Buy");
				setButton(2, "Sell");
				updateScreen();
				switch(id) {
				case -1: return false; break;
				case 0: 
					return true;
				case 1:
					act = "buy";
					return processButtonPress( -1);
				case 2:
					act = "sell";
					return processButtonPress( -1);
				}
			}
			if (act == "buy") {
				text = "<h2>Buy</h2>";
				text += town.onShopBuyMenu();
				text += "<ul>";
				setButton(0, "BACK");
				for (var i:int = 0; i < inventory.length; i++) {
					// 2x WhiteBerry (15G)
					item = inventory[i];
					text += "<li><b>" + item.amount + "x " + item.name + " (" + (item.value + tax) + "G)</b> - <i>" + item.descr + "</i></li>";
					setButton(i + 1, item.name);
				}
				text += "</ul>";
				
				if (id == 0) {
					act = "main";
					return processButtonPress( -1);
				}
				if (id > 0) {
					item = Item.findByID((inventory[id - 1] as Item).id);
					var price:int = (item.value + tax);
					// Check if we have enough money
					if (main.player.gold - price < 0) {
						text = "You don't have enough money for this.";
						updateScreen();
						return false;
					}
					// Deduct from store
					(inventory[id - 1] as Item).amount--;
					if ((inventory[id - 1] as Item).amount == 0) {
						inventory.splice(id - 1, 1);
					}
					
					// Give to player
					item.amount = 1;
					main.player.addToInventory(item);
					main.player.gold -= price;
					main.refreshStats();
					updateScreen();
					return false;
				}
				updateScreen();
				return false;
			}
			if (act == "sell") {
				text = "<h2>Sell</h2>";
				text += town.onShopSellMenu();
				setButton(0, "BACK");
				if(inventory.length>0) {
					text += "<ul>";
					for (i = 0; i < main.player.inventory.length; i++) {
						// 2x WhiteBerry (15G)
						item = main.player.inventory[i];
						text += "<li><b>" + item.amount + "x " + item.name + " (" + (item.value - tax) + "G)</b> - <i>" + item.descr + "</i></li>";
						setButton(i + 1, item.name);
					}
					text += "</ul>";
				} else {
					text += "<p><i>You have nothing to sell.</i></p>";
				}
				
				if (id == 0) {
					act = "main";
					return processButtonPress( -1);
				}
				if (id > 0) {
					item = main.player.inventory[id - 1]
					trace("SHOPSCREEN ITEM",item);
					if(item is Item) {
						item=item.copy();
						price = (item.value - tax);
						item.amount = 1;
						main.player.takeFromInventory(item);
						main.player.gold += price;
						main.refreshStats();
					}
					updateScreen();
					return false;
				}
				updateScreen();
				return false;
			}
			return false;
		}
	}

}