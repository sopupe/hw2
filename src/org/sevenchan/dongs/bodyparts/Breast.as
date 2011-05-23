package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.Utils;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Breast implements IBodyPart
	{
		registerClassAlias("P_Boob", Breast);
		
		private var _name:String;
		public var size:int = 1;
		public var milkMult:Number = 1;
		private static var breastSizes:Array = [
			"flat",
			"puffy",
			"small",
			"round",
			"large",
			"big",
			"immense"
		];
		private static var breastSynonyms:Array = [
			"boob",
			"booby",
			"bosom",
			"breast",
			"doorknocker",
			"knocker",
			"mammary",
			"teat",
			"tit",
			"titty"
		];
		public function Breast(name:String="",size:int=1,milkMultiplier:Number=1) 
		{
			_name = name;
			this.size = size;
			this.milkMult = milkMultiplier;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function bigger():void {
			if (breastSizes.length-1 == size)
				return;
			size++;
		}
		
		public function smaller():void {
			if (0 == size)
				return;
			size--;
		}
		
		/**
		 * How much in need of milking these tits are.
		 * @return
		 */
		public function getMilkFeeling():String {
			if (milkMult < 0.5) {
				return "dried-up";
			}
			if (milkMult >= 0.5 && milkMult < 1.5) {
				return "perky";
			}
			if (milkMult >= 1.5 && milkMult < 2) {
				return "plump";
			}
			if (milkMult >= 2 && milkMult < 5) {
				return "slightly swollen";
			}
			if (milkMult >= 5) {
				return "painfully swollen";
			}
			return "";
		}
		
		public function getDescr(num:Number, host:Creature):String {
			// 2 big{, painfully swollen} tits
			var text:String = num + " " + breastSizes[size];
			if (milkMult != 1)
				text += ", " + getMilkFeeling();
			text += " " + name + " " + Utils.pluralize(MathUtils.getRandomEntry(breastSynonyms), num);
			return text;
		}
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
	}

}