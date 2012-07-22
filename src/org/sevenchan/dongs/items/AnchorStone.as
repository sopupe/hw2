package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	
	/**
	 * Keeps your fat ass from getting blown away by the Ala.
	 * @author ...
	 */
	public class AnchorStone extends Item 
	{
		
		public function AnchorStone(num:uint=0) 
		{
			super(num);
			this.descr = "A small pebble with a black streak running through it.";
			this.id = 12;
			this.name = "Anchor Stone";
			this.value = 0;
		}
		
		override public function copy():Item 
		{
			return new AnchorStone(amount);
		}
	}

}