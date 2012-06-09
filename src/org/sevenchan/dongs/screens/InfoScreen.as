package org.sevenchan.dongs.screens 
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.Screen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class InfoScreen extends Screen 
	{
		public static function push(text:String):void {
			AdventureController.screenQueue.write(new InfoScreen(text));
			AdventureController.screenQueue.dump();
		}
		
		private var text:String;
		public function InfoScreen(txt:String="") 
		{
			text = txt;
			this.appearanceButton = true;
			this.debugMenuButton = true;
			this.exportGameButton = true;
			this.loadOrSaveButton = true;
			this.newGameButton = false;
			this.importGameButton = false;
			
			clearButtons();
			this.setButton(NEXT_BUTTON, "Next");
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			if (id == -1) {
				updateScreen()
				return false;
			}
			return true;
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
	}

}