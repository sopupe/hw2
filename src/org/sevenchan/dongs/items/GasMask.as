package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * Used for bad smells.
	 * @author N3X15
	 */
	public class GasMask extends Item 
	{
		
		public function GasMask(num:uint = 0) 
		{
			super(num);
			this.descr = "A brand-new military-grade NBC (Nuclear, Biological, Chemical) protection mask with a new filter.  Although, being in a fantasy universe, you have no idea what it really is, seeing as your people haven't even discovered gunpowder yet.";
			this.id = 9;
			this.name = "Gas Mask";
			this.value = 500;
		}
		
		override public function copy():Item 
		{
			return new GasMask(amount);
		}
	}

}