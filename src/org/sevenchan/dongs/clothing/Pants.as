package org.sevenchan.dongs.clothing 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Creature;
	
	/**
	 * Peasant pants
	 * @author Harbinger
	 */
	public class Pants extends Clothing 
	{
		public var color:String = "gray";

		public function Pants(num:uint=0,color:String="gray") 
		{
			super(num);
			value = 10;
			this.id = 14;
			this.name = "Tunic";
			this.HP = maxHP;
			this.type = ClothingType.PANTS;
			this.isSexuallyTransmitted = false;
			this.isArmor = false;
			this.opaque = true;
			this.color = color;
		}
		
		override public function copy():Item 
		{
			return new Pants(amount, color);
		}
		
		override public function getDescr(host:Creature):String
		{
			return "boring, plain " + color + " pants";
		}
	}

}