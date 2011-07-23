package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.ability.AbilityRegistry;
	import org.sevenchan.dongs.bodyparts.Eye;
	import org.sevenchan.dongs.bodyparts.Gender;
	import org.sevenchan.dongs.enchantment.WindBlessing;
	import org.sevenchan.dongs.screens.InfoScreen;
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
			super();
			abilities = [
				AbilityRegistry.sandstorm,
				AbilityRegistry.rainstorm,
				AbilityRegistry.hailstorm,
				AbilityRegistry.lightning,
				AbilityRegistry.tornado
			];
			abilityUseProbability = 1;
			this._eyes.push(
				BodyPartRegistry.ghost_yellow_eye,
				BodyPartRegistry.ghost_yellow_eye
			);
			mana = 100;
			this.gold = 100;
			this.inventory.push(
				ItemRegistry.POTION_GOLD
			);
			this._gender = Gender.ASEXUAL;
		}
		
		
		override public function combatDescr(subj:Creature):String 
		{
			var text:String = "<p>While bumbling about, the sky darkens as ominous clouds roll in.";
			text += "You groan in frustration at the impending storm and begin to unpack your camp, ";
			text += " when you remember that storms do not have gigantic, red eyes, and they generally ";
			text += "do not form clouds at ground level, and they definately do not laugh evilly.</p>"
			if (subj.intellect >= 35)
				text += "<p>You remember from your studies at home that this is an Ala, a weather "
				+"demon. This experience, however, does NOT change the fact that it is hungry for "
				+"blood and that you are completely fucked.</p>";
			text += "<p>You begin to appreciate the beast's great size, it fills the valley before "
				+"you. The creature's claws, each shaped like bony scythes, are as thick as a house.  "
				+"Even if they were blunt, they would kill you with their sheer size.  The rest of the "
				+"creature is an equally grim prospect. The Ala's body is constructed from a "
				+"combination of bony, blade-covered plates atop massive, thorny tentacles around "
				+"its incredible skeleton. Its burning, yellow eyes (fixed on you) and mouth belch "
				+"black clouds of smoke that join with the stormclouds.</p>";
			text += "<p>You're scared shitless, but too stubborn to turn back.</p>";
			text += "<p><b>You have engaged the Wind Guardian and therefore cannot run.</b></p>";
			return gender.doReplace(text);
		}
		
		override public function canRun():Boolean { return false; }
		
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
		
		override public function onLose(ply:Creature):Boolean 
		{
			ply.addEnchantment(new WindBlessing());
			ply.abilities["lightning"] = AbilityRegistry.lightning;
			ply.gold += 100;
			for (var i:int = 0; i < inventory.length; i++) {
				var item:Item = inventory[i];
				ply.addToInventory(item);
			}
			
			InfoScreen.push("<p>The rain slows to a stop as the great beast before you stumbles, its "
			+"body disintegrating as the storm dissipates.  You stand, and before you are able to "
			+"strike the creature a deathblow, blinding white light bursts from its eyes and mouth "
			+"and begins spreading across its body as it screams loudly, shaking the ground from the "
			+"sheer force of its painful shout.  You raise an arm to your eyes, but the light and "
			+"sound overwhelms your senses and you pass out.</p><p>You awaken a short time later, "
			+"and feel rested.  You notice that you have 100 more gold, a flask of Gold Potion that "
			+"you don't remember buying, and a user's manual for the new lightning ability you now "
			+"apparently have.</p><p>A gentle gust ruffles your tattered clothing, and you swear "
			+"that you heard it whisper, \"You may pass\".</p>");
			return true; // Yes, we are overriding the winnings screen.
		}
	}

}