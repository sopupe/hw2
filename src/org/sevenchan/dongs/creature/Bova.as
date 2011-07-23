package org.sevenchan.dongs.creature 
{
	import flash.net.*;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.*;
	
	/**
	 * Cowgirl
	 * 
	 * Friendly creature that sells milk and sex, although
	 * sex without a gas mask = you turn into a cowgirl.
	 * @author N3X15
	 */
	public class Bova extends Creature 
	{
		
		registerClassAlias("EBova", Bova);
		public var SKIN:Skin = new Skin("human", "light", "smooth");
		
		public function Bova() 
		{
			trace("Bova.init()");
			super();
			height = Math.random()*1.5 + 5;
			switch(Math.round(MathUtils.rand(0, 1))) {
				case 0:
					this.gender = Gender.MALE;
					break;
				case 1:
					this.gender = Gender.FEMALE;
					break;
				case 2:
					this.gender = Gender.HERM;
					break;
			}
			this.build = Build.AVG;
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
				BodyPartRegistry.human_blue_eye,
				BodyPartRegistry.human_blue_eye
			);
			this.skin = SKIN;
		}
		
		override public function addBreast():void 
		{
			breasts.push(BodyPartRegistry.human_breast);
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
				this.addDick();
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
			return "bova";
		}
		
		override public function addDick(type:String="default"):Penis 
		{
			var penis:Penis = BodyPartRegistry.human_penis;
			penis.size = 6 + MathUtils.rand(0, 12);
			this._dicks.push(penis);
			return penis;
		}
		
		override public function onEncounter(ply:Creature):Boolean 
		{
			if (ply != null) // Debug screen checking to see if encounters are possible
			{
				// Encounter screen
			}
			return true;
		}
		
	}

}