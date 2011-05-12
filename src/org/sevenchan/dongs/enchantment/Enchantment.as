package org.sevenchan.dongs.enchantment 
{
	import org.sevenchan.dongs.Creature;
	/**
	 * MAGICK
	 * @author N3X15
	 */
	public class Enchantment 
	{
		/**
		 * Cancel being added to new host.
		 */
		public var cancelAddition:Boolean = false;
		
		public function Enchantment() 
		{
			
		}
		
		/**
		 * When first added to some poor sap's Enchantments
		 */
		public function onInit(newHost:Creature):String { return ""; }
		
		/**
		 * Unique name for every enchantment (so the enchantment can remove itself).
		 * @return
		 */
		public function getID():String { return ""; }
		
		/**
		 * Do stuff after host wins/loses.
		 * @param	hostWon
		 * @param	other
		 */
		public function onCombatComplete(hostWon:Boolean, other:Creature):void {
			
		}
		/**
		 * Do stuff when combat begins
		 * @param	other
		 */
		public function onCombatInit(other:Creature):void {
			
		}
		
		/**
		 * Do stuff when it's my host's turn
		 * @param	other
		 * @return Skip turn?
		 */
		public function onMyCombatTurn(other:Creature):Boolean {
			return false;
		}
		
		public function getName():String { return getID() + "[WIP?]"; }
		public function getDescr():String { return "???"; }
	}

}