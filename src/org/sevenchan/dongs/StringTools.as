package org.sevenchan.dongs 
{
	/**
	 * ...
	 * @author N3X15
	 */
	public class StringTools 
	{
		
		public static function capitalize(s:String):String
		{
			return s.substr(0,1).toUpperCase() + s.substr(1);
		}
		
	}

}