package org.sevenchan.dongs.enchantment 
{
	/**
	 * ...
	 * @author Harbinger
	 */
	public class WindBlessing extends Enchantment 
	{
		
		public function WindBlessing() 
		{
			super();
		}
		
		override public function getName():String 
		{
			return "Blessing of the Wind";
		}
		
		override public function getDescr():String 
		{
			return "Your hall pass to Damned and beyond.";
		}
		
		override public function getID():String 
		{
			return "windblessing";
		}
		
	}

}