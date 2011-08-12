package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.screens.InfoScreen;
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
		
		public  function get category():String {
			return "breasts";
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
			text += " " + Utils.pluralize(num,getShortDescr());
			return text;
		}
		
		
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = MathUtils.getRandomArrayEntry(breastSynonyms);
			if(withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
		
		public function onAdded(atStore:Boolean, ply:Creature):void
		{
			var text:String = "<h2>New Breast</h2>";
			if (atStore)
			{
				text += "<p>The witch blows at your chest over her dry, spindly fingers, as though she were blowing a kiss.  The creepy throught passes as you ";
			}
			else
			{
				text += "<p>You ";
			}
			text += " feel a bulge of flesh come into being on your chest, slowly expanding into " + Utils.A(getDescr(1, ply)) + " " + getDescr(1, ply)+"</p>";
			InfoScreen.push(text);
		}
		
		public function onRemoved(atStore:Boolean, ply:Creature):void
		{
			var text:String = "<h2>Remove a Breast</h2>";
			
			if (atStore)
				text += "<p>The old lady simply prods your unwanted flesh tumor with her wand, and it ";
			else
				text += "<p>One of your breasts ";
			text += "slowly deflates, and then recedes back into your body with a warm tingling sensation.</p>";
			InfoScreen.push(text);
		}
	}

}