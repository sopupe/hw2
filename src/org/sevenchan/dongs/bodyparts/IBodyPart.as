package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author Harbinger
	 */
	public interface IBodyPart 
	{
		function get value():Number;
		function get sellDesc():String;
		function get name():String;
		function get category():String;
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