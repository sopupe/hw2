package org.sevenchan.dongs.bodyparts.arm 
{
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class ManticoreArm extends Arm
	{
		registerClassAlias("P_ManticoreArm", ManticoreArm);
		
		private var _name:String;
		public function ManticoreArm(value:Number) 
		{
			super(value, "manticore");
		}
		
		private var _value:Number;
		public override function get value():Number {
			return _value;
		}
		
		public override function get name():String {
			return _name;
		}
		
		public override function get category():String {
			return "arms";
		}
		
		public override function get sellDesc():String { return getShortDescr(true); }
		
		public override function getDescr(num:Number, host:Creature):String {
			return num + " big, hairy "+Utils.pluralize(num,getShortDescr(true))+" (with attached inch-long claws)";
		}
		
		public override function getShortDescr(withModifier:Boolean = false):String {
			return "manticore arm";
		}
		
		public override function onFailedAttack(from:Creature, to:Creature):void
		{
			if (from is Player)
				InfoScreen.push(to.gender.doReplace(
				"<p>You attempt to slash the " + to.getTypeName() + " with your claws, but %SUB% moves too quickly and evades the attack!</p>"));
			else
				InfoScreen.push(from.gender.doReplace(
				"<p>You manage to duck just as you hear the muffled <i>swish</i> of the angry "+from.getTypeName()+"'s giant claws cutting through the air a few inches above your head.</p>"));
		}
		public override function onGoodAttack(from:Creature, to:Creature):void{
			var dmg:Number = Math.max(20, from.strength - to.strength + 20);
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You violently rake your claws over %POS% body, resulting in a devastating loss of "+dmg+" HP!</p>"));
			else 
				InfoScreen.push(from.gender.doReplace("<p>%CSUB% cuts new furrows into your face with %POS% claws, dealing " + dmg + " damage!</p>"));
			//trace("["+getDescr(1,from)+"] BEFORE: "+to.HP);
			to.HP -= dmg;
			//trace("["+getDescr(1,from)+"] AFTER: "+to.HP);
		}
	}

}