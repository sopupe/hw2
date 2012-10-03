package org.sevenchan.dongs.clothing 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Creature;
	
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
			this.id = 13;
			this.name = "Tunic";
			this.HP = maxHP;
			this.type = ClothingType.TOP;
			this.isSexuallyTransmitted = false;
			this.isArmor = false;
			this.opaque = true;
			this.color = color;
		}
		
		override public function copy():Item 
		{
			return new Tunic(amount, color);
		}
		
		override public function getDescr(host:Creature):String
		{
			return "bland, nondescript " + color + " tunic";
		}
	}

}