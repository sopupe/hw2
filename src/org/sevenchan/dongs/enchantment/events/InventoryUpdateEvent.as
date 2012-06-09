package org.sevenchan.dongs.enchantment.events 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class InventoryUpdateEvent 
	{
		public var item:Item;
		public var received:Boolean;
		public function InventoryUpdateEvent(item:Item,received:Boolean) 
		{
			this.item = item;
			this.received = received;
		}
		
	}

}