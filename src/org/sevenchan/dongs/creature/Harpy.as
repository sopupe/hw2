package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.items.HarpyTincture;
	import org.sevenchan.dongs.screens.HarpyEncounterScreen;
	/**
	 * Two versions for our purposes.
	 * 
	 * Harpy
	 *  Light-hearted, kind inhabitants of the world.  Only a few left.
	 *  Not hostile, open to sex.
	 *  Human upperbody, digitigrade, human-length birdlegs with human thighs and big talons
	 * 
	 * 
	 * Dark Harpy (Corrupted)
	 * 	"Zeus, angry that Phineas revealed too much, punished him by blinding him and 
	 *  putting him on an island with a buffet of food which he could never eat. The 
	 *  harpies always arrived and stole the food out of his hands before he could 
	 *  satisfy his hunger, and befouled the remains of his food." - (Wikipedia:Harpy)
	 * 
	 * @author N3X15
	 */
	public class Harpy extends Creature
	{
		registerClassAlias("EHarpy", Human);
		
		public static var EYE:Eye = new Eye("harpy", "amber", "slit");
		public static var DARK_EYE:Eye = new Eye("darkharpy", "red", "slit");
		public static var SKIN:Skin = new Skin("human", "light", "smooth");
		public static var LIGHT_WING:Wing = new Wing("harpy", false, "brown and white", 10);
		public static var DARK_WING:Wing = new Wing("darkharpy", false, "black and violet", 10);
		public static var LEG:Leg = new Leg("long, birdlike harpy");
		
		public var dark:Boolean;
		public function Harpy(corrupt:Boolean=false) 
		{
			this.dark = corrupt;
			trace("Harpy.init()");
			super();
			height = Math.random()*1.5 + 5;
			
			this.gender = Gender.FEMALE;
			this.sexualPreference = SexualPreference.BISEXUAL;
			this.build = Build.AVG;
			this.arms = [
				Arm.HUMAN,
				Arm.HUMAN,
			];
			this.legs = [
				LEG,
				LEG
			];
			this._vaginas = [Vagina.HUMAN];
			this.assholes = [Asshole.HUMAN];
			if(!dark) {
				this.hair = new Hair("short, straight brown hair");
				this.eyes = [EYE, EYE];
				this.wings = [LIGHT_WING, LIGHT_WING];
				this.skin = new Skin("human");
			} else {
				this.hair = new Hair("short, straight black hair");
				this.eyes = [DARK_EYE,DARK_EYE];
				this.wings = [DARK_WING, DARK_WING];
				this.skin = new Skin("human", "pale");
				this.inventory = [
					new HarpyTincture(1)
				];
			}
		}
		
		override public function onEncounter(ply:Creature):Boolean 
		{
			if (!dark) {
				HarpyEncounterScreen.push();
			}
			return !dark;
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return dark;
		}
		
		override public function getTypeName():String 
		{
			return (dark?"Dark ":"") + "Harpy";
		}
		
		override public function onLose(ply:Creature):Boolean 
		{
			return super.onLose(ply);
		}
		
		override public function onWin(ply:Creature):Boolean {
			return false;
		}
	}

}