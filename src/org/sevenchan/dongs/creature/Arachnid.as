package org.sevenchan.dongs.creature 
{
	import flash.text.engine.BreakOpportunity;
	import org.sevenchan.dongs.bodyparts.asshole.Abdomen;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.items.SpiderVenomSac;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * Spiderbitch, spiderbitch, does whatever a spiderbitch does...
	 * Will she suck, on a dick?  Goddamnit I dunno.
	 * Watch out, here comes a spiderbitch.
	 * 
	 * Based off of MGE's Arachne.  Loosely, as I cannot read moonspeak.
	 * 
	 * @author N3X15
	 */
	public class Arachnid extends Creature
	{
		// For serialization
		registerClassAlias("EArachnid", Arachnid);
		
		private var SMALLEYE:Eye = new Eye("small Arachnid", "black", "segment");
		private var EYE:Eye = new Eye("human-ish Arachnid", "red", "round");
		private var BOOB:Breast = new Breast("Arachnid");
		private var LEG:Leg = new Leg("Arachnid");
		private var isQueen:Boolean = false;
		public function Arachnid(queen:Boolean) 
		{		
			isQueen = queen;
		}
		
		override public function initialGenderSetup():void 
		{
			assholes = [new Abdomen("Arachnid")];
			eyes = [
				SMALLEYE,SMALLEYE,
				SMALLEYE,SMALLEYE,
				SMALLEYE,SMALLEYE,
				EYE,EYE
			];
			this.build = Build.AVG;
			this.legs = [
				LEG,LEG,
				LEG,LEG,
				LEG,LEG,
				LEG,LEG,
			];
			this.arms = [
				Arm.HUMAN,Arm.HUMAN
			];
			
			this.hair = new Hair("long, silky, white hair");
			this.gender = Gender.FEMALE;
			this.sexualPreference = SexualPreference.STRAIGHT;
			
			if (gender.hasVag) {
				breasts = [Breast.HUMAN, Breast.HUMAN];
				vaginas = [new Vagina("Arachnid")];
			}
			if (gender.hasDick) {
				dicks = [new Penis("Arachnid", 12 + MathUtils.rand(0, 6))];
				var testicle:Testicle = new Testicle("internal testes", 3785,null,null,"hot, thick mixture of semen and eggs");
				balls = [testicle,testicle];
			}
			inventory = [new SpiderVenomSac(1)];
		}
		
		override public function combatDescr(ply:Creature):String 
		{
			ply.lust += 2;
			return "<p>While exploring the area, you suddenly come across many large spiderwebs. You brush through them, when you hear something scuttle through the brush behind you. Worried, you slowly turn around, and see "+getDescription();
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return true;
		}
		
		override public function getTypeName():String 
		{
			return "Arachnid";
		}
		
		override public function onWin(ply:Creature):Boolean 
		{
			var text:String = "<h2>YOU LOSE</h2>";
			
			if (ply.gender.hasDick && gender.hasVag) {
				var amtCum:Number = 0;
				for (var i:int = 0; i < ply.balls.length; i++) {
					(ply.balls[i] as Testicle).loadMult += 1;
					var t:Testicle = ply.balls[i];
					amtCum+=t.loadMult * t.normalLoad;
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
				text += "arms, somehow without opening your veins. &quot;Hopeffffully thissss ";
				text += "will help...&quot;</p>";

				text += "<p>%CSUB% slowly moves away. &quot;You will ssssleeep now. I hope you ";
				text += "ffforgive me, and maybe we will meet again...&quot; %CSUB% vanishes into ";
				text += "the underbrush, and the world fades to black as you pass out.</p>";
				
				text += "<p><b>Your semen output has increased by 1, bringing your total seminal volume to " + MathUtils.fmtMilliLiters(amtCum) + ".</b></p>";
				text += "<p>You will now gain lust faster.</p>";
				InfoScreen.push(gender.doReplace(text));
				return true;
			} else if(gender.hasDick) {
				text += "<p><b>TODO: Story about Arachnid w/dick droppan babies into your butt</b></p>";
				var eggs:String = "Arachnid eggs";
				for (var idx:int = 0; idx < ply.assholes.length; idx++) {
					if((ply.assholes[idx] as Asshole).pregnantWith==null) {
						(ply.assholes[idx] as Asshole).timesFucked++;
						(ply.assholes[idx] as Asshole).volumeFilled = amtCum;
						if (amtCum > (ply.assholes[idx] as Asshole).capacity)
							eggs+=" <b>Your belly has swelled to accomodate the sheer volume.</b>";
						(ply.assholes[idx] as Asshole).filledWith = eggs;
						(ply.assholes[idx] as Asshole).pregnantWith = new Arachnid(false);
						(ply.assholes[idx] as Asshole).pregCounter = 100;
					}
				}
				InfoScreen.push(gender.doReplace(text));
				return true;
			}
			return false;
		}
	}

}