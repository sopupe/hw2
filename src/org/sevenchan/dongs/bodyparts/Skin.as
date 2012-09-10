
package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Skin implements IBodyPart
	{
		registerClassAlias("P_Skin", Skin);
		
		public var _name:String;
		public var color:String;
		public var texture:String;
		public var descrOverride:String = "";
		
		public function Skin(n:String = "", color:String = "light", texture:String = "silk-smooth") 
		{
			this._name = n;
			this.color = color;
			this.texture = texture;
		}
		
		public function get sellDesc():String { return getShortDescr(true); }
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		/* INTERFACE org.sevenchan.dongs.bodyparts.IBodyPart */
		
		
		public  function get category():String {
			return "skins";
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "skin";
			if(withModifier)
				t = color + " " + t;
			return t;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function getDescr(num:Number, host:Creature):String {
			var dmgDescr:Array = [
				"throughly-decayed and corrupted", //0
				"mostly rotten", //1
				"vomit-inducing decaying", //2
				"corruption-riddled, abscessed, pitted, and baggy", //3
				"corruption-scarred and cellulous", //4
				"heavily-pimpled", //5
				"moderately zitty", //6
				"blemish-sprinkled, but pretty", //7
				"slightly damaged", //8
				"perfect" //9
			];
			var damage:int = 10 - Math.min(10, Math.max(1, Math.round((Corruption.getLevelOf(host) * 0.1))))
			
			// perfect light, smooth human skin.
			return dmgDescr[damage] + " " + color + ", " + texture + " " + _name + " skin";
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
	}

}