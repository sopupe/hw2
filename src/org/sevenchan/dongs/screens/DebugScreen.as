package org.sevenchan.dongs.screens 
{
	import com.adobe.serialization.json.JSONEncoder;
	import org.sevenchan.dongs.Screen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class DebugScreen extends Screen 
	{
		private static var dbgStats:Boolean = false;
		private var text:String = "";
		private var act:String = "main";
		public function DebugScreen() 
		{
			clearButtons();
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			if (act == "main") {
				setButton(0, "EXIT");
				setButton(1, "dbgStats:" + (dbgStats?"1":"0"));
				setButton(2, "SuperStore");
				setButton(3, "BodyParts");
				setButton(4, "ChangeTo");
				setButton(5, "MoreGold");
				setButton(6, "Fight");
				//var enc:JSONEncoder = new JSONEncoder(main.player);
				text = "<h2>DEBUG MENU</h2>";
				switch(id) {
					case -1:
						updateScreen();
						break;
					case 0: // EXIT
						return true;
					case 1: 
						dbgStats = !dbgStats;
						main.setCheatMode(dbgStats);
						text = "<h2>Stat Modifiers Active</h2><p>You dirty fucking cheater.</p>";
						updateScreen();
						return false;
						break;
					case 2: // Super Store (Free shit)
						text = "<h2>Super Store</h2><p>Not implemented</p>";
						updateScreen();
						return false;
						break;
					case 3: // BodyParts (Select body parts from body part pool)
						main.showBodyPartSelector(true);
						updateScreen();
						return false;
						break;
					case 4: // ChangeTo
						//main.showCreatureSelector();
						updateScreen();
						return false;
						break;
					case 5: // MoreGold
						main.player.gold += 1000;
						updateScreen();
						return false;
						break;
					case 6: // Fight
						text = "Not ready yet";
						updateScreen();
						return false;
						break;
					
				}
			}
			updateScreen();
			return false;
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
	}

}