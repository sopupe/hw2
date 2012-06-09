package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.*;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class StartupScreen extends Screen
	{
		public function StartupScreen() 
		{
			clearButtons();
			this.appearanceButton = false;
			this.debugMenuButton = false;
			this.exportGameButton = false;
			this.loadOrSaveButton = false;
			this.newGameButton = true;
		}
		
		override public function getScreenText():String 
		{
			var text:String = "<h2>Adventure of the Seven Leaves</h2>";
			text += "<p>Inspired by Corruption of Champions by Fenoxo</p>";
			text += "<p>Written in ActionScript 3 by Harbinger for the Open-Source Adobe Flex 4 platform.  Visit <a href=\"http://adventure.nexisonline.net\">the project blog</a> for sourcecode links, updates, and news, among other silly bullshit.</p>";
			return text;
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			if(id!=-1)
				return true;
			updateScreen();
			return false;
		}
		
	}

}