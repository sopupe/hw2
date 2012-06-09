package org.sevenchan.dongs.ability
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Bova;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Flatulence extends Ability
	{
		
		public function Flatulence()
		{
			this.manaCost = 75;
			this.description = "Paralyzes your enemy with a cloud of noxious gas.";
			this.label = "Flatulence";
			this.name = "Flatulence";
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean
		{
			var text:String = "<h2>Flatulence</h2>";
			var ineffective:Boolean = false;
			if (activator is Bova)
			{
				text += "<p>The Bova strains, grunting audibly";
				if (activator.assholes[0].isPenetrated())
				{
					text += ".</p><p><b>However, %SUB% can't complete the attack!</b></p>";
					ineffective = true;
				}
				else
				{
					text += ", and passes gas.</p>";
				}
				if (rapee.hasItem(ItemRegistry.GAS_MASK.id) || ineffective)
				{
					text += "<p><b>The ability is ineffective!</b></p>";
				} else {
					text += "<p><b>You are paralyzed by the smell!</b></p>";
					rapee.loseTurns(activator.getEffectivenessMultiplier(rapee) * 5);
				}
			}
			InfoScreen.push(text);
			return true;
		}
	
	}

}