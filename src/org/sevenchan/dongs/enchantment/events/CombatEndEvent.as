package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class CombatEndEvent 
	{
		public var other:Creature;
		public var won:Boolean;
		public function CombatEndEvent(won:Boolean,other:Creature) 
		{
			this.won = won;
			this.other = other;
		}
		
	}

}