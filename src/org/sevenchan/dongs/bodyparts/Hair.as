package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Hair 
	{
		registerClassAlias("P_Hair", Hair);
		public static const BALD:Hair = new Hair("no hair whatsoever");
		
		public var descr:String;
		public function Hair(_descr:String="") 
		{
			this.descr = _descr;
		}
		public function getDescription():String { return descr; }
	}

}