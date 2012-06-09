package org.sevenchan.dongs.weapons 
{
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public interface IWeapon 
	{
		
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author Harbinger
	 */
	public interface IWeapon
	{
		function get baseName():String;
		function get description():String;
		function get category():WeaponCategory;
		function get baseDamage():Number;
		function get wear():Number;
		
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