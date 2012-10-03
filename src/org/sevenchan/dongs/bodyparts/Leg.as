package org.sevenchan.dongs.bodyparts
{
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.weapons.IWeapon;
	import org.sevenchan.dongs.clothing.Clothing;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Leg implements IBodyPart
	{
		registerClassAlias("P_Leg", Leg);
		
		private var _name:String;
		private var _location:String = "";
		private var _value:Number;
		
		public function Leg(value:Number = 0, name:String = "")
		{
			_value = value;
			_name = name;
		}
		
		public function get value():Number
		{
			return _value;
		}
		
		public function get category():String
		{
			return "legs";
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get location():String
		{
			return _location;
		}
		
		public function getDescr(num:Number, host:Creature):String
		{
			var o:String = num + " " + name + " leg" + ((num > 1) ? "s" : "");
			if (_location.length > 0)
			o += " growing out of %POS% " + location;
			return o;
		}
		
		public function get sellDesc():String
		{
			return getShortDescr(true);
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void
		{
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You attempt to kick the " + to.getTypeName() + ", but %SUB% moves too quickly and evades the attack!</p>"));
			else
				InfoScreen.push(from.gender.doReplace("<p>%CSUB% attempts to kick you, but you move too quickly and evade the attack!</p>"));
		}
		
		public function onGoodAttack(from:Creature, to:Creature):void
		{
			if (weapon != null)
			return onGoodAttack(from, to);
			var dmg:Number = from.damageAgainst(to,weapon);
			var txt:String = "";
			if (from is Player)
			{
				txt = MathUtils.getRandomArrayEntry(["You deliver a powerful round kick to the " + to.getTypeName(), "You kick the " + to.getTypeName(), "The " + to.getTypeName() + " gets a foot to the face",]);
				InfoScreen.push(to.gender.doReplace("<p>" + txt + ", dealing " + dmg + " damage!</p>"));
			}
			else
			{
				txt = MathUtils.getRandomArrayEntry(["%CSUB% kicks you", "You discover how " + from.getTypeName() + " feet taste", "One of %POS%'s kicks find your face",]);
				InfoScreen.push(from.gender.doReplace("<p>" + txt + ", causing " + dmg + " damage!</p>"));
			}
			to.HP -= dmg;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String
		{
			var t:String = "leg";
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
		private var _weapon:IWeapon = null;
		public function get weapon():IWeapon { return _weapon; }
		public function tryEquip(weap:IWeapon):Boolean
		{
			if (weap.canEquipOn(this)){
				_weapon = weap;
				return true;
			}
			return false;
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
	}

}