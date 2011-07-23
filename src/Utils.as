package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Utils 
	{
		
		
		public static function capitalize(s:String):String
		{
			return s.substr(0,1).toUpperCase() + s.substr(1);
		}
		
		/**
		 * a/an, depending on input
		 * @param	hurr
		 * @return
		 */
		public static function A(hurr:String, caps:Boolean = false):String {
			var firstchar:String = hurr.substr(0, 1);
			if (firstchar == " ")
				return A(hurr.substr(1));
			if (firstchar.toLowerCase() in ["a", "e", "i", "o", "u"])
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
		
		public static function pluralize(t:String, num:Number):String {
			if (num == 1)
				return t;
			if (t.substr(t.length - 1) == "y") {
				return t.substr(0, t.length - 1) + "ies";
			} else {
				return t + "s";
			}
		}
	}

}