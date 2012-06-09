package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import flash.net.registerClassAlias;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Human extends Creature 
	{
		registerClassAlias("EHuman", Human);
		public var SKIN:Skin = new Skin("human", "light", "smooth");
		
		public function Human() 
		{
			trace("Human.init()");
			super();
			height = Math.random()*1.5 + 5;
			switch(Math.round(MathUtils.rand(0, 1))) {
				case 0:
					this.gender = Gender.MALE;
					break;
				case 1:
					this.gender = Gender.FEMALE;
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
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.human_breast;
			boob.size = MathUtils.rand(0, 3);
			breasts.push(boob);
			return boob;
		}
		
		override public function initialGenderSetup():void 
		{
			this._assholes.push(
				BodyPartRegistry.human_anus
			);
			addBreast();
			addBreast();
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
			return "human";
		}
	}

}