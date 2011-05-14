package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Vagina extends Asshole implements IBodyPart
	{
		registerClassAlias("P_Vag", Vagina);
		
		public function Vagina(name:String="") 
		{
			_name = name;
		}
		public override function getDescr(num:Number, host:Creature):String {
			var tightness:String = "tight";
			var filled:String = "";
			if (timesFucked == 0)
				tightness = "tight, virgin";
			if (timesFucked > 10)
				tightness = "loose";
			if (pregCounter > -1)
				filled = ", pregnant"; // Oh god how do i describe this
			else {
				if (filledWith.length != 0)
					filled = ", " + filledWith + "-filled";
			}
			return num + " " +tightness+filled+ " "+_name + " puss"+((num>1)?"ies":"y");
		}
		
		public override function onFailedAttack(from:Creature, to:Creature):void{}
		public override function onGoodAttack(from:Creature, to:Creature):void{}
	}

}