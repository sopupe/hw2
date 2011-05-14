package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Eye implements IBodyPart 
	{
		registerClassAlias("EEye", Eye);
		
		private var _name:String = "";
		public var color:String = "";
		public var pupilShape:String = "";
		public function Eye(nam:String="",color:String="",pupilShape:String="round") 
		{
			_name = nam;
			this.color = color;
			this.pupilShape = pupilShape;
		}
		
		/* INTERFACE org.sevenchan.dongs.bodyparts.IBodyPart */
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void {
			_name = value;
		}
		
		public function getDescr(num:Number, host:Creature):String 
		{
			return num + " " + color + " " + pupilShape + "-pupiled eye" + ((num > 1)?"s":"");
		}
		
		
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
		
	}

}