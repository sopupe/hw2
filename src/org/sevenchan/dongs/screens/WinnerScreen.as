package org.sevenchan.dongs.screens 
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Item;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class WinnerScreen extends Screen 
	{
		public static var immediatelyConsume:Boolean = false;
		private var player:Creature;
		private var loser:Creature;
	
		
		public static function push(ply:Creature, loser:Creature):void {
			AdventureController.screenQueue.write(new WinnerScreen(ply, loser));
		}
		public function WinnerScreen(ply:Creature,loser:Creature) 
		{
			player = ply;
			this.loser = loser;
			clearButtons();
			lustCost = 1;
			setButton(NEXT_BUTTON, "Next");
		}
		
		override public function getScreenText():String 
		{
			var text:String = "<h2>You won!</h2><p>You received:<ul>";
			trace("LOSER INVENTORY");
			for each (var item:Item in loser.inventory) {
				if(player.inventoryUpdate(item,true)) {
					text += "<li>" + item.amount + "x " + item.name + "</li>";
					player.addToInventory(item);
				}
			}
			text += "<li>" + loser.gold + " gold</li>";
			text += "<li>" + (6+((player.level - loser.level)*1)) + " XP</li>";
			text+="</ul></p> ";
			//player.gold += loser.gold;
			return text;
		}
	}

}