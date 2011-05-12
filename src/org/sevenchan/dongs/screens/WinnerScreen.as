package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Item;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class WinnerScreen extends Screen 
	{
		private var player:Creature;
		private var loser:Creature;
		
		public static function push(ply:Creature, loser:Creature):void {
			Main.screenQueue.write(new WinnerScreen(ply, loser));
		}
		public function WinnerScreen(ply:Creature,loser:Creature) 
		{
			player = ply;
			this.loser = loser;
			clearButtons();
			setButton(NEXT_BUTTON, "Next");
		}
		
		override public function getScreenText():String 
		{
			var text:String= "<h2>You won!</h2><p>You received:<ul>";
			for (var i:* in loser.inventory) {
				if (i is Item) {
					text += "<li>" + i.num + " " + i.description + "</li>";
					player.addToInventory(i);
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