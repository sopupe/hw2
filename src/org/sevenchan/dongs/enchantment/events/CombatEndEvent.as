package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * ...
	 * @author N3X15
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