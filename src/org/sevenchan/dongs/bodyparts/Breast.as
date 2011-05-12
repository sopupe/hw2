package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Breast implements IBodyPart
	{
		registerClassAlias("P_Boob", Breast);
		public static const HUMAN:Breast = new Breast("human");
		
		private var _name:String;
		public function Breast(name:String="") 
		{
			_name = name;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " " + name + " boob"+((num>1)?"s":"");
		}
		public function onFailedAttack(from:Creature, to:Creature):void{}
		public function onGoodAttack(from:Creature, to:Creature):void{}
	}

}