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
	 * 
	 * Should add in some mutations, though.
	 * @author N3X15
	 */
	public class Demon extends Creature
	{
		// For serialization
		registerClassAlias("EDemon", Demon);
		
		// Body part pool
		private static var ASSHOLE:Asshole = new Asshole("demon");
		private static var DICK:Penis = new Penis("demon",10,new Corruption(1),null);
		private static var BALL:Testicle = new Testicle("demon nut",38,new Corruption(10),null,"boiling-hot, sticky black substance");
		private static var BOOB:Breast = new Breast("demon");
		private static var VAGINA:Vagina = new Vagina("demon");
		private static var EYE:Eye = new Eye("demon", "amber", "slit");
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
			
			this.arms = [
				Arm.HUMAN,
				Arm.HUMAN,
			];
			this.legs = [
				Leg.HUMAN,
				Leg.HUMAN
			];
			this.assholes = [
				ASSHOLE
			];
			skin = SKIN;
			eyes = [EYE, EYE];
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
				balls[i] = BALL;
			}
			for (i = 0; i < dicks.length; i++) {
				dicks[i] = getNewDick();
			}
			for (i = 0; i < breasts.length; i++) {
				breasts[i] = BOOB;
			}
			for (i = 0; i < vaginas.length; i++) {
				vaginas[i] = VAGINA;
			}
			for (i = 0; i < eyes.length; i++) {
				eyes[i] = EYE;
			}
			for (i = 0; i < assholes.length; i++) {
				assholes[i] = ASSHOLE;
			}
			InfoScreen.push("<h2>PARADIGM SHIFT</h2><p>No John, you are the demons.</p>");
		}
		
		override public function onWin(ply:Creature):Boolean 
		{
			if (getInterested(ply) && gender.hasDick) {
				// Do rape
				
				var amtCum:Number = 0;
				var enchTxt:String = "";
				var semen:String = (balls[0] as Testicle).semen;
				var asshole:Boolean = true;
				for (var i:int = 0; i < balls.length; i++) {
					var t:Testicle = balls[i];
					enchTxt += ply.addEnchantment(t.targetFX)+"  ";
					amtCum+=t.loadMult * t.normalLoad;
				}
				for (var idx:int = 0; idx < ply.vaginas.length; idx++) {
					if((ply.assholes[idx] as Asshole).pregnantWith==null) {
						(ply.assholes[idx] as Asshole).timesFucked++;
						(ply.assholes[idx] as Asshole).volumeFilled = amtCum;
						if (amtCum > (ply.assholes[idx] as Asshole).capacity)
							semen+=" <b>Your belly has swelled to accomodate the sheer volume.</b>";
						(ply.assholes[idx] as Asshole).filledWith = semen;
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
			trace("DEMON GENDER SAMPLE", gi);
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
			if(gender.hasDick) {
				this.balls = [
					BALL,BALL
				];
				this.dicks = [
					DICK,
				];
			}
			if (gender.hasVag) {				
				this.vaginas = [
					VAGINA
				];
				this.breasts = [
					BOOB,BOOB
				];
			}
			doMutations();
		}
		
		private function getNewDick():Penis {
			var wang:Penis = DICK;
			wang.size += MathUtils.rand(1, 3, false);
			return wang;
		}
		
		private function doMutations():void {
			var i:int = 0;
			
			// Dick & Balls
			if(gender.hasDick) {
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					this.dicks.push(getNewDick());
				}
				for (i = 0; i < MathUtils.rand(0, 3); i++) {
					this.balls.push(BALL);
				}
			}
			
			// Vags & Boobs
			if(gender.hasVag) {
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					this.vaginas.push(VAGINA);
				}
				for (i = 0; i < MathUtils.rand(0, 2); i++) {
					this.breasts.push(BOOB);
				}
			}
		}
		
		public static function replaceDialogue(s:String, g:Gender):String {
			var it:Boolean = g == Gender.ASEXUAL;
			// 'e, she, shi, it
			s = demonify(s,/%DMON_SUB%/g, 							g.subject,		(it||g==Gender.FEMALE));
			s = demonify(s,/%DMON_CSUB%/g, StringTools.capitalize(	g.subject),		(it||g==Gender.FEMALE));
			// 'im, 'er, 'ir, it
			s = demonify(s,/%DMON_(C?)SUB%/g, 						g.objective,	it);
			// 'imself, 'erself, 'irself, itself
			s = demonify(s,/%DMON_(C?)REF%/g, 						g.reflexive,	it);
			// 'is, 'er, its
			s = demonify(s,/%DMON_(C?)POS%/g, 						g.possessive,	it);
			// 'is, 'ers, its
			s = demonify(s,/%DMON_(C?)PP%/g, 						g.possessivePronoun,	it);
			return s;
		}
		
		private static function demonify(str:String, reg:*, wif:String, asOrig:Boolean):String {
			return str.replace(reg, asOrig ? wif : "'" + wif.substr(1));
		}
	}

}