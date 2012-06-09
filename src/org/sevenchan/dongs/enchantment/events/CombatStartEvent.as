package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author Harbinger
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