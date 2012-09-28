package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.StringTools;
	import flash.net.registerClassAlias;
	/**
	 * Demons are basically magically corrupted humans, so many of the features should remain the same.
	 * @author Harbinger
	 */
	public class Demon extends Creature
	{
		// For serialization
		registerClassAlias("EDemon", Demon);
		
		// Body part pool
		private static var SKIN:Skin = new Skin("demon", "red", "smooth, yet leathery");
		private static var HAIR:Hair = new Hair("straight, long, and black hair");
		
		public function Demon() 
		{
			trace("Demon.init()");
			super();
			height = Math.random() * 1.5 + 5;
			this.sexualPreference = SexualPreference.BISEXUAL; // Promiscuous.
			
			
			this.build = Build.AVG;
			this.hair = HAIR;
			
			this.arms.push(
				BodyPartRegistry.human_arm,
				BodyPartRegistry.human_arm
			);
			this.legs.push(
				BodyPartRegistry.human_leg,
				BodyPartRegistry.human_leg
			);
			this.assholes.push(
				BodyPartRegistry.demon_anus
			);
			skin = SKIN;
			eyes.push(BodyPartRegistry.demon_eye, BodyPartRegistry.demon_eye);
		}
		
		override public function getTypeName():String 
		{
			return "demon";
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return true;
		}
		
		override public function getInterested(subj:Creature):Boolean 
		{
			return true;
		}
		
		override public function performConversion(oldMe:Creature):void 
		{
			var i:int = 0;
			for (i = 0; i < balls.length; i++) {
				balls[i] = BodyPartRegistry.demon_testicle;
			}
			for (i = 0; i < dicks.length; i++) {
				dicks[i] = getNewDick();
			}
			for (i = 0; i < breasts.length; i++) {
				breasts[i] = BodyPartRegistry.demon_breast;
			}
			for (i = 0; i < vaginas.length; i++) {
				vaginas[i] = BodyPartRegistry.demon_vagina;
			}
			for (i = 0; i < eyes.length; i++) {
				eyes[i] = BodyPartRegistry.demon_eye;
			}
			for (i = 0; i < assholes.length; i++) {
				assholes[i] = BodyPartRegistry.demon_anus;
			}
			InfoScreen.push("<h2>PARADIGM SHIFT</h2><p>No John, you are the demons.</p>");
		}
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.human_breast;
			boob.size = MathUtils.rand(0, 3);
			breasts.push(boob);
			return boob;
		}
		
		override public function onWin(ply:Creature):Boolean 
		{
			if (getInterested(ply) && gender.hasDick) {
				// Do rape
				var enchTxt:String = "";
				var asshole:Boolean = false;
				var amtCum:Number = 0;
				
				for (var i:int = 0; i < balls.length; i++) {
					var t:Testicle = balls[i];
					enchTxt += ply.addEnchantment(t.targetFX) + "  ";
				}
				for (var idx:int = 0; idx < ply.vaginas.length; idx++) {
					if (ply.assholes[idx].pregnantWith == null) {
						ply.assholes[idx].impregnate(balls);
						asshole = true;
					}
				}
				var text:String = "<h2>YOU LOSE.</h2>";
				text += "<p>The demon grins, still panting from the heat of the battle,";
				text += " %POS% red skin glistening under the eternal glaring sun.  You slowly roll over,";
				text += " spit out a few teeth, and look up at %OBJ% warily, feeling faint from the blood";
				text += " loss. <i>Well, shit.</i>  You consider your options, but never get the chance";
				text += " to use them.</p>";
				
				text += "<p>\"Don't you just love how you can't die here, bitch?\"  %CSUB% gloats, giving you a kick";
				text += " with %POS% foot, knocking you onto your side. \"I guess you and I can have a";
				text += " little fun;  After all, I’ve got a full load.\"  The grin widens, and %POS% large,";
				text += " rock-hard cock dribbles a dark fluid onto the ground as it throbs in the air,";
				text += " making %POS% intentions clear.  You look at %POS% balls, and are suddenly terrified";
				text += " to see something moving inside them, as though full of worms. They seem to";
				text += " swell with anticipation, almost straining the skin in their need to be";
				text += " released.  %SUB% notices your gaze, and teasingly traces a finger around %POS%";
				text += " swollen orbs, keeping you pinned with a foot.";
				
				if(ply.gender.hasDick || ply.gender.hasVag)
				text +="  A surge of unwanted arousal surges through you, and you turn away, bile rising in the back of your throat.</p>";
				
				text += "<p>You manage moan in feeble protest as %SUB% rolls your limp body onto your stomach,";
				text += " and then hunches down, rubbing %POS% sweaty, leaky cock between your supple buns, pinning";
				text += " you firmly to the floor. %CSUB% shudders like a crack addict anticipating a fix.";
				text += " Then, seemingly without any effort aside from an assertive grunt, %SUB% rams %POS%";
				text += " red, veiny dick deep into your ass.  You scream as your asshole is suddenly";
				text += " stretched wide painfully, but no one is around to help.</p>";
				
				text += "<p>Now on autopilot, the demon grips you and viciously thrusts";
				text += " into you, the scalding-hot precum eliciting more painful screams as %POS% hot,";
				text += " rank breath rolls over your back. One final thrust, and %SUB%’s finished, filling";
				text += " your bowels with "+MathUtils.fmtMilliLiters(amtCum)+" of boiling-hot black semen.  %SUB% pulls out of your destroyed ass with a";
				text += " sickeningly wet pop, %POS% burning hot, black seed spilling to the floor."; 
				
				if(ply.gender.hasDick || ply.gender.hasVag) {
					text += "Unable to help yourself, you ";
					if (ply.gender.hasDick)
						text += ", too, spurt your cum onto the floor, forming a puddle.  ";
					else if (ply.gender.hasVag)
						text += "cum uncontrollably, spasming beneath the demon.  ";
				}
				
				text += "You can feel the acrid smoke from %POS% jizz curling up from your asshole.</p>";
				
				text += "<p><b>"+enchTxt+"</b></p>";
				
				text += "<p>Satisfied, the demon stands up, squirts a last bit of hot tar onto your back, and then kicks you in the head, knocking you";
				text += "unconscious.</p>";
				
				InfoScreen.push(gender.doReplace(text));
				return true;
			} else {
				return false;
			}
		}
		
		override public function initialGenderSetup():void 
		{
			var gi:int = MathUtils.rand(0, 5);
			switch(gi) {
				case 0:
				case 1:
					this.gender = Gender.MALE;
					break;
				case 2:
				case 3:
					this.gender = Gender.FEMALE;
					break;
				case 4:
				case 5:
					this.gender = Gender.HERM;
					break;
			}
			this.balls = new Vector.<Testicle>();
			this._dicks = new Vector.<Penis>();
			this.breasts = new Vector.<Breast>();
			this.vaginas = new Vector.<Vagina>();
			if(gender.hasDick) {
				this.balls.push(
					BodyPartRegistry.demon_testicle,
					BodyPartRegistry.demon_testicle
				);
				this.dicks.push(
					getNewDick()
				);
			}
			if (gender.hasVag) {				
				this.vaginas.push(
					BodyPartRegistry.demon_vagina
				);
				this.breasts.push(
					BodyPartRegistry.demon_breast,
					BodyPartRegistry.demon_breast
				);
			}
			// Cionflip to get mutations or not
			if(MathUtils.rand(0,1)==0)
				doMutations();
		}
		
		private function getNewDick():Penis {
			var wang:Penis = BodyPartRegistry.demon_penis
			wang.size += MathUtils.rand(1, 3, false);
			return wang;
		}
		
		private const mutationLocations:Array = new Array(
			"a leg",
			"%POS% chin",
			"", // the normal spot
			"an arm",
			"%POS% face"
		);
		private function doMutations():void {
			var i:int = 0;
			
			// Dick & Balls
			if(gender.hasDick) {
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					var p:Penis = null;
					switch(MathUtils.rand(0, 2))
					{
					case 0:
						p = BodyPartRegistry.human_penis;
					case 1:
						p = BodyPartRegistry.arachnid_penis;
					case 2:
						p = BodyPartRegistry.demon_penis;
					}
					p._location = MathUtils.getRandomArrayEntry(mutationLocations);
					p.size = MathUtils.rand(1, 24, false);
					this.dicks.push(t);
				}
				for (i = 0; i < MathUtils.rand(0, 3); i++) {
					var t:Testicle = null;
					switch(MathUtils.rand(0, 3))
					{
					case 0:
						t = BodyPartRegistry.human_testicle;
					case 1:
						t = BodyPartRegistry.demon_testicle;
					case 2:
						t = BodyPartRegistry.arachnid_testicle;
					case 3:
						t = BodyPartRegistry.manticore_testicle;
					}
					t._location = MathUtils.getRandomArrayEntry(mutationLocations);
					t.normalLoad = MathUtils.rand(1, 1000, false);
					t.loadMult = MathUtils.rand(1, 200, false);
					this.balls.push(t);
				}
			}
			
			// Vags & Boobs
			if(gender.hasVag) {
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					var v:Vagina = null;
					switch(MathUtils.rand(0, 2))
					{
					case 0:
						v = BodyPartRegistry.human_vagina;
					case 1:
						v = BodyPartRegistry.demon_vagina;
					case 2:
						v = BodyPartRegistry.arachnid_vagina;
					}
					v._location = MathUtils.getRandomArrayEntry(mutationLocations);
					this.vaginas.push(v);
				}
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					this.breasts.push(BodyPartRegistry.demon_breast);
				}
			}
		}
	}

}