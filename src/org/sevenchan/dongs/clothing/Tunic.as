package org.sevenchan.dongs.clothing 
{
	/**
	 * Peasant shirt
	 * @author Harbinger
	 */
	public class Tunic extends Clothing 
	{
		public var color:String = "brown";

		public function Tunic(num:uint=0,color="brown") 
		{
			super(num);
			value = 5;
			this.isSexuallyTransmitted = false;
			this.isArmor = false;
			this.opaque = true;
			this.color = color;
		}
	}

}