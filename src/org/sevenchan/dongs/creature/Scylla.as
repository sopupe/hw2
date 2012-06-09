package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.ability.AbilityRegistry;
	import org.sevenchan.dongs.bodyparts.Breast;
	import org.sevenchan.dongs.bodyparts.Build;
	import org.sevenchan.dongs.bodyparts.Gender;
	import org.sevenchan.dongs.bodyparts.Hair;
	import org.sevenchan.dongs.bodyparts.SexualPreference;
	import org.sevenchan.dongs.bodyparts.Skin;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * A gigantic sea serpent with the upper body of a 
	 * beautiful woman who just happens to have 3 rows
	 * of needle-like teeth and an affinity for eating
	 * people whole.
	 * 
	 * Based off of the greek version, except this one is amphibious.
	 * 
	 * @author Harbinger
	 */
	public class Scylla extends Creature 
	{
		
		public function Scylla() 
		{
			trace("Scylla.init()");
			super();
			height = Math.random() * 1.5 + 5;
			this.sexualPreference = SexualPreference.ASEXUAL;
			this.build = Build.PRETTYSTRONG; 
			 
			this.hair = MathUtils.getRandomArrayEntry([
				new Hair("long, beautiful blonde hair"),
				new Hair("long, beautiful brown hair"),
				new Hair("long, beautiful black hair"),
			]);
			gender = Gender.FEMALE;
			this.arms.push(
				BodyPartRegistry.human_arm,
				BodyPartRegistry.human_arm
			);
			skin = new Skin("human", "white", "soft but damp");
			eyes.push(BodyPartRegistry.human_brown_eye, BodyPartRegistry.human_brown_eye);
			this.assholes.push(BodyPartRegistry.human_anus);
			this.vaginas.push(BodyPartRegistry.human_vagina);
			addBreast();
			addBreast();
		}
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.human_breast;
			boob.size = MathUtils.rand(0, 3);
			breasts.push(boob);
			return boob;
		}
		
		public override function getTypeName():String { return "Scylla"; }
		
		public override function combatDescr(subj:Creature):String {
			var o:String = "<p>As you proceed along the coastline, you encounter a "
			+"beautiful woman.  Your eyes then travel downward, and your grin is "
			+"replaced by a frown as you discover that her lower body is like that of a "
			+"large scaly serpent.  The fact that she seems to be drooling doesn't help "
			+"that unsettling feeling go away.</p><p>She is ";
			o += getDescription();
			return o;
		}
		public override function onWin(ply:Creature):Boolean { 
			var story:String = "";
			story += "<p>The large serpent-woman licks her lips as she gives you one final";
			story += " whip of her tail, sending you sprawling to the ground like a drunk";
			story += " hit by a bus.  The wind is knocked out of you, but you still have";
			story += " enough energy to roll onto your back, cursing through bloodied";
			story += " teeth as you glare at the creature.  She chuckles softly at the";
			story += " display.</p>";
			story += "<p>\"Ah, you can ssssstill move, my dear?  Exxxxxcellent...\"";
			story += " A broad smile spreads across her face as she slides closer on her";
			story += " snakelike underside.  You try to crawl away, but a hand grasps";
			story += " your leg, and you turn in time to see the most horrifying sight";
			story += " you’ve seen thus far.  She has dislocated her jaw, displaying";
			story += " several rows of long, sharp teeth and an enormous maw. The smell";
			story += " is overwhelming.</p>";
			story += "<p>You start cursing louder, struggling as she grabs your other";
			story += " leg, clamping it tightly to the other, and begins to swallow you,";
			story += " feet first.  After swallowing your legs, she works her way up to";
			story += " your hips, sliding her tongue over your groin, and her teeth";
			story += " catch on your clothing, preventing you from moving back out of";
			story += " her mouth.  Her tongue ";
			if (ply.vaginas.length>0) {
				story += " licks around your sweaty, sore labia, tasting you for a bit,";
				story += " before diving into your depths.";
			} else if (ply.dicks.length>0) {
				story += " envelops your flaccid, terrified penis";
				if(ply.balls.length>0)
					story += " and balls";
				story += ", tasting you a bit.";
			} else {
				story += " rolls across your blank groin disappointedly."
			}
			story += "  She seems to become more hungry, her face flushing and her gulps";
			story += " becoming more urgent.  You’re too terrified to understand what's";
			story += " going on, but your body doesn’t care.</p><p>";
			if(ply.vaginas.length>0) {
				story += "Her fat, meaty tongue plunges further inside of you, and then";
				story += " makes its way around every inch of your cunt. After a few";
				story += " minutes, your body surrenders and orgasms.</p>";
			} else if (ply.dicks.length>0) {
				story += "Her tongue wraps around your ";
				story += ply.dicks[0].getShortDescr();
				story += ", and the tongue's warm, wet texture, in addition to the pressure";
				story += " around your member, causes you to release your payload into her";
				story += " mouth.</p>";
			} else {
				// Nope.
			}
			story += "<p>Satisfied, she finishes swallowing you.  After a few weeks of agony in her stomach acid (passing the time by reading a wet, acid - eaten book someone had left inside), you pass away.</p>";
			story += "<p>...And then wake up at the barn again.  Great.</p>";

			InfoScreen.push(story);
			return true; 
		}
		public override function onLose(ply:Creature):Boolean { return false; }
		
		public override function getHostile(ply:Creature):Boolean { return true; }
		
	}

}