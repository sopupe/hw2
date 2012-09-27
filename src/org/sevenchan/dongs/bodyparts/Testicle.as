package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.weapons.IWeapon;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Testicle implements IBodyPart
	{
		registerClassAlias("P_Ball", Testicle);
		
		public var _name:String;
		public var semen:String;
		public var loadMult:Number = 1; // multiplies below
		public var normalLoad:Number; // ml, per testicle
		public var targetFX:Enchantment = null; // Enchantment to apply to the target after cumming
		public var hostFX:Enchantment = null; // Enchantment to apply to the host once the balls are applied, and once every action.
		public var host:Creature = null;
		public var _location:String = "";
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		public function get location():String { return _location; }
		public function set location(value:String):void { _location=value; }
		
		public var TESTICLE_SYNONYMS:Array = [
			"ball","nut","knocker","testicle"
		];
		
		public function get category():String {
			return "balls";
		}
		
		public function Testicle(name:String="",load:Number=0,targetEnch:Enchantment=null,hostEnch:Enchantment=null,semenDesc:String="") 
		{
			this._name = name;
			this._location = "";
			normalLoad = load;
			targetFX = targetEnch;
			hostFX = hostEnch;
			semen = semenDesc;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function setHost(value:Creature):void {
			host = value;
			host.addEnchantment(hostFX);
		}

		public function get sellDesc():String { return getDescr( -1, null); }
		
		public function getDescr(num:Number, host:Creature):String {
			var sizeDesc:String="standard-issue";
			if (loadMult < 0.1) {
				sizeDesc = "shrivelled ";
			}
			if (loadMult > 100) {
				sizeDesc = "melon-sized, ballooning ";
			}
			if (loadMult < 10) {
				sizeDesc = "apple-sized, greatly swollen ";
			}
			if (loadMult < 5) {
				sizeDesc = "large, fat and tight ";
			}
			if (loadMult < 3)
			{
				sizeDesc = "slightly swollen ";
			}
			if (loadMult == 1)
				sizeDesc = "standard-issue ";
			var o:String = "";
			if (num > 0)
				o += num + " ";
			o += sizeDesc +" ";
			o += Utils.pluralize(num, name);
			if (_location.length > 0)
				o = o + " growing out of " + _location;
			return o;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = MathUtils.getRandomArrayEntry(TESTICLE_SYNONYMS);
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
		
		private var _weapon:IWeapon = null;
		public function get weapon():IWeapon { return _weapon; }
		
		public function tryEquip(weap:IWeapon):Boolean
		{
			return false;
		}
	}

}