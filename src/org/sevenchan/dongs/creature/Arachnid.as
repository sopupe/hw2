package org.sevenchan.dongs.creature
{
	import org.sevenchan.AdventureController;
	import flash.net.*;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.screens.encounters.ArachnidEncounter;
	
	/**
	 * Spiderbitch, spiderbitch, does whatever a spiderbitch does...
	 * Will she suck, on a dick?  Goddamnit I dunno.
	 * Watch out, here comes a spiderbitch.
	 *
	 * Based off of MGE's Arachne.  Loosely, as I cannot read moonspeak.
	 *
	 * @author Harbinger
	 */
	public class Arachnid extends Creature
	{
		// For serialization
		registerClassAlias("EArachnid", Arachnid);
		
		private var isPregnant:Boolean = false;
		
		public function Arachnid(pregnant:Boolean)
		{
			super();
			isPregnant = pregnant;
			if (pregnant)
				gender = Gender.HERM;
			else
				gender = Gender.FEMALE;
		}
		
		override public function initialGenderSetup():void 
		{
			assholes.push(BodyPartRegistry.arachnid_anus);
			eyes.push(
				BodyPartRegistry.arachnid_small_eye,BodyPartRegistry.arachnid_small_eye,
				BodyPartRegistry.arachnid_small_eye,BodyPartRegistry.arachnid_small_eye,
				BodyPartRegistry.arachnid_small_eye,BodyPartRegistry.arachnid_small_eye,
				BodyPartRegistry.arachnid_big_eye,BodyPartRegistry.arachnid_big_eye
			);
			this.build = Build.AVG;
			this.legs.push(
				BodyPartRegistry.arachnid_leg,BodyPartRegistry.arachnid_leg,
				BodyPartRegistry.arachnid_leg,BodyPartRegistry.arachnid_leg,
				BodyPartRegistry.arachnid_leg,BodyPartRegistry.arachnid_leg,
				BodyPartRegistry.arachnid_leg,BodyPartRegistry.arachnid_leg
			);
			this.arms.push(
				BodyPartRegistry.human_arm,
				BodyPartRegistry.human_arm
			);
			
			this.hair = new Hair("long, silky, white hair");
			//this.gender = Gender.FEMALE;
			this.sexualPreference = SexualPreference.STRAIGHT;
			
			if (gender.hasVag)
			{
				breasts.push(BodyPartRegistry.human_breast, BodyPartRegistry.human_breast);
				vaginas.push(BodyPartRegistry.arachnid_vagina);
			}
			inventory = new Vector.<Item>();
			if (gender.hasDick)
			{
				addDick("arachnid");
				balls.push(BodyPartRegistry.arachnid_testicle, BodyPartRegistry.arachnid_testicle);
				for each (var t:Testicle in balls)
				{
					t.loadMult = 10;
				}
				inventory.push(new SpiderEgg(2));
			}
			inventory.push(new SpiderVenomSac(1));
			
			var wangTemplate:Penis = BodyPartRegistry.human_penis;
			wangTemplate._location = "face as a beard";
			for (var i:Number = 0; i < 20; i++)
			{
				dicks.push(wangTemplate);
			}
		}
		
		override public function addDick(type:String = "default"):Penis
		{
			var p:Penis = Penis(BodyPartRegistry.arachnid_penis);
			p.size = 12 + MathUtils.rand(0, 12);
			p._location = "vagina";
			this.dicks.push(p);
			return p;
		}
		
		override public function onEncounter(ply:Creature):Boolean
		{
			if (getHostile(ply))
				return false;
			ArachnidEncounter.push(this);
			return true;
		}
		
		override public function onRape(ply:Creature,rapeEncounter:Rape):void
		{
			var rapeText:String = "";
			if (!ply.getExplored("sexedArachnid"))
			{
				ply.setExplored("sexedArachnid");
				
				var amtCum:Number = 0;
				for (var i:int = 0; i < ply.balls.length; i++)
				{
					(ply.balls[i] as Testicle).loadMult += 1;
					var t:Testicle = ply.balls[i];
					amtCum += t.loadMult * t.normalLoad;
				}
				rapeText = "<p>The arachnid is positively delighted, bobbing up and and down happily on her giant, plated legs. &quot;";
				rapeText += "Oh, I cannot tell you how happy this makes me!&quot; She gushes, and hugs you, her naked breasts pressed ";
				rapeText += "against your body.  Her nipples are so stiff that you can count them.  You embrace her upper body, as well, ";
				rapeText += "with an awkwardness you have never felt before in your life.</p>";
				
				rapeText += "<p>And then you feel her fangs dig into your neck. <i>Shit.</i> ";
				rapeText += "&quot;It'sssss all right,&quot; %CSUB% whispers in a thick accent, ";
				rapeText += "a silky hand stroking your cheek softly. %CSUB% kisses the wound, a blush ";
				rapeText += "slowly spreading across %POS% face as %SUB% becomes more aroused. ";
				rapeText += "&quot;You’ll be fffine, do not be worried.&quot;</p>";
				
				rapeText += "<p>After stripping you of any clothing, %SUB% pulls webbing from %POS% abdomen ";
				rapeText += "and wraps you tightly in it, sparing your nose, eyes, and your dick, and ";
				rapeText += "then anchors you to the floor. Seeing your flaccid dick, %SUB% leans over ";
				rapeText += "and brushes it between %POS% large breasts and licks it hungrily. When ";
				rapeText += "it’s satisfiably hard, %SUB% takes a few steps forwards and %POS% body ";
				rapeText += "descends, your dick disappearing into %POS% wet, needy pussy. Quietly, %SUB% ";
				rapeText += "begins to repeatedly plunge you into %POS% sticky depths, and you find ";
				rapeText += "yourself enjoying it, aside from the claustrophobic webbing and poison ";
				rapeText += "keeping you still.</p>";
				
				rapeText += "<p>As soon as the first wave of precum enters %POS% body, %POS% entire abdomen ";
				rapeText += "begins pulsing, the powerful muscles milking your dick. %CSUB% reaches down ";
				rapeText += "and pulls you tighter to %POS% body. %CSUB% bites you again, and your balls ";
				rapeText += "go into overdrive, pumping more semen into %POS% thrusting body. The ";
				rapeText += "pleasure is unbearable, and %POS% cunt feels amazing, despite how ";
				rapeText += "terrifying the entire situation is. After a few minutes, the flow stops, ";
				rapeText += "and %SUB% releases you. &quot;Sssso ssssorry ffffor the trouble,&quot; ";
				rapeText += "%SUB% apologizes, a clawed foot cutting slits into the webbing around your ";
				rapeText += "arms, somehow without opening your veins. You realize that she is helping you ";
				rapeText += "get lose of the webbing once the neurotoxin is gone from your body. &quot; ";
				rapeText += "Hopeffffully thissss will help...&quot;</p>";
				
				rapeText += "<p>%CSUB% slowly moves away. &quot;You will ssssleeep now. I hope you ";
				rapeText += "ffforgive me, and maybe we will meet again...&quot; %CSUB% vanishes into ";
				rapeText += "the underbrush, and the world fades to black as you pass out.</p>";
				
				rapeText += "<p><b>Your semen output has increased by 1, bringing your total seminal volume to " + MathUtils.fmtMilliLiters(amtCum) + ".</b></p>";
				rapeText += "<p>You will now gain lust faster.</p>";
				
			}
			else
			{
				// TODO Sex menu if sexedArachnid == true
				rapeText += "<i>[TODO: Sex menu AFTER getting dateraped by Arachnid.  Soz.]</i>";
			}
			rapeEncounter.setText(rapeText);
		}
		
		private var offered:Boolean = false;
		
		override public function combatDescr(ply:Creature):String
		{
			ply.lust += 2;
			var text:String = "";
			if (!offered)
			{
				text += "<p>While exploring the area, you suddenly come across many large spiderwebs. ";
				text += "You brush through them, when you hear something scuttle through the brush ";
				text += "behind you. Worried, you slowly turn around, and see a beautiful woman.  ";
			}
			else
			{
				text += "<p>The Arachnid stands in a ready stance, legs poised to move at a moment's notice, and her front legs and arms ready to lash out.  ";
			}
			text += "Or at least, the top half of one atop the body of a enormous black spider, ";
			text += "and if women had 8 red, gleaming eyes. ";
			if (gender.hasDick)
			{
				text += "Her abdomen seems greatly swollen, bulging with eggs.  Her eyes roll crazily ";
				text += " in her head, as though she has lost control of herself. A strange, sticky fluid drips";
				text += " from the rear of her abdomen.";
			}
			else
			{
				text += "She seems sad about fighting you, considering she offered herself to you.  However, she seems determined to win.  Her pussy drips on the ground, and her nipples stand erect.";
				if (ply.getExplored("sexedArachnid"))
					text += "You aren't fooled by her sorrowful demeanor, considering one of her kind paralyzed you after you gave in to her demands.";
			}
			text += "</p>";
			return text;
		}
		
		override public function getHostile(subj:Creature):Boolean
		{
			return (gender.hasDick);
		}
		
		override public function getTypeName():String
		{
			return (isPregnant) ? "Pregnant Arachnid" : "Arachnid";
		}
		
		override public function onWin(ply:Creature):Boolean
		{
			var text:String = "<h2>YOU LOSE</h2>";
			
			if (ply.gender.hasDick && gender == Gender.FEMALE)
			{
				if (ply.getExplored("lostToArachnid"))
					ply.setExplored("lostToArachnid");
				
				var amtCum:Number = 0;
				for (var i:int = 0; i < ply.balls.length; i++)
				{
					(ply.balls[i] as Testicle).loadMult += 1;
					var t:Testicle = ply.balls[i];
					amtCum += t.loadMult * t.normalLoad;
				}
				text += "<p>Seeing weakness, the Arachnid surges forward and bites your neck. You ";
				text += "punch %POS% in %POS% own neck, causing %POS% to break from you, but it’s too ";
				text += "late. Neurotoxins surge through your veins, and your attacks become ";
				text += "increasingly feeble as you fight. A sad smile crosses %POS% face as you ";
				text += "sink to the ground, becoming increasingly numb and %SUB% moves closer, ";
				text += "pulling you up to %POS% chest to caress your limp body. &quot;Yessss, now ";
				text += "you see it is uselesssss to fight.&quot; %CSUB% whispers in a thick accent, ";
				text += "a silky hand stroking your cheek softly. %CSUB% kisses the wound, a blush ";
				text += "slowly spreading across %POS% face as %SUB% becomes more aroused. ";
				text += "&quot;You’ll be fffine, do not be worried.&quot;</p>";
				
				text += "<p>After stripping you of any clothing, %SUB% pulls webbing from %POS% abdomen ";
				text += "and wraps you tightly in it, sparing your nose, eyes, and your dick, and ";
				text += "then anchors you to the floor. Seeing your flaccid dick, %SUB% leans over ";
				text += "and brushes it between %POS% large breasts and licks it hungrily. When ";
				text += "it’s satisfiably hard, %SUB% takes a few steps forwards and %POS% body ";
				text += "descends, your dick disappearing into %POS% wet, needy pussy. Quietly, %SUB% ";
				text += "begins to repeatedly plunge you into %POS% sticky depths, and you find ";
				text += "yourself enjoying it, aside from the claustrophobic webbing and poison ";
				text += "keeping you still.</p>";
				
				text += "<p>As soon as the first wave of precum enters %POS% body, %POS% entire abdomen ";
				text += "begins pulsing, the powerful muscles milking your dick. %CSUB% reaches down ";
				text += "and pulls you tighter to %POS% body. %CSUB% bites you again, and your balls ";
				text += "go into overdrive, pumping more semen into %POS% thrusting body. The ";
				text += "pleasure is unbearable, and %POS% cunt feels amazing, despite how ";
				text += "terrifying the entire situation is. After a few minutes, the flow stops, ";
				text += "and %SUB% releases you. &quot;Sssso ssssorry ffffor the trouble,&quot; ";
				text += "%SUB% apologizes, a clawed foot cutting slits into the webbing around your ";
				text += "arms, somehow without opening your veins. You realize that she is helping you ";
				text += "get lose of the webbing once the neurotoxin is gone from your body. &quot; ";
				text += "Hopeffffully thissss will help...&quot;</p>";
				
				text += "<p>%CSUB% slowly moves away. &quot;You will ssssleeep now. I hope you ";
				text += "ffforgive me, and maybe we will meet again...&quot; %CSUB% vanishes into ";
				text += "the underbrush, and the world fades to black as you pass out.</p>";
				
				text += "<p><b>Your semen output has increased by 1, bringing your total seminal volume to " + MathUtils.fmtMilliLiters(amtCum) + ".</b></p>";
				text += "<p>You will now gain lust faster.</p>";
				InfoScreen.push(gender.doReplace(text));
				return true;
			}
			else if (gender.hasDick)
			{
				var rectum:String = (ply.gender.hasVag) ? "birth canal and into your womb" : "rectum";
				var enchTxt:String = "";
				var asshole:Boolean = false;
				text = "<p>You collapse to the ground";
				text += " once again,";
				text += " defeated and exhausted.  Blood drips from seemingly every part of your body, and you " + "look up at the creature through a single swollen eye.  ";
				if (HP < maxHP)
				{
					text += "She isn't unscatched herself, gashes and dents mar her exoskeleton and ";
					text += "humanlike upper body.";
				}
				else
				{
					text += "She is completely unscratched, her maniacal grin accentuating her ";
					text += "complete victory."
				}
				text += "</p><p>She shivers, arching her thin upper body as a thick, ";
				text += MathUtils.inchesToFootInches(dicks[0].size) + "-long cock erupts from her ";
				text += "abdomen and hardens into a throbbing, swollen shaft.  You stare at it in ";
				text += "pure horror.  She steps forward, eliciting an immediate flee reaction from ";
				text += "you.  It doesn't last long, as you trip over one of her long legs and are ";
				text += "then pinned to the ground.  You try to struggle, but you're weak and a ";
				text += "pinprick at the base of your neck halts any movement.</p>";
				
				text += "<p>You feel her lower herself down, and try to scream as she roughly slides";
				text += " her ovipositor deep into your " + rectum + " painfully, getting thicker as it ";
				text += "intrudes further, spreading you wider and wider until it hilts against her ";
				text += "swollen abdomen.  Her ovpositor begins swelling with eggs passing into your ";
				text += "body.  You can feel the leathery bags being deposited into you.</p>";
				
				text += "<p>The pain becomes too much and, mercifully, you pass out.</p>";
				var idx:int = 0;
				if (!ply.gender.hasVag)
				{
					for (idx = 0; idx < ply.assholes.length; idx++)
					{
						if ((ply.assholes[idx]).pregnantWith == null)
						{
							ply.assholes[idx].impregnate(balls);
							text += "<p><b>Your " + ply.assholes[idx].getShortDescr() + " is now ";
							text += "pregnant.</p></b>";
							break;
						}
					}
				}
				else
				{
					for (idx = 0; idx < ply.vaginas.length; idx++)
					{
						if ((ply.vaginas[idx]).pregnantWith == null)
						{
							ply.vaginas[idx].impregnate(balls);
							text += "<p><b>Your " + ply.vaginas[idx].getShortDescr() + " is now ";
							text += "pregnant.</p></b>";
							break;
						}
					}
				}
				InfoScreen.push(gender.doReplace(text));
				
				for (var ii:int = 0; ii < balls.length; ii++)
				{
					var tt:Testicle = balls[ii];
					enchTxt += ply.addEnchantment(tt.targetFX) + "  ";
				}
				return true;
			}
			return false;
		}
	}

}