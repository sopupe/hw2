package org.sevenchan.dongs 
{
	import org.sevenchan.AdventureController;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Screen 
	{
		public var main:AdventureController;
		private var buttons:Array = [
		"", "", "", "", "", "",
		"", "", "", "", "", ""];
		public const NEXT_BUTTON:int = 0;
		public var lustCost:Number = 0.0;
		public var newGameButton:Boolean = false;
		public var loadOrSaveButton:Boolean = true;
		public var showLoadOrSaveButton:Boolean = true;
		public var importGameButton:Boolean = false;
		public var exportGameButton:Boolean = true;
		public var debugMenuButton:Boolean = true;
		public var appearanceButton:Boolean = true;
		/**
		 * [{id,String},...]
		 * @return
		 */
		public function getButtons():Array {
			return buttons;
		}
		public function clearButtons():void {
			buttons = [];
			for (var i:int = 0; i < 12; i++) {
				buttons[i] = "";
			}
		}
		public function setButton(id:int, label:String):void {
			buttons[id] = label;
		}
		public function setMain(main:AdventureController):void {
			this.main = main;
		}
		public function updateScreen():void {
			main.updateScreen(this);
		}
		public function getScreenText():String {
			return "[WIP]";
		}
		
		
		public function processButtonPress(id:int):Boolean 
		{
			if (main == null) {
			main = Main.main;
			}
			if (id == -1) {
				updateScreen()
				return false;
			}
			return true;
		}
	}

}