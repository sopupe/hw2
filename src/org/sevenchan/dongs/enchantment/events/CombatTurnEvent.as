package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author N3X15
	 */
	public class CombatTurnEvent 
	{
		public var other:Creature;
		public function CombatTurnEvent(other:Creature) 
		{
			this.other = other;
		}
		
	}

}