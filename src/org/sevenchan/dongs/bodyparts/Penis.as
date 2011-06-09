package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Penis implements IBodyPart
	{
		registerClassAlias("P_Dick", Penis);
		
		public var size:Number = 0;
		public var sizeMult:Number = 1;
		public var _name:String;
		public function Penis(name:String="",sz:Number=1,targetEnch:Enchantment=null,hostEnch:Enchantment=null) 
		{
			size = sz;
			this._name = name;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function getDescr(num:Number, host:Creature):String {
			var sizeDesc:String = "average";
			var erectDesc:String = "flaccid";
			var dick:String = "";
			
			var lust:Number = host.lust;
			var sz:Number = size * sizeMult;
			
			if      (sz > 100)	sizeDesc = "car-sized, bloated and";
			else if (sz > 50)	sizeDesc = "man-sized, bulging and";
			else if (sz > 35)	sizeDesc = "huge, pulsing and";
			else if (sz > 20)	sizeDesc = "massive";
			else if (sz > 10)	sizeDesc = "big";
			else if (sz > 7)	sizeDesc = "large";
			
			if      (lust >= 100)	erectDesc = "rock-hard, throbbing";
			else if (lust >= 75)	erectDesc = "hard";
			else if (lust >= 50)	erectDesc = "hardening";
			else if (lust >= 25)	erectDesc = "growing";
			
			
			return num + " " +sizeDesc+" "+ erectDesc+" "+MathUtils.inchesToFootInches(sz)+" "+ name + " "+dick+((num>1)?"s":"");
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "dick"
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
	}

}