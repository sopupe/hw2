package org.sevenchan.dongs.bodyparts.eye 
{
	import org.sevenchan.dongs.bodyparts.Eye;
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class GhostEye extends Eye implements IBodyPart 
	{
		registerClassAlias("EGhostEye", GhostEye);
		
		private var _name:String = "";
		
		/**
		 * 
		 * @param	nam  
		 * @param	color
		 */
		public function GhostEye(nam:String="",color:String="") 
		{
			_name = nam;
			this.color = color;
		}
		
		/* INTERFACE org.sevenchan.dongs.bodyparts.IBodyPart */
		
		public override function get name():String 
		{
			return _name;
		}
		
		public override function set name(value:String):void {
			_name = value;
		}
		
		public override function getDescr(num:Number, host:Creature):String 
		{
			return num + " ghostlike " + color + " glowing eye" + ((num > 1)?"s":"");
		}
	}
}