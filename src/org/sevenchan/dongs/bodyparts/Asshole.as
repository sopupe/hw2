package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.enchantment.Enchantment;
	import org.sevenchan.dongs.weapons.IWeapon;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Asshole implements IBodyPart
	{
		registerClassAlias("P_Asshole", Asshole);
		
		public var _name:String;
		public var timesFucked:Number = 0;
		public var volumeFilled:Number = 0;
		public var capacity:Number = 1500;
		public var filledWith:String = "";
		public var pregCounter:Number = -1;
		public var pregnantWith:Creature = null;
		public var _location:String = "right where it should be";
		public var _pen:Boolean = false;

		public function Asshole(value:Number=0,name:String="") 
		{
			_value = value;
			_name = name;
		}
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		public  function get category():String {
			return "assholes";
		}
		
		public function get name():String {
			return _name;
		}
		
		public function get location():String { return _location;}
		
		public function impregnate(balls:Vector.<Testicle>):void {
			var amtCum:Number = 0;
			var enchTxt:String = "";
			var semen:String = balls[0].semen;
			var asshole:Boolean = true;
			// Get values
			for (var i:int = 0; i < balls.length; i++) {
				var t:Testicle = balls[i];
				amtCum+=t.loadMult * t.normalLoad;
			}

			timesFucked++;
			volumeFilled = amtCum;
			filledWith = semen;
		}
		
		public function get sellDesc():String { return getDescr(-1,null); }
		
		public function getDescr(num:Number, host:Creature):String {
			var tightness:String = "tight";
			var filled:String = "";
			var stretched:String = "";
			if (timesFucked > 10)
				tightness = "loose";
			if (pregCounter > -1)
				filled = ", "+pregnantWith.getTypeName()+"-impregnated"; // Oh god how do i describe this
			else {
				if (filledWith.length != 0)
					filled = ", " + filledWith + "-filled";
			}
			if (volumeFilled > capacity && num>0)
				stretched = " (<b>Your belly has swelled to accomodate the sheer volume.</b>)";
			var o:String = "";
			if (num > 0)
				o += num + " ";
			return o+tightness+filled+ " "+_name + " asshole"+((num>1)?"s":"")+", "+location+stretched;
		}
		
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "asshole";
			if(withModifier)
				t = _name + " " + t;
			return t;
		}
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void { }
		
		public function isPenetrated():Boolean { return _pen; }
		
		private var _weapon:IWeapon = null;
		public function get weapon():IWeapon { return _weapon; }
		public function tryEquip(weap:IWeapon):Boolean
		{
			return false;
		}
		
	}

}