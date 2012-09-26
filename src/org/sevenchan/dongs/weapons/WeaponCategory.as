package org.sevenchan.dongs.weapons 
{
	
	
	public class WeaponCategory
	{
		public const SWORD_ONE_HANDED:WeaponCategory = new WeaponCategory("one-handed sword", "A sword that can be held by a single hand.");
		public const SWORD_TWO_HANDED:WeaponCategory = new WeaponCategory("two-handed sword", "A sword that must be held by two hands to be effective.");
		
		public var name:String = "";
		public var description:String = "";
		
		public function WeaponCategory(nam:String, desc:String) {
			name = nam;
			description = desc;
		}
	}

}