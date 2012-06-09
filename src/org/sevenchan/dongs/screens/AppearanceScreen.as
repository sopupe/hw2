package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.enchantment.Enchantment;
	import org.sevenchan.dongs.Screen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class AppearanceScreen extends Screen
	{
		
		public function AppearanceScreen() 
		{
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
			var txt:String = main.player.getDescription();
			trace(main.player.enchantments);
			if(MathUtils.lengthOf(main.player.enchantments)) {
				txt += "<h2>Enchantments/Effects</h2><ul>";
				var i:int = 0;
				for (var e:String in main.player.enchantments) {
					var ench:Enchantment = main.player.enchantments[e];
					txt += "<li><b>" +ench.getName() + "</b> - " + ench.getDescr() + "</li>";
				}
				txt += "</ul>";
			}
			return txt;
		}
	}

}