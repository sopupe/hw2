package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.CombatScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class CombatTurnEvent 
	{
		public var other:Creature;
		public var screen:CombatScreen;
		public function CombatTurnEvent(screen:CombatScreen,other:Creature) 
		{
			this.screen = screen;
			this.other = other;
		}
		
	}

}