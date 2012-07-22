package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.enchantment.Paralyze;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class GoldPotion extends Potion 
	{
		
		public function GoldPotion(num:uint = 0) 
		{
			super(num);
			
			this.setDescr("liquid gold");
			this.id = 6;
			this.name = "Gold Potion";
			this.value = 1000;
		}
		
		override public function copy():Item 
		{
			return new GoldPotion(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			var text:String = "<h2>Golden Potion</h2><p>Without so much as a moment's hesitation, you chug the golden fluid, enjoying its sweetness.  Your body feels warm and you gain a sense of calm.  <b>All deadly enchantments have been removed, and you have full HP.</b></p>";
			InfoScreen.push(text);
			delete host.enchantments["corruption"];
			delete host.enchantments["paralyze"];
			delete host.enchantments['sandworms'];
			host.HP = host.maxHP;
			host.HP = host.maxMana;
			return true;
		}
		
	}

}