package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.enchantment.Enchantment;
	/**
	 * ...
	 * @author N3X15
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

		public function Asshole(name:String="") 
		{
			_name = name;
		}
		
		public function get name():String {
			return _name;
		}
		public function getDescr(num:Number, host:Creature):String {
			var tightness:String = "tight";
			var filled:String = "";
			if (timesFucked > 10)
				tightness = "loose";
			if (pregCounter > -1)
				filled = ", pregnant"; // Oh god how do i describe this
			else {
				if (filledWith.length != 0)
					filled = ", " + filledWith + "-filled";
			}
			return num + " " +tightness+filled+ " "+_name + " asshole"+((num>1)?"s":"");
		}
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
		
	}

}