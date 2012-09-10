package org.sevenchan.dongs.creature 
{
	import flash.display.Sprite;
	import flash.net.*;
	import mx.effects.effectClasses.BlurInstance;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.*;
	/**
	 * A two-inch-thick worm that move through loose soil or sand.  Only attack individuals impregnated with eggs.
	 * 
	 * Likes to restrain legs and bite.
	 * Burrows underground for a few turns before coming back up.
	 * Can spit a mild poison when heavily injured.
	 * 
	 * When you win, you get an anchor stone from the first one.  Next ones spit up random crap they have in their stomachs.
	 * 
	 * When you lose, you now have a parasite living in your intestines.  Berry HP uptake = hpGiven / numWorms
	 * 
	 * Get rid of them with gold potions.
	 * @author ...
	 */
	public class Sandworm extends Creature 
	{
		
		registerClassAlias("ESandworm", Sandworm);
		// Setup genders and bodyparts
		public function Sandworm() 
		{
			gender = Gender.ASEXUAL;
			sexualPreference = SexualPreference.ASEXUAL;
			//_abilities['bite'] = new Bite();
			//_abilities['acidspit'] = new AcidSpit();
		}
		
		override public function onCombatInit(ply:Player):void 
		{
			inventory = new Vector.<Item>();
			if(!ply.getExplored("wonAgainstSandworm"))
				inventory.push(new AnchorStone(1));
			else {
				// White berry
				inventory.push(ItemRegistry.BERRY_WHITE);
			}
			super.onCombatInit(ply);
		}
		
		override public function onLose(ply:Creature):Boolean 
		{
			ply.setExplored("wonAgainstSandworm");
			return true;
		}
		
		override public function combatDescr(subj:Creature):String 
		{
			return "[Sandworm intro, WIP]";
		}
	}

}