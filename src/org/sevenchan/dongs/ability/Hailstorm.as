package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Hailstorm extends Ability 
	{
		
		public function Hailstorm() 
		{
			this.description = "";
			this.label = "Hailstorm";
			this.name = "Hailstorm";
			this.manaCost = 15;
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			if(Math.random()*10 <= 7.5) {
				rapee.HP -= 10;
				InfoScreen.push("<p>The Ala howls into the sky.  You pause, wondering if it's wounded, when a ball of ice smacks into the ground next to you.  You'rw showered with blows as a hailstorm suddenly erupts around you.</p>");
			} else {
				InfoScreen.push("<p>The Ala howls into the sky.  You pause, wondering if it's wounded, when a ball of ice smacks into the ground next to you.  A hailstorm forms around you, but you manage to escape harm, leaving the Ala very unhappy.</p>");
			}
			return true;
		}
	}

}