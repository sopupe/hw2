package org.sevenchan.dongs 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Utils 
	{
		/**
		 * a/an, depending on input
		 * @param	hurr
		 * @return
		 */
		public static function A(hurr:String,caps:Boolean=false):String {
			if (hurr.substr(0, 1).toLowerCase() in ["a", "e", "i", "o", "u"])
				return (caps)?"An":"an";
			return (caps)?"A":"a";
		}
		
		public static function nTh(n:Number):String {
			if (n == 1) return n + "st";
			if (n == 2) return n + "nd";
			if (n == 3) return n + "rd";
			return n+"th";
		}
		
		
		public static function dictLength(myDictionary:Dictionary):int 
		{
			var n:int = 0;
			for (var key:* in myDictionary) {
				n++;
			}
			return n;
		}
		
		
		public static function objHas(o:Object,key:String):Boolean 
		{
			for (var k:String in o) {
				trace(k);
				if (k == key)
					return true;
			}
			return false;
		}
	}

}