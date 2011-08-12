package org.sevenchan.dongs.creature 
{
	import flash.net.*;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.ability.Flatulence;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.screens.encounters.BovaEncounterScreen;
	
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
		public var SKIN:Skin = new Skin("bovan", "patterned", "fuzzy");
		
		public function Bova() 
		{
			trace("Bova.init()");
			super();
			height = Math.random()*1.5 + 5;
			switch(Math.round(MathUtils.rand(0, 2))) {
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
			this.hair = new Hair("long, blonde");
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
			this.abilities["flatulence"] = new Flatulence();
		}
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.human_breast;
			boob.size = MathUtils.rand(2, 4);
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
		
		override public function getHostile(subj:Creature):Boolean 
		{
			return false;
		}
		
		override public function onEncounter(ply:Creature):Boolean 
		{
			if (ply != null) // Debug screen checking to see if encounters are possible
			{
				BovaEncounterScreen.push(this);
			}
			return true;
		}
		
		override public function performConversion(oldMe:Creature):void 
		{
			var text:String = "";
			text += "<p>The changes are drastic.  First, you feel a strange sensation inside of your abdomen as you grow new organs.  Your stomach bulges a bit as your stomach enlarges, and holstein-patterned short ripples across everything but your head, which retains its old hair.";
			skin._name = "Bova";
			skin.color = "patterned";
			skin.texture = "short furry";
			this._abilities.flatulence = new Flatulence();
			if (oldMe.gender == Gender.MALE||oldMe.gender == Gender.ASEXUAL) {
				text += "Your facial hair vanishes, replaced by smooth skin.  Your facial structure changes, becoming more feminine, and your breasts grow immensely, putting incredible stress on your back.  You also shudder as you feel your groin split in two, the crack spreading up into your body and forming a new womb.";
				breasts = new Vector.<Breast>();
				addBreast();
				addBreast();
			}
			text += "</p>";
			InfoScreen.push(text);
		}
		
	}

}