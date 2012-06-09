package org.sevenchan.dongs 
{
	/**
	 * Calculate math stuff
	 * @author Harbinger
	 */
	public class RPGMath 
	{
		/**
		 * Determine possible damage from a weapon strike based on attacker strength, weapon base damage and weapon wear, plus victim's armor
		 * @param	attacker
		 * @param	weapon
		 * @param	victim
		 * @return
		 */
		public static function getDamage(attacker:Creature, weapon:Weapon, victim:Creature):Number {
			return attacker.getEffectiveStrength() * (weapon.baseDamage * (1 - weapon.wear)) * (victim.getEffectiveArmor() > 0?0.1:1);
		}
		
		
	}

}