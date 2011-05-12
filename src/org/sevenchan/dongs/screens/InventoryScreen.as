package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Utils;
	/**
	 * ...
	 * @author N3X15
	 */
	public class InventoryScreen extends Screen
	{
		private var text:String = "";
		private var menu:String = "main";
		private var newItem:Item = null;
		public function InventoryScreen(new_itm:Item=null) 
		{
			newItem = new_itm;
			clearButtons();
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			clearButtons();
			if (menu == "gtfo") {
				return true;
			}
			
			if (menu == "add") {
				var foundSlot:Boolean = false;
				text = "<h2>Inventory</h2><p>You also picked up a " + newItem.descr+".</p>";
				for (var ii:int = 0; ii < main.player.inventory.length; ii++) {
					if ((main.player.inventory[i] as Item).id == newItem.id) {
						(main.player.inventory[i] as Item).amount++;
						text += "You shove it into the " + Utils.nTh(i + 1) + " slot in your inventory, give you a total of " + (main.player.inventory[i] as Item).amount + " " + (main.player.inventory[i] as Item).name + "s.</p>";
						foundSlot = true;
					}
				}
				if (!foundSlot) {
					if (main.player.inventory.length == 11) {
						menu = "replace";
						return processButtonPress( -1);
					} else {
						text += "You shove it into the " + Utils.nTh(main.player.inventory.length) + " slot in your inventory, give you a total of " + (main.player.inventory[i] as Item).amount + " " + (main.player.inventory[i] as Item).name + "s.</p>";
						main.player.inventory.push(newItem);
						foundSlot = true;
					}
				}
				if (foundSlot) {
					setButton(NEXT_BUTTON, "Next");
					if (id == 0) {
						return true;
					}
					updateScreen();
				}
			}
			
			if (menu == "replace") {
				
				text += "<p>However, you don't have enough room.  Either DISCARD the item, or click on a slot to replace it with.</p>";
				text += "<ul>";
				setButton(0, "DISCARD");
				for (var i:int = 0; i < main.player.inventory.length;i++ ) {
					var item:Item = Item(main.player.inventory[i]);
					text += "<li><b>" + item.amount + "x " + item.name + "</b> - " + item.descr + "</li>";
					setButton(i + 1, item.name);
				}
				text += "</ul>";
				updateScreen();
				if (id == -1) {
					return false;
				} else if(id==0) {
					return true;
				} else {
					main.player.inventory[id - 1]=newItem;
					return true;
				}
			}
			if (menu == "main") {
				text = "<h2>Inventory</h2><p>You peer into your canvas bag of stuff and find";
				if (main.player.inventory.length == 0) {
					menu = "gtfo";
					text += " nothing of value.  You should explore more.  Purchased items will also end up here.</p>";
					setButton(NEXT_BUTTON, "Next");
					updateScreen();
					return false;
				} else {
					text += ":<ul>";
					setButton(0, "BACK");
					for (i = 0; i < main.player.inventory.length;i++ ) {
						item = Item(main.player.inventory[i]);
						text += "<li><b>" + item.amount + "x " + item.name + "</b> - " + item.descr + "</li>";
						setButton(i + 1, item.name);
					}
					text += "</ul>";
					updateScreen();
					if (id == -1) {
						return false;
					} else if(id==0) {
						return true;
					} else {
						if ((main.player.inventory[id - 1] as Item).Use(main.player)) {
							(main.player.inventory[id - 1] as Item).amount--;
							if ((main.player.inventory[id - 1] as Item).amount == 0) {
								main.player.inventory.splice(id - 1,1);
							}
						}
						return true;
					}
				}
			}
			return false;
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
	}

}