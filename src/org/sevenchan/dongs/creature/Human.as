package org.sevenchan.dongs.creature 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.bodyparts.*;
	import flash.net.registerClassAlias;
	
	/**
	 * ...
	 * @author N3X15
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
				BodyPartRegistry.arms.human,
				BodyPartRegistry.arms.human
			);
			this.legs.push(
				BodyPartRegistry.legs.human,
				BodyPartRegistry.legs.human
			);
			this.eyes.push(
				BodyPartRegistry.eyes.human_blue,
				BodyPartRegistry.eyes.human_blue
			);
			this.skin = SKIN;
		}
		
		override public function addBreast():void 
		{
			breasts.push(BodyPartRegistry.breasts.human);
		}
		
		override public function initialGenderSetup():void 
		{
			this.breasts.push(
				BodyPartRegistry.breasts.human,
				BodyPartRegistry.breasts.human
			);
			this._assholes.push(
				BodyPartRegistry.assholes.human
			);
			if(gender.hasDick) {
				this.balls.push(
					BodyPartRegistry.balls.human,
					BodyPartRegistry.balls.human
				);
				this.dicks.push(
					BodyPartRegistry.dicks.human
				);
				breasts[0].size=0;
				breasts[1].size=0;
			}
			if(gender.hasVag) {
				this.vaginas.push(
					BodyPartRegistry.vaginas.human
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