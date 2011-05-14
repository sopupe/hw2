package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.ability.Spore;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * Mushroom-bitch
	 * 
	 * Abilities:
	 * 	Spore - Releases a cloud of spores from head
	 * 
	 * @author N3X15
	 */
	public class Morel extends Creature 
	{
		
		public function Morel() 
		{
			
			trace("Morel.init()");
			super();
			height = Math.random() * 1.5 + 5;
			this.sexualPreference = SexualPreference.ASEXUAL;
			this.build = Build.AVG;
			this.hair = new Hair("mushroom cap");
			gender = Gender.ASEXUAL;
			this.arms = [
				BodyPartRegistry.arms.human,
				BodyPartRegistry.arms.human,
			];
			this.legs = [];
			this.assholes = [];
			inventory = [];
			skin = new Skin("morel", "pasty white", "soft but dusty");
			eyes = [Eye.BROWN, Eye.BROWN];
			
			this.abilities={spore:new Spore()};
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			strength += 2;
			return true;
		}
		
		override public function getTypeName():String 
		{
			return "morel";
		}
		
		
		override public function combatDescr(subj:Creature):String 
		{
			var text:String = "<p>During your exploration, begin to smell a dry, powdery odor, not unlike moldy bread.";
			text += " Following the scent, you find a large mushroom in a clearing.  Suddenly, you realize that it has ";
			text += "a woman's body, but without the genetalia.  %CSUB% turns to you, a thin, simple smile forming on %POS% lips.  &quot;Ah, another victim...&quot; %SUB% rasps dryly.</p>";
			return gender.doReplace(text);
		}
		
		override public function onWin(ply:Creature):Boolean 
		{
			var text:String = "<h2>YOU LOSE</h2><p>You drop to the ground, and the mushroom's root-like hyphae grow into your body and eventually cover your in a white, fibrous cocoon.";
			text += "You feel like you are being drained of everything, even your mouth feels dry, and any lust you had fades away as the fluids and hormones are drained from your genitals.";
			text += " Tired, you drift off to a dreamless sleep as your body is sucked bone-dry.</p>";
			text += "<p>You awaken back at the barn and hurriedly drink from the handpump, feeling restored otherwise.</p>";
			InfoScreen.push(text);
			ply.lust = 0;
			return true;
		}
		
		override public function onLose(ply:Creature):Boolean 
		{
			return super.onLose(ply);
		}
	}

}