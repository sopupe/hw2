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
		/**
		 * Retrieve a long description of the body part
		 * 
		 * "3 bloated, throbbing bananas"
		 * @param	num
		 * @param	host
		 * @return
		 */
		function getDescr(num:Number, host:Creature):String;
		function getShortDescr(withModifier:Boolean=false):String;
		
		function onFailedAttack(from:Creature, to:Creature):void;
		function onGoodAttack(from:Creature, to:Creature):void;
	}

}