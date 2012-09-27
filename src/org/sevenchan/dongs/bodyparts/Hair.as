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
		
		private var descr:String;
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		public function Hair(_descr:String="") 
		{
			this.descr = _descr;
		}
		public function toString():String {
			return descr;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String {
			var t:String = "hair";
			if(withModifier)
				t = descr;
			return t;
		}
	}

}