package org.sevenchan.dongs.bodyparts 
{
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.clothing.Clothing;
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Vagina extends Asshole implements IBodyPart
	{
		registerClassAlias("P_Vag", Vagina);
		
		public function Vagina(value:Number=0,name:String="") 
		{
			super(value,name);
		}
		
		
		
		public override function get category():String {
			return "vaginas";
		}
		
		public override function getDescr(num:Number, host:Creature):String {
			var tightness:String = "tight";
			var filled:String = "";
			if (timesFucked == 0)
				tightness = "tight, virgin";
			if (timesFucked > 10)
				tightness = "loose";
			if (pregCounter > -1)
				filled = ", pregnant"; // Oh god how do i describe this
			else {
				if (filledWith.length != 0)
					filled = ", " + filledWith + "-filled";
			}
			var loc:String = "right where it should be, between your legs";
			if (location.length > 0)
				loc = ", " + location;
			return num + " " +tightness + filled + " " + name+" "+Utils.pluralize(num,"pussy","pussies") + " " + location;
		}
		
		override public function getShortDescr(withModifier:Boolean = false):String 
		{
			var t:String = "pussy";
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
		public override function onFailedAttack(from:Creature, to:Creature):void{}
		public override function onGoodAttack(from:Creature, to:Creature):void{}
	}

}