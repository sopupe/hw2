package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.ability.AbilityRegistry;
	import org.sevenchan.dongs.bodyparts.Eye;
	import org.sevenchan.dongs.bodyparts.Gender;
	import org.sevenchan.dongs.Creature;
	/**
	 * An ala or hala (plural: ale or hali) is a demon of bad weather recorded in 
	 * the folklore of Bulgarians, Macedonians, and Serbs. 
	 *  (Monsterpedia)
	 * 
	 * @author N3X15
	 */
	public class Ala extends Creature
	{
		
		public function Ala() 
		{
			abilities = [
				AbilityRegistry.sandstorm,
				AbilityRegistry.lightning,
				AbilityRegistry.tornado
			];
			abilityUseProbability = 1;
			this._eyes.push(
				BodyPartRegistry.eyes.ghost_yellow,
				BodyPartRegistry.eyes.ghost_yellow
			);
			this._gender = Gender.ASEXUAL;
		}
		
		
		override public function combatDescr(subj:Creature):String 
		{
			var text:String = "<p>While bumbling about, the sky darkens as ominous clouds roll in.";
			text += "You groan in frustration at the impending storm and begin to unpack your camp, ";
			text += " when you remember that storms do not have gigantic, red eyes, and they generally ";
			text += "do not form clouds at ground level, and they definately do not laugh evilly.</p>"
			if (subj.intellect > 35)
				text += "<p>You remember from your studies at home that this is an Ala, a weather demon. This experience, however, does NOT change the fact that it is hungry for blood and that you are completely fucked.</p>";
			return gender.doReplace(text);
		}
		
		override public function getTypeName():String 
		{
			return "Ala";
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return true;
		}
		
		override public function getInterested(subj:Creature):Boolean 
		{
			return false;
		}
		
	}

}