package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.*;
	/**
	 * ...
	 * @author N3X15
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
			this.selectPerkButton = false;
		}
		
		override public function getScreenText():String 
		{
			var text:String = "<h2>7chan Unnamed Text Adventure</h2>";
			text += "<p>Inspired by Corruption of Champions by Fenoxo</p>";
			text += "<p> Written in ActionScript 3 by N3X15 for the Open-Source Flex platform.  To see the sourcecode, find me a host that won't got bananas over pornographic content.  Ability to host git repositories preferred.</p>";
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