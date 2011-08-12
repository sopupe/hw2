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
		public var _pen:Boolean = false;

		public function Asshole(name:String="") 
		{
			_name = name;
		}
		
		public  function get category():String {
			return "assholes";
		}
		
		public function get name():String {
			return _name;
		}
		
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
			if (volumeFilled > capacity)
				stretched=" (<b>Your belly has swelled to accomodate the sheer volume.</b>)";
			return num + " " +tightness+filled+ " "+_name + " asshole"+((num>1)?"s":"")+stretched;
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
		
	}

}