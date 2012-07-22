package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Town;
	import flash.utils.*;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.bodyparts.Hair;
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.enchantment.Hunger;
	import org.sevenchan.dongs.enchantment.Paralyze;
	import org.sevenchan.dongs.enchantment.WindBlessing;
	import org.sevenchan.dongs.INode;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.MenuNode;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Shop extends Encounter
	{
		//private var text:String = "";
		protected var markup:Number = 0;
		protected var inventory:Array = [];
		protected var town:Town;
		protected var name:String;
		public var description:String;
		protected var SellMenu:MenuNode;
		
		public static function push():void
		{
			AdventureController.screenQueue.write(new SuperStoreScreen());
		}
		
		public function Shop(name:String, description:String,t:Town, markup:Number, itemsSold:Array) 
		{
			this.description = description;
			this.name = name;
			this.town = t;
			this.markup = markup;
			super(null);
			this.name = name;
			inventory = [];
			
			currentItem.clearChildren();
			;
			var BuyItems:MenuNode = currentItem.pushMenu("Buy", "Buy things at terrible prices.");
			for each (var item:Item in itemsSold)
			{
				var price:Number = item.value + (item.value * markup);
				BuyItems.pushAction(item.name, price, item.descr, function(ply:Creature, node:ActionNode, o:*):Boolean
				{
					ply.addToInventory(o as Item);
					return true;
				}, item);
			}
			SellMenu = currentItem.pushMenu("Sell", "Sell things at equally terrible prices.");
		
		}
		
		public function updateSellMenu():void
		{
			SellMenu.clearChildren();
			for (var i:int = 0; i < main.player.inventory.length; i++) {
				var item:Item = main.player.inventory[i];
				SellMenu.pushAction(item.name, item.value, item.descr, function(ply:Creature, node:ActionNode, o:*):Boolean
				{
					ply.addToInventory(o as Item);
					return true;
				}, item);
			}
		}
		
		override public function processButtonPress(id:int):Boolean
		{
			clearButtons();
			if (abort)
			{
				return true;
			}
				text = currentItem.content;
			switch (id)
			{
				
				case-1: 
					onStartupScreen();
					appendMenu();
					updateScreen();
					updateSellMenu();
					return false;
					break;
				case 0: 
					if (currentItem.parent == null)
					{
						onLeaving();
						return true;
					}
					else
					{
						currentItem = currentItem.parent;
						appendMenu();
						updateScreen();
						updateSellMenu();
						return false;
					}
					break;
				default: 
					var nci:INode = currentItem.children[id - 1];
					var ret:Boolean = false;
					if (nci is ActionNode)
					{
						ret = (ActionNode(nci)).invoke(this, this.main.player, (nci as ActionNode).arg);
					}
					else
					{
						if ((MenuNode(nci)).canSwitchTo(main.player, subject, this))
						{
							currentItem = nci;
						}
					}
					if (!abort)
						text = nci.content;
					if (!ret && !abort)
					{
						appendMenu();
					}
					updateScreen();
					updateSellMenu();
					return ret;
			}
			return false;
		}
		
		override public function getScreenText():String
		{
			return text;
		}
	
	}

	
	/**
	 * ...
	 * @author Harbinger
	 */
	/*
	public class ShopScreen extends Screen 
	{
		
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
	*/
}