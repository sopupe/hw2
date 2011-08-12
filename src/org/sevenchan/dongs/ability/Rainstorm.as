package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class Rainstorm extends Ability 
	{
		
		public function Rainstorm() 
		{
			this.description = "";
			this.label = "Rainstorm";
			this.name = "Rainstorm";
			this.manaCost = 10;
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			rapee.HP -= 5;
			rapee.loseTurns(1);
			InfoScreen.push("<p>The great beast laughs, and a heavy downpour begins.  The ground muddies almost immediately, causing you to lose your footing.</p>");
			return true;
		}
	}

}