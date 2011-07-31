package org.sevenchan.dongs.creature 
{
	import mx.collections.ArrayList;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.items.HarpyTincture;
	import org.sevenchan.dongs.items.WhiteBerries;
	import org.sevenchan.dongs.screens.encounters.HarpyEncounterScreen;
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
	 * tl;dr zeus got made at some faggot and made birds shit in his soup.
	 * 
	 * @author N3X15
	 */
	public class Harpy extends Creature
	{
		registerClassAlias("EHarpy", Human);
		
		public static var SKIN:Skin = new Skin("human", "light", "smooth");
		
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
			this.arms.push(
				BodyPartRegistry.human_arm,
				BodyPartRegistry.human_arm
			);
			this.legs.push(
				BodyPartRegistry.harpy_leg,
				BodyPartRegistry.harpy_leg
			);
			this._vaginas.push(BodyPartRegistry.human_vagina);
			this.assholes.push(BodyPartRegistry.human_anus);
			if(!dark) {
				this.hair = new Hair("short, straight brown hair");
				this.eyes.push(BodyPartRegistry.harpy_light_eye, BodyPartRegistry.harpy_light_eye);
				this.wings.push(BodyPartRegistry.harpy_wing, BodyPartRegistry.harpy_wing);
				this.skin = new Skin("human");
			} else {
				this.hair = new Hair("short, straight black hair");
				this.eyes.push(BodyPartRegistry.harpy_dark_eye,BodyPartRegistry.harpy_dark_eye);
				this.wings.push(BodyPartRegistry.harpy_dark_wing, BodyPartRegistry.harpy_dark_wing);
				this.skin = new Skin("human", "pale");
				this.inventory.push(ItemRegistry.DARK_HARPY_EGG);
			}
			this.inventory.push(
				new HarpyTincture(1)
			);
		}
		
		override public function onEncounter(ply:Creature):Boolean 
		{
			if (ply!=null && !dark) {
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
			// Remove all white berries.
			for (var i:int = 0; i < ply.inventory.length; i++) {
				if (ply.inventory[i] is WhiteBerries)
					ply.inventory.splice(i, 1);
			}
			return super.onLose(ply);
		}
		
		override public function onWin(ply:Creature):Boolean {
			return false;
		}
	}

}