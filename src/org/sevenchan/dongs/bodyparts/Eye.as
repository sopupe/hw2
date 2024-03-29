package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.weapons.IWeapon;
	import org.sevenchan.dongs.clothing.Clothing;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Eye implements IBodyPart 
	{
		registerClassAlias("EEye", Eye);
		
		private var _name:String = "";
		public var color:String = "";
		public var pupilShape:String = "";
		public function Eye(nam:String="",color:String="",pupilShape:String="round") 
		{
			_name = nam;
			this.color = color;
			this.pupilShape = pupilShape;
		}
		public var _location:String = "";
		public function get location():String { return _location;}
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		/* INTERFACE org.sevenchan.dongs.bodyparts.IBodyPart */
		
		
		
		public  function get category():String {
			return "eyes";
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "eye";
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		
		
		public function get sellDesc():String { return getShortDescr(true); }
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void {
			_name = value;
		}
		
		public function getDescr(num:Number, host:Creature):String 
		{
			return num + " " + color + " " + pupilShape + "-pupiled eye" + ((num > 1)?"s":"");
		}
		
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
		
		private var _weapon:IWeapon = null;
		public function get weapon():IWeapon { return _weapon; }
		public function tryEquip(weap:IWeapon):Boolean
		{
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