package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.*;
	
	/**
	 * http://www.monstropedia.org/index.php?title=Manticore
	 * 
	 * The manticore, considered to be the most dangerous predator in Asia, has the body of a lion and a head with human. 
	 * The beast is also known as the "manticora", the "mantichor", for short "manty" or by a folk etymology, even the "mantiger".
	 * 
	 * Physically, the manticore was know as having the body of a red lion, the face and ears of a blue eyes human and a tail 
	 * ending in a sting like that of a scorpion. The mouth contains three rows of razor-sharp teeth and poisoned spines along the 
	 * tail could be shot, like arrows in any direction. The manticore was also attributed with having a voice that was the mixture 
	 * of pipes and a trumpet. The beast is very swift and makes very powerful leaps. Occasionally, a manticore will possess 
	 * wings of some description. Size reports range from lion-sized up to horse-sized.
	 * 
	 * Shoots poisonous spines, plays tricks, etc.
	 *
	 *  FINAL APPEARANCE
	 * 
	 *  - Lion body
	 *  - Human head (3 rows of teeth)
	 *  - Scorpion tails
	 *  - Quadriped
	 * 
	 *  BEHAVIOR
	 *  
	 *  Likes playing tricks on people, will attack anyone with corruption > 45
	 * 
	 *  SEXUALITY
	 *  
	 *  Bisexual, will leave invitations around if it's interested.
	 * 
	 * @author Harbinger
	 */
	public class Manticore extends Creature 
	{
		
		public function Manticore() 
		{
			super();
			legs.push(
				BodyPartRegistry.manticore_leg,
				BodyPartRegistry.manticore_leg
			);
			arms.push(
				BodyPartRegistry.manticore_arm,
				BodyPartRegistry.manticore_arm
			);
			//tails.push(
			//	BodyPartRegistry.manticore_tail
			//);
			skin = new Skin("manticore", "red", "furry");
			this._assholes.push(BodyPartRegistry.human_anus);
			this._eyes.push(BodyPartRegistry.human_blue_eye, BodyPartRegistry.human_blue_eye);
			switch(MathUtils.rand(0, 2))
			{
				case 0:	this._gender = 	Gender.MALE; break;
				case 1:	this._gender = 	Gender.FEMALE; break;
				case 2:	this._gender = 	Gender.HERM; break;
			}
			this._intellect = 30;
			this._gold = MathUtils.rand(300, 400);
			//this.abilityUseProbability = 0.01;
			//abilities["sting"] = new Sting();
		}
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.manticore_breast;
			boob.size = 0;
			_breasts.push(boob);
			return boob;
		}
		
		override public function addDick(type:String = "default"):Penis 
		{
			//(21:39:41) eels: giant cawk
			//(21:39:53) Harbinger: define giant
			//(21:40:15) eels: Tomahawk missile
			//(21:40:23) Harbinger: ok
			//(21:40:40) Harbinger: So he polevaults every time he runs basically
			//(21:40:49) eels: It's part of his charm
			var dick:Penis = BodyPartRegistry.human_penis;
			dick.size = MathUtils.rand(100,150);
			_dicks.push(dick);
			return dick;
		}
		
		override public function initialGenderSetup():void 
		{
			addBreast();
			addBreast();
			if (gender.hasDick)
			{
				this.addDick();
				this.balls.push(
					BodyPartRegistry.manticore_testicle,
					BodyPartRegistry.manticore_testicle
				);
			}
			if (gender.hasVag)
			{
				breastDelta(MathUtils.rand(0, 4),false);
				vaginas.push(BodyPartRegistry.human_vagina);
			}
			super.initialGenderSetup();
		}
		
		override public function getTypeName():String 
		{
			return "manticore";
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return false;
		}
		override public function onEncounter(ply:Creature):Boolean
		{
			if (ply == null)
			return true;
			if(getHostile(ply))
				return false;
			
				var story:String = <![CDATA[
<p>
	You've been moving through underbrush for hours now, and there are so many bugs in and around your person that you swear it's 
	only matter of time before they start building apartments and begin electing a mayor.  None of which helps the fact that 
	you're hopelessly lost.  A heavy sigh escapes your lips, and you settle onto a nearby stump to take a break. 
</p>
<p>
	An hour later, you wake up with a start, not remembering when or how you fell asleep.  Worried, you cautiously check yourself, and 
	become even more confused when you find no unexplained injuries, marks, or stains.  Well, beyond the scratches caused by moving 
	through	thorny brush.  You check your bag for stolen items and find nothing missing. 
</p>
<p>
	You do, however, find {SOMETHING RANDOM} in your pocket.  You scratch your head in confusion, and then {ACTION}. 
	You swear you hear faint, tittering laughter coming from the canopy. 
</p>
]]>.toString();
			if (ply.intellect > 40) {
				story += <![CDATA[
<p>
	<i>Damn Manticores.</i>
</p>
				]]>.toString();
			}
			var interestedObjects:Array = new Array(
				"a small box of chocolates",
				"a crushed rose",
				"a limp lily",
				"a new dildo"
			);
			var uninterestedObjects:Array = new Array(
				"a large clump of red hair",
				"a smushed glazed doughnut",
				"a small rubber snake",
				"a used dildo",
				ItemRegistry.GAS_MASK
			);
			
			var objArray:Array = uninterestedObjects;
			if (getInterested(ply))
				objArray = interestedObjects;
				
			var o:*= MathUtils.getRandomArrayEntry(objArray);
			var repl:String = "";
			var action:String = "";
			if (o is String)
			{
				// Something useless
				repl = o as String;
				action = "dispose of it";
			} else if(o is Item){
				var i:Item = (o as Item);
				repl = Utils.A(i.name) + " " + i.name;
				action = "stuff it into your backpack";
			}
			InfoScreen.push(story.replace("{SOMETHING RANDOM}", repl).replace("{ACTION}", action));
			return true;
		}
	}

}