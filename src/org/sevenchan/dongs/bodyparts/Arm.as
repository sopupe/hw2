package org.sevenchan.dongs.bodyparts
{
	import org.sevenchan.dongs.clothing.Clothing;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.weapons.IWeapon;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Arm implements IBodyPart
	{
		registerClassAlias("P_Arm", Arm);
		
		private var _name:String;
		public var _location:String = "";
		
		public function get location():String
		{
			return _location;
		}
		
		public function Arm(value:Number = 0, name:String = "human", atkEnch:Enchantment = null, defEnch:Enchantment = null)
		{
			_value = value;
			_name = name;
		}
		
		private var _value:Number;
		
		public function get value():Number
		{
			return _value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get category():String
		{
			return "arms";
		}
		
		public function get sellDesc():String
		{
			return getShortDescr(true);
		}
		
		public function getDescr(num:Number, host:Creature):String
		{
			var o:String = num + " " + Utils.pluralize(num, getShortDescr(true));
			if (location.length > 0)
				o += " growing out of %POS% " + location;
			return o;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String
		{
			var t:String = "arm";
			if (withModifier)
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
		
		public function onGoodAttack(from:Creature, to:Creature):void
		{
			var dmg:Number = from.damageAgainst(to, weapon);
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You smash the " + to.getTypeName() + " in the face with your fist, dealing " + dmg + " damage!</p>"));
			else
				InfoScreen.push(from.gender.doReplace("<p>%CSUB% punches you with %POS% fist, dealing " + dmg + " damage!</p>"));
			//trace("["+getDescr(1,from)+"] BEFORE: "+to.HP);
			to.HP -= dmg;
			//trace("["+getDescr(1,from)+"] AFTER: "+to.HP);
		}
		
		public function isConcealedBy(host:Creature, clothing:Vector.<Clothing>):Boolean
		{
			return clothing.some(function(c_:Object, index:int, vector:Vector.<Clothing>):Boolean 
				{
					var c:Clothing = Clothing(c_);
					if (c != null)
						return (c.type.obscures.indexOf(category) > -1);
					else
						return false;
				});
		}
		
		private var _weapon:IWeapon = null;
		
		public function get weapon():IWeapon
		{
			return _weapon;
		}
		
		public function tryEquip(weap:IWeapon):Boolean
		{
			if (weap.canEquipOn(this))
			{
				_weapon = weap;
				return true;
			}
			return false;
		}
	}

}