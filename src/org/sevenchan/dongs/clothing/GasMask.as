package org.sevenchan.dongs.clothing
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.clothing.Clothing;
	
	/**
	 * Making this into a magitek clothing item, might be
	 * useful in magick-flooded Universities, or as a disguise.
	 * @author Harbinger
	 */
	public class GasMask extends Clothing
	{
		public function GasMask(num:uint = 0)
		{
			super(num);
			this.descr = "A strange, copper mask with a thick breathing tube filled with cloth.  It tingles to the touch.";
			this.id = 9;
			this.name = "Gas Mask";
			this.isArmor = false;
			this.opaque = true;
			this.value = 500;
		}
		
		override public function copy():Item
		{
			return new GasMask(amount);
		}
		
		override public function getDescr(host:Creature):String
		{
			var state:String = "mint-condition";
			var pct:Number = (HP / maxHP);
			if (pct < 0.5)
				state = "heavily-dented and cracked";
			else if (pct < 0.75)
				state = "lightly-dented";
			return state + " copper gas mask";
		}
	}

}