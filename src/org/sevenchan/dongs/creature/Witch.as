package org.sevenchan.dongs.creature 
{
	import flash.net.*;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.bodyparts.Build;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.screens.WitchShopScreen;
	
	/**
	 * A travelling merchant who sell body modifications and potions.
	 * 
	 * Some are also hostile.
	 * @author N3X15
	 */
	public class Witch extends Creature 
	{
		registerClassAlias("EWitch", Witch);
		public var SKIN:Skin = new Skin("human", "pale", "wrinkled and covered in boils");
		
		public function Witch() 
		{
			trace("Witch.init()");
			super();
			this.addEnchantment(new Corruption(90));
			height = Math.random()*1.5 + 5;
			this.gender = Gender.FEMALE;
			this.build = Build.MALNOURISHED;
			this.hair = Hair.BALD;
			this.arms.push(
				BodyPartRegistry.human_arm,
				BodyPartRegistry.human_arm
			);
			this.legs.push(
				BodyPartRegistry.human_leg,
				BodyPartRegistry.human_leg
			);
			this.eyes.push(
				BodyPartRegistry.human_green_eye,
				BodyPartRegistry.human_green_eye
			);
			this.skin = SKIN;
		}
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.human_breast;
			boob.size = MathUtils.rand(0, 3);
			breasts.push(boob);
			return boob;
		}
		
		override public function initialGenderSetup():void 
		{
			this.breasts.push(
				BodyPartRegistry.human_breast,
				BodyPartRegistry.human_breast
			);
			this._assholes.push(
				BodyPartRegistry.human_anus
			);
			if(gender.hasDick) {
				this.balls.push(
					BodyPartRegistry.human_testicle,
					BodyPartRegistry.human_testicle
				);
				this.dicks.push(
					BodyPartRegistry.human_penis
				);
				breasts[0].size=0;
				breasts[1].size=0;
			}
			if(gender.hasVag) {
				this.vaginas.push(
					BodyPartRegistry.human_vagina
				);
				breasts[0].size=breasts[1].size=MathUtils.rand(0,5);
			}
			customized = false;
		}
		
		override public function getTypeName():String 
		{
			return "witch";
		}
		
		override public function onEncounter(ply:Creature):Boolean 
		{
			if(ply!=null)
				WitchShopScreen.push();
			return true;
		}
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return false;
		}
		
		override public function getInterested(subj:Creature):Boolean 
		{
			return false;
		}
	}

}