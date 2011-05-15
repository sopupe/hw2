package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class WhiteBerries extends Item 
	{
		
		public function WhiteBerries(num:uint=0) 
		{
			super(num);
			value = 15;
			id = 1;
			this.descr = "A plump pearly-white berry the size of a pea, and bears a red cross centered on the stem.";
			this.name = "White Berry";
		}
		
		override public function copy():Item 
		{
			return new WhiteBerries(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			InfoScreen.push("<h2>Use White Berry</h2><p>You pop the white berry into your mouth and bite into it.  It's sweet, but your body feels warm, and you notice some of your wounds have healed.</p>");
			host.HP += 10;
			return true;
		}
		
	}

}