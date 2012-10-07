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
	 * Bova == Cow-girl
	 *
	 * Friendly creature that sells milk and sex<s>, although
	 * sex without a gas mask = you turn into a cowgirl.</s>
	 *
	 * This is based off of a creature from a picture drawn by 7chan /d/, so bite me.
	 * @author Harbinger
	 */
	public class Bova extends Creature
	{
		
		registerClassAlias("EBova", Bova);
		public var SKIN:Skin = new Skin("bovan", "patterned", "fuzzy");
		
		public function Bova()
		{
			trace("Bova.init()");
			super();
			height = Math.random() * 1.5 + 5;
			switch (Math.round(MathUtils.rand(0, 2)))
			{
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
			this.build = Build.CHUBBY;
			this.hair = new Hair("long, blonde");
			this.arms.push(BodyPartRegistry.human_arm, BodyPartRegistry.human_arm);
			this.legs.push(BodyPartRegistry.human_leg, BodyPartRegistry.human_leg);
			this.eyes.push(BodyPartRegistry.human_blue_eye, BodyPartRegistry.human_blue_eye);
			this.skin = SKIN;
			//this.abilities["flatulence"] = new Flatulence();
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
			this.breasts.push(BodyPartRegistry.human_breast, BodyPartRegistry.human_breast);
			this.arms.push(BodyPartRegistry.human_arm, BodyPartRegistry.human_arm);
			this._assholes.push(BodyPartRegistry.human_anus);
			this.legs.push(BodyPartRegistry.human_leg, BodyPartRegistry.human_leg);
			if (gender.hasDick)
			{
				this.balls.push(BodyPartRegistry.human_testicle, BodyPartRegistry.human_testicle);
				this.addDick();
				breasts[0].size = 0;
				breasts[1].size = 0;
			}
			if (gender.hasVag)
			{
				this.vaginas.push(BodyPartRegistry.human_vagina);
				breasts[0].size = breasts[1].size = MathUtils.rand(0, 5);
			}
			customized = false;
		}
		
		override public function getTypeName():String
		{
			return "bova";
		}
		
		override public function addDick(type:String = "default"):Penis
		{
			var penis:Penis = BodyPartRegistry.human_penis;
			// 0.5 - 1.5' wang
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
			text += (<![CDATA[
				<p>
				The changes are drastic.  You groan and grip your stomach as it bulges outwards, filling with larger equivalents of your pre-existing organs.
				Next, you briefly become itchy as short holstein fur covers your body from head to neck.  Finally, two horns sprout from your head, and your breasts
				balloon outwards, so full of milk that they are painful.
				]]>).toString();
			skin._name = "Bova";
			skin.color = "holstein-patterned";
			skin.texture = "short furry";
			this._abilities.flatulence = new Flatulence();
			breasts = new Vector.<Breast>();
			dicks = new Vector.<Penis>();
			balls = new Vector.<Testicle>();
			this._gender = Gender.FEMALE;
			this.initialGenderSetup();
			if (oldMe.gender == Gender.MALE || oldMe.gender == Gender.ASEXUAL)
			{
			// -Facial hair, +pussy
				text += (<![CDATA[
					Your facial hair quickly begins to thin, each hair popping off and floating away in the breeze.  You can't say you'll miss shaving, though you 
					do take back any accolades you may have once given the process once your balls shrivvel up and your {cocks are} sucked painfully into your body,
					causing you to double over as your new pussy is formed.]]>).toString();
				text=text.replace("{cocks are}",Utils.pluralize(oldMe._dicks.length,"cocks are","cock is"));
			}
			text += "</p>";
			InfoScreen.push(text);
		}
	
	}

}