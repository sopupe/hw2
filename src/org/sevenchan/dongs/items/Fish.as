package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Fish extends Item 
	{
		
		public function Fish(num:uint = 0) 
		{
			super(num);
			this.descr = "A red, angry-looking (but dead) fish you caught from the lake.";
			this.id = 8;
			this.name = "Fish";
			this.value = 1000;
		}
		
		override public function copy():Item 
		{
			return new Fish(amount);
		}
		
		override public function Use(ply:Creature):Boolean 
		{
			if (ply.HP < ply.maxHP) {
				InfoScreen.push("<p>You manage to build a great fire with surrounding flammable material and cook the fish to perfection.  After admiring your culinary masterpeice, you devour it, regaining most of your health.</p>");
				ply.HP += ply.maxHP / 2;
				return true;
			}
			InfoScreen.push("<p>You don't feel hungry.</p>");
			return false;
		}
	}

}