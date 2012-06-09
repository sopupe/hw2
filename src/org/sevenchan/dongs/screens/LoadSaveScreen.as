package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.Screen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class LoadSaveScreen extends Screen 
	{
		
		private var text:String = "";
		private var loading:Boolean;
		
		public function LoadSaveScreen(load:Boolean) 
		{
			this.loading = load;
			this.exportGameButton = true;
			this.importGameButton = true;
			this.appearanceButton = false;
			this.debugMenuButton = false;
			this.loadOrSaveButton = false;
			this.newGameButton = false;
			this.showLoadOrSaveButton = false;
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			clearButtons();
			switch(id) {
				case -1:
					text = "<h2>" + ((loading)?"Load":"Save") + " Game</h2>";
					setButton(0, "CANCEL");
					for (var i:int = 1; i < 12; i++) {
						var slotInfo:String = Player.previewSlot(i);
						if(!loading || slotInfo!="Slot Empty") {
							setButton(i, "Slot " + i);
						}
						text += "<p>" + slotInfo + "</p>";
					}
					updateScreen();
					return false;
					break;
				case 0:
					return true;
				default:
					InfoScreen.push("Game " + ((loading)?"Loaded":"Saved") + "!");
					if (loading) {
						main.player = new Player(main);
						main.player.setMain(main);
						main.player.load(id);
					} else {
						main.player.save(id);
					}
					return true;
			}
		}
		
	}

}