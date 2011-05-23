package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.ItemRegistry;
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
			this.arms = [
				BodyPartRegistry.arms.human,
				BodyPartRegistry.arms.human,
			];
			this.legs = [
				BodyPartRegistry.legs.harpy,
				BodyPartRegistry.legs.harpy
			];
			this._vaginas = [BodyPartRegistry.vaginas.human];
			this.assholes = [BodyPartRegistry.assholes.human];
			if(!dark) {
				this.hair = new Hair("short, straight brown hair");
				this.eyes = [BodyPartRegistry.eyes.harpy_light, BodyPartRegistry.eyes.harpy_light];
				this.wings = [BodyPartRegistry.wings.harpy_light, BodyPartRegistry.wings.harpy_light];
				this.skin = new Skin("human");
			} else {
				this.hair = new Hair("short, straight black hair");
				this.eyes = [BodyPartRegistry.eyes.harpy_dark,BodyPartRegistry.eyes.harpy_dark];
				this.wings = [BodyPartRegistry.wings.harpy_dark, BodyPartRegistry.wings.harpy_dark];
				this.skin = new Skin("human", "pale");
				this.inventory.push(ItemRegistry.DARK_HARPY_EGG);
			}
			this.inventory.push(
				new HarpyTincture(1)
			);
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