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
		
		public var EYE:Eye = new Eye("human", "blue", "round");
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
				Arm.HUMAN,
				Arm.HUMAN,
			];
			this.legs = [
				Leg.HUMAN,
				Leg.HUMAN
			];
			this.eyes = [
				EYE,
				EYE
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
						Asshole.HUMAN
					];
					this.vaginas = [];
					this.breasts = [];
					break;
				case Gender.FEMALE:
					this.balls = [];
					this.dicks = [];
					this.assholes = [
						Asshole.HUMAN
					];
					this.vaginas = [
						Vagina.HUMAN,
					];
					this.breasts = [
						Breast.HUMAN,
						Breast.HUMAN
					];
					break;
				case Gender.HERM:
					this.balls = [
						Testicle.HUMAN,
						Testicle.HUMAN,
					];
					this.dicks = [
						Penis.HUMAN
					];
					this.assholes = [
						Asshole.HUMAN
					];
					this.vaginas = [
						Vagina.HUMAN
					];
					this.breasts = [
						Breast.HUMAN,
						Breast.HUMAN,
					];
					break;
				case Gender.MALE:
					this.balls = [
						Testicle.HUMAN,
						Testicle.HUMAN,
					];
					this.dicks = [
						Penis.HUMAN
					];
					this.assholes = [
						Asshole.HUMAN
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