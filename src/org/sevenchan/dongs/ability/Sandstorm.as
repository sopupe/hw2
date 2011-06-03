package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class Sandstorm extends Ability 
	{
		
		public function Sandstorm() 
		{
			this.manaCost = 15;
			this.description = "Summons a massive sandstorm to blind your enemies.";
			this.label = "Sandstrm";
			this.name = "Sandstorm";
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			var text:String = "<h2>Sandstorm</h2>";
			text += "<p>"+((activator is Player) ? "You summon ":"The " + activator.getTypeName() + " summons ") + " a powerful whirlwind of blinding sand and dust.</p>";
			rapee.speed /= 2;
			text += rapee.gender.doReplace("<p><b>%CPOS% speed was cut in half!</b></p>");
			InfoScreen.push(text);
			activator.mana -= 2;
			return true;
		}
	}

}