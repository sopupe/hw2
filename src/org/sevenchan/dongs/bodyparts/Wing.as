package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.weapons.IWeapon;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Wing implements IBodyPart
	{
		registerClassAlias("P_Wing", Wing);
		private var descriptor:String;
		private var species:String;
		private var reptilian:Boolean;
		private var wingspan:Number;
		public function Wing(species:String="",reptilian:Boolean=false,_descr:String="",wingspan:Number=0,value:Number=0) 
		{
			this._value = value;
			this.species = species;
			this.reptilian = reptilian;
			descriptor = _descr;
			this.wingspan = wingspan;
		}
		
		public function get sellDesc():String { return getShortDescr(true); }
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		public function get category():String {
			return "wings";
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " " + descriptor + " "+(reptilian?"leathery":"feathered")+ " " + species + " wing"+(num>1?"s":"");
		}
		
		public function get name():String { return species; }
		
		
		public function getShortDescr(withModifier:Boolean = false):String 
		{
			var t:String = "wing";
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void {}
		public function onGoodAttack(from:Creature, to:Creature):void {}
		public var _location:String = "right where it should be";
		public function get location():String { return _location;}
		
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
	}

}