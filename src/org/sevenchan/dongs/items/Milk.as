package org.sevenchan.dongs.items
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Milk extends Item
	{
		
		public function Milk(num:uint = 0)
		{
			super(num);
			
			this.descr = "A warm, white liquid that mammals secrete from their breasts.  Heals 1/4 of your health.";
			this.id = 10;
			this.name = "Milk";
			this.value = 500;
		}
		
		override public function copy():Item
		{
			return new Milk(amount);
		}
	
		override public function Use(host:Creature):Boolean 
		{
			InfoScreen.push("<h2>Drink Milk</h2><p>You drink the warm, frothy milk, and instantly feel more energetic and healthy.</p>");
			host.HP += host.maxHP / 4;
			return true;
		}
	}
}