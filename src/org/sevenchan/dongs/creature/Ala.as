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
				AbilityRegistry.Sandstorm,
				//AbilityRegistry.Lightning,
				AbilityRegistry.Tornado
			];
			abilityUseProbability = 1;
			this.arms = [];
			this.legs = [];
			this._assholes = [];
			this._balls = [];
			this._breasts = [];
			this._dicks = [];
			this._eyes = [
				BodyPartRegistry.eyes.ghost_yellow,
				BodyPartRegistry.eyes.ghost_yellow
			];
			this._gender = Gender.ASEXUAL;
			this._wings = [];
		}
		
	}

}