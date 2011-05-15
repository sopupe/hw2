package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Demon;
	import org.sevenchan.dongs.creature.Harpy;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class HarpyTincture extends Item 
	{
		
		public function HarpyTincture(num:uint=0) 
		{
			super(num);
			this.descr = "A bottle full of a clear liquid, with a feather suspended in it.";
			this.name = "Harpy Tincture";
			this.id = 2;
			this.value = 50;
		}
		
		override public function copy():Item 
		{
			return new HarpyTincture(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			InfoScreen.push("<h2>Use Harpy Tincture</h2><p>You sprout two "+(host is Demon ? "black":"brown")+" wings from your back.</p>");
			if(host is Demon) {
				host.wings.push(Creature.BodyPartRegistry.wings.harpy_dark, Creature.BodyPartRegistry.wings.harpy_dark);
			} else {
				host.wings.push(Creature.BodyPartRegistry.wings.harpy_light, Creature.BodyPartRegistry.wings.harpy_light);
			}
			return true;
		}
		
	}

}