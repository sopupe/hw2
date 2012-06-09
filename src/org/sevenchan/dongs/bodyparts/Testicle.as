package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
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
		
		public var TESTICLE_SYNONYMS:Array = [
			"ball","nut","knocker","testicle"
		];
		
		public function get category():String {
			return "balls";
		}
		
		public function Testicle(name:String="",load:Number=0,targetEnch:Enchantment=null,hostEnch:Enchantment=null,semenDesc:String="") 
		{
			this._name = name;
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

		
		public function getDescr(num:Number, host:Creature):String {
			var sizeDesc:String="standard-issue";
			if (loadMult < 0.1) {
				sizeDesc = "shrivelled ";
			}
			if (loadMult > 100) {
				sizeDesc = "canteloped-sized, ballooning ";
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
			var s:String = "";
			if (num > 1)
				s = "s";
			return num + " " + sizeDesc + name+s;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = MathUtils.getRandomArrayEntry(TESTICLE_SYNONYMS);
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
	}

}