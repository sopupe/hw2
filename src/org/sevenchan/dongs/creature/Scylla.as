package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.ability.AbilityRegistry;
	import org.sevenchan.dongs.bodyparts.Hair;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * A gigantic sea serpant with the upper body of a 
	 * beautiful woman who just happens to have 3 rows
	 * of needle-like teeth and an affinity for eating
	 * people whole.
	 * 
	 * Based off of the greek version, except this one is amphibious.
	 * 
	 * @author N3X15
	 */
	public class Scylla extends Creature 
	{
		
		public function Scylla() 
		{
			trace("Scylla.init()");
			super();
			height = Math.random() * 1.5 + 5;
			this.sexualPreference = SexualPreference.ASEXUAL;
			this.build = Build.AVG;
			 
			this.hair = MathUtils.getRandomArrayEntry([
				new Hair("long, beautiful blonde"),
				new Hair("long, beautiful brown"),
				new Hair("long, beautiful black"),
			]);
			gender = Gender.FEMALE;
			this.arms.push(
				BodyPartRegistry.arms.human,
				BodyPartRegistry.arms.human
			);
			skin = new Skin("scylla", "white", "soft");
			eyes.push(BodyPartRegistry.eyes.human_brown, BodyPartRegistry.eyes.human_brown);
			abilityUseProbability = 2;
			
			this.abilities={devour:AbilityRegistry.devour};
		}
		
		public function combatDescr(subj:Creature):String {
			var o:String = "<p>As you proceed along the coastline, you encounter a beautiful woman.  Your eyes then travel downward, and your grin is replaced by a frown as you discover that her lower body is like that of a large scaly serpent.  The fact that she seems to be drooling doesn't help that unsettled feeling go away.</p>";
			o += getDescription();
			return o;
		}
		public function onWin(ply:Creature):Boolean { 
			InfoScreen.push("TODO: Vore stuff (find out what vore people like about it, etc.).  Want to write this for me so I don't fuck it up?  Post it in the thread.");
			return true; 
		}
		public function onLose(ply:Creature):Boolean { return false; }
		public function getHostile(ply:Creature):Boolean { return true; }
		
	}

}