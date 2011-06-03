package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.enchantment.Paralyze;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class Spore extends Ability 
	{
		
		public function Spore() 
		{
			this.manaCost = 15;
			this.description = "Paralyzes your ass.";
			this.label = "Spore";
			this.name = "Spore";
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			if (rapee.hasEnchantment("paralyze"))
				return false;
			InfoScreen.push("<h2>Spore</h2><p>The Morel releases a cloud of spores from the cap on its head.  Surprised, you inhale the spores, coughing a bit.  Feeling lightheaded, you slump to the ground, paralyzed.</p>");
			rapee.addEnchantment(new Paralyze());
			return true;
		}
		
	}

}