package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author N3X15
	 */
	public class CombatStartEvent 
	{
		public var other:Creature;
		public function CombatStartEvent(other:Creature) 
		{
			this.other = other;
		}
		
	}

}