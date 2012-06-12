package org.sevenchan.dongs.ability
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Tornado extends Ability
	{
		
		public function Tornado()
		{
			this.manaCost = 75;
			this.description = "Summons a tornado to return player to barn.";
			this.label = "Tornado";
			this.name = "Tornado";
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean
		{
			if (rapee.hasItem(ItemRegistry.ANCHOR_STONE.id))
				return false;
			var text:String = "<h2>Tornado</h2>";
			text += "<p>The ghastly spirit's face splits in two as it bares its enormous, foot-long ";
			text += "shark-like teeth.  Strands of ethereal saliva bridge the gaps, and a foul odor ";
			text += "slams into you like a train full of corpses.";
			text += "You then realize, to your sheer horror, that the Ala is <i>smiling</i>.  ";
			text += "This revelation comes far too late, as a strong wind slams into you like a brick";
			text += " wall.  It picks up strength, and you have to brace your legs to keep your ";
			text += "footing.  Even that doesn’t hold on for long, however.  You’re soon swept off ";
			text += "your feet in a massive, black whirlwind.  Deep, taunting laughter fills the ";
			text += "wind as you’re carried away.</p>";
			InfoScreen.push(text);
			activator.mana = 0;
			rapee.HP = 0;
			return true;
		}
	
	}

}