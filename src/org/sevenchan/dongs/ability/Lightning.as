package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.creature.Ala;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Lightning extends Ability 
	{
		
		public function Lightning() 
		{
			this.manaCost = 50;
			this.description = "Utterly rape something for the cost of 100 Mana.";
			this.label = "Lightning";
			this.name = "Lightning";
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			if(activator is Ala)
				InfoScreen.push("<h2>Lightning</h2><p>The Ala roars and a bolt of lightning streaks out of the sky and hits you.  One moment you're staring incredulously at the massive teeth of the Ala, the next you're flat on your ass and your scalp is on fire.</p>");
			if (activator is Player) {
				if (activator.mana < 100) {
					InfoScreen.push("<p>You do not have enough mana.</p>");
					return false;
				}
				InfoScreen.push("<h2>Lightning</h2><p>You raise your hands to the sky, and dark clouds immediately form, darkening the blaster landscape.  The clouds flicker with internal electrical discharges, and then, suddenly, a bolt slams into your opponent's head, causing significant damage.  The shockwave caused by the hot air expanding suddenly causes even more.</p>");
				activator.mana = 0;
			}
			rapee.HP -= rapee.HP / Math.max(1, rapee.level - activator.level);
			return true;
		}
		
	}

}