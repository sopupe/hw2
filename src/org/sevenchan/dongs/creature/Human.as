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
			this.arms = [
				BodyPartRegistry.arms.human,
				BodyPartRegistry.arms.human,
			];
			this.legs = [
				Leg.HUMAN,
				Leg.HUMAN
			];
			this.eyes = [
				BodyPartRegistry.eyes.human_blue,
				BodyPartRegistry.eyes.human_blue,
			];
			this.skin = SKIN;
		}
		
		override public function initialGenderSetup():void 
		{
			switch(gender) {
				case Gender.ASEXUAL:
					this.balls = [];
					this.dicks = [];
					this.assholes = [
						BodyPartRegistry.assholes.human
					];
					this.vaginas = [];
					this.breasts = [];
					break;
				case Gender.FEMALE:
					this.balls = [];
					this.dicks = [];
					this.assholes = [
						BodyPartRegistry.assholes.human
					];
					this.vaginas = [
						BodyPartRegistry.vaginas.human,
					];
					this.breasts = [
						BodyPartRegistry.breasts.human,
						BodyPartRegistry.breasts.human
					];
					break;
				case Gender.HERM:
					this.balls = [
						BodyPartRegistry.balls.human,
						BodyPartRegistry.balls.human,
					];
					this.dicks = [
						BodyPartRegistry.dicks.human
					];
					this.assholes = [
						BodyPartRegistry.assholes.human
					];
					this.vaginas = [
						BodyPartRegistry.vaginas.human
					];
					this.breasts = [
						BodyPartRegistry.breasts.human,
						BodyPartRegistry.breasts.human,
					];
					break;
				case Gender.MALE:
					this.balls = [
						BodyPartRegistry.balls.human,
						BodyPartRegistry.balls.human,
					];
					this.dicks = [
						BodyPartRegistry.dicks.human
					];
					this.assholes = [
						BodyPartRegistry.assholes.human
					];
					this.vaginas = [];
					this.breasts = [];
					break;
			}
			customized = false;
		}
		
		override public function getTypeName():String 
		{
			return "human";
		}
	}

}