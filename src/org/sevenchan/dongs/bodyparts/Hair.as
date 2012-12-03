package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Hair 
	{
		registerClassAlias("P_Hair", Hair);
		public static const BALD:Hair = new Hair("no hair whatsoever");
		
		public var style:String;
		public var color:String="";
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		public function Hair(style:String="",color:String="") 
		{
			this.style = style;
			this.color = color;
		}
		public function toString():String {
			if (style == "bald")
				return "bald head";
			return style+" "+color+" hair";
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "hair";
			if(withModifier)
				t = style;
			return t;
		}
	}

}