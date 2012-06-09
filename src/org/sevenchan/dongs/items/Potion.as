package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Potion extends Item 
	{
		
		public function Potion(num:uint = 0) 
		{
			super(num);
		}
		
		public function setDescr(fluidDescr:String):void {
			descr = Utils.A(fluidDescr, true) + " liquid in a clear glass vial that feels warm in your hands.";
		}
		
	}

}