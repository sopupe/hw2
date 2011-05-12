package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Screen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class LoserScreen extends Screen 
	{
		private var player:Creature;
		private var winner:Creature;
		
		public static function push(ply:Creature, winner:Creature):void {
			Main.screenQueue.write(new LoserScreen(ply, winner));
			Main.screenQueue.dump();
		}
		
		public function LoserScreen(ply:Creature,wnr:Creature) 
		{
			trace("LOSER'D");
			player = ply;
			winner = wnr;
			this.appearanceButton = true;
			this.debugMenuButton = true;
			this.exportGameButton = true;
			this.loadOrSaveButton = true;
			this.newGameButton = false;
			this.selectPerkButton = false;
			
			clearButtons();
			this.setButton(NEXT_BUTTON, "Next");
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			if (id == -1) {
				updateScreen()
				return false;
			}
			player.HP = player.maxHP;
			return true;
		}
		
		
		override public function getScreenText():String 
		{
			return  "<h2>You Lost</h2><p>You wake up at the barn, feeling refreshed, but sore... And also short 30 gold.</p>";
		}
	}

}