package org.sevenchan.dongs.weapons 
{
		
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Enchantment;
	/**
	 * ...
	 * @author Harbinger
	 */
	public interface IWeapon
	{
		function get name():String; // You grip excalibur, your heavily-worn black dildo, in your hands.
		function get baseName():String; // dildo
		function get enchancement():Enchantment; // enchanted?
		function get description():String; // Other stuff
		function get category():WeaponCategory; // sword (for storing or grouping)
		function get baseDamage():Number; // small damage boosting thing. will be summed with other weapons.
		function get wear():Number; // 0 to 1 wear.  finalDamageBoost=baseDamage*(1-wear)
		
		/**
		 * Retrieve a long description of the body part
		 * 
		 * You have two human arms.  You grip a heavily-worn black dildo in your hands.
		 * @param	num
		 * @param	host
		 * @return
		 */
		function getDescr(num:Number,host:Creature,hostingBodyPart:IBodyPart):String;
		function getShortDescr(withModifier:Boolean = false):String;
		
		function canEquipOn(bodypart:IBodyPart):Boolean;
		
		function onFailedAttack(from:Creature, to:Creature):void;
		function onGoodAttack(from:Creature, to:Creature):void;
		function calcDamage(from:Creature, to:Creature):Number; 
		/*{
			return baseDamage * (1 - wear);
		}*/
	}
	
}