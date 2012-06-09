package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.enchantment.*;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class OldSpaceGuy extends Creature 
	{
		
		public function OldSpaceGuy() 
		{
			super();
			ownName = "OLDSPACE GUY";
			//this.abilities = {};
			this.arms.push(
				new Arm("expensive", null, null),
				new Arm("expensive", null, null)
			);
			this.legs.push(
				new Leg("sexy black"),
				new Leg("sexy black")
			);
			var t:Testicle = new Testicle("black ball", 100, new Instakill("turns you into a pile of diamonds, from which erupts a large stick of OldSpace deodorant."), null, "white, nice-smelling fluid");
			this.balls.push(t,t);
			this.build = Build.PRETTYSTRONG;
			this.dicks.push(
				new Penis("stick of OldSpace", 12, new Paralyze(), null)
			);
			this.gender = Gender.MALE;
			this.sexualPreference = SexualPreference.STRAIGHT;
			this.gold = 350;
			this.height = 6.6;
			this.skin = new Skin("congoid", "black", "smooth");
			this.eyes.push(BodyPartRegistry.human_brown_eye, BodyPartRegistry.human_brown_eye);
			
			
			this.strength = 20;
		}
		
		
		override public function getTypeName():String 
		{
			return "OldSpace Guy";
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return true;
		}
		
		override public function onWin(ply:Creature):Boolean 
		{
			if (getInterested(ply)) {
				var txt:String = "<h2>YOU LOSE</h2>";
				txt += "<p>The OldSpace Guy stands over your bloody body, triumphant and, as always, grinning like an idiot.  \"You are a lady,\" he announces. </p> "
				txt += "<p><i>Oh god, he's going to rape me.</i> You realize, and weakly try to move away.  He steps on your arm, pinning it to the sand.</p>";
				txt += "<p>\"Why not try OldSpace for Women?  Even ladies don't like to smell like ladies.\" He responds, and he grabs your other arm, lifting both arms above your head. You start screaming, but he ignores you as he moves you closer to his stick.</p>";
				txt += "<p>You then realize his dick is rubbing against your armpit. <i>What the fuck?</i> It DOES smell better, but you have no idea why, and you're still terrified.  After fucking both armpits, he screams, \"I'M ON A HORSE\".  He rides off into the sunset, taking 30 gold with him.  You, confused and horny, pass out.</p>";
				InfoScreen.push(txt);
				return true;
			} else {
				return false;
			}
		}
	}

}