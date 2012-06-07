package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Arm implements IBodyPart
	{
		registerClassAlias("P_Arm", Arm);
		
		private var _name:String;
		public function Arm(name:String="human",atkEnch:Enchantment=null,defEnch:Enchantment=null) 
		{
			_name = name;
		}
		
		public function get name():String {
			return _name;
		}
		
		public  function get category():String {
			return "arms";
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " "+Utils.pluralize(num,getShortDescr(true));
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "arm";
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void
		{
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You attempt to strike the " + to.getTypeName() + " with your fist, but %SUB% moves too quickly and evades the attack!</p>"));
			else
				InfoScreen.push(from.gender.doReplace("<p>%VSUB% attempts to strike you with %POS% fist, but you move too quickly and evade the attack!</p>"));
		}
		public function onGoodAttack(from:Creature, to:Creature):void{
			var dmg:Number = Math.max(5, from.strength - to.strength);
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You smash the " + to.getTypeName() + " in the face with your fist, dealing " + dmg + " damage!</p>"));
			else 
				InfoScreen.push(from.gender.doReplace("<p>%CSUB% punches you with %POS% fist, dealing " + dmg + " damage!</p>"));
			//trace("["+getDescr(1,from)+"] BEFORE: "+to.HP);
			to.HP -= dmg;
			//trace("["+getDescr(1,from)+"] AFTER: "+to.HP);
		}
	}

}