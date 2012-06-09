package org.sevenchan.dongs 
{
	/**
	 * ...
	 * @author Harbinger
	 */
	public class StringTools 
	{
		
		public static function capitalize(s:String):String
		{
			return s.substr(0,1).toUpperCase() + s.substr(1);
		}
		
	}

}