package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class DarkHarpyEgg extends Item 
	{
		
		public function DarkHarpyEgg(num:uint = 0) 
		{
			super(num);
			this.descr = "A jet-black egg the size of your head with faint, purple veins running through it.";
			this.id = 4;
			this.name = "Dark Harpy Egg";
			this.value = 45;
		}
		
		override public function copy():Item 
		{
			return new DarkHarpyEgg(amount);
		}
		
	}

}