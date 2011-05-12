package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author N3X15
	 */
	public interface IBodyPart 
	{
		function get name():String;
		function getDescr(num:Number, host:Creature):String;
		
		function onFailedAttack(from:Creature, to:Creature):void;
		function onGoodAttack(from:Creature, to:Creature):void;
	}

}