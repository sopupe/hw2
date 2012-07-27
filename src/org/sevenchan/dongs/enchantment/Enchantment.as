package org.sevenchan.dongs.enchantment
{
	import org.sevenchan.dongs.Creature;
	import flash.utils.getQualifiedClassName;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.CombatScreen;
	
	/**
	 * MAGICK
	 * @author Harbinger
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
		public function onInit(newHost:Creature):String
		{
			return "";
		}
		
		/**
		 * Unique name for every enchantment (so the enchantment can remove itself).
		 * @return
		 */
		public function getID():String
		{
			throw new Error("FATAL ERROR: " + getQualifiedClassName(this) + " does not specify a custom getID()!");
			return "";
		}
		
		/**
		 * Do stuff after host wins/loses.
		 * @param	hostWon
		 * @param	other
		 */
		public function onCombatComplete(hostWon:Boolean, other:Creature):void
		{
		
		}
		
		/**
		 * Do stuff when combat begins
		 * @param	other
		 */
		public function onCombatInit(other:Creature):void
		{
		
		}
		
		/**
		 * Do stuff when it's my host's turn
		 * @param	other
		 * @return Skip turn?
		 */
		public function onMyCombatTurn(screen:CombatScreen,other:Creature):Boolean
		{
			return false;
		}
		
		/**
		 * Can the player attack?
		 * @param	player
		 * @param	other
		 * @return
		 */
		public function canAttack(player:Creature, other:Creature):Boolean
		{
			return true;
		}
		
		/**
		 * Can the player run?
		 * @param	player
		 * @param	other
		 * @return
		 */
		public function canRun(player:Creature, other:Creature):Boolean
		{
			return true;
		}
		
		/**
		 * Do stuff after each screen update.
		 * @return
		 */
		public function onScreenUpdate():void
		{
		}
		
		public static const INTERCEPT_ACTION_NONE:int = -1;
		public static const INTERCEPT_ACTION_USE:int = 0;
		public static const INTERCEPT_ACTION_TOSS:int = 1;
		/**
		 * Inventory received
		 * @param	item
		 * @return intercept action
		 */
		public function onInventoryReceived(item:Item):int { return INTERCEPT_ACTION_NONE; }
		/**
		 * Inventory received
		 * @param	item
		 * @return intercept action
		 */
		public function onInventorySent(item:Item):int { return INTERCEPT_ACTION_NONE; }
		
		public function getName():String
		{
			trace("ERROR: " + getQualifiedClassName(this) + " does not specify a custom getName()!");
			return getID() + " [WIP?]";
		}
		
		public function getDescr():String
		{
			trace("ERROR: " + getQualifiedClassName(this) + " does not specify a custom getDescr()!");
			return "???";
		}
		
		public static function isLockedOut(subj:Creature):Boolean
		{
			return subj.hasEnchantment("paralyze") || subj.hasEnchantment("hunger");
		}
		public static function canAttack(subj:Creature,combatant:Creature):Boolean
		{
			for each(var e:Enchantment in subj.enchantments)
			{
				if (!e.canAttack(subj, combatant))
					return false;
			}
			return true;
		}
		public static function canRun(subj:Creature,combatant:Creature):Boolean
		{
			for each(var e:Enchantment in subj.enchantments)
			{
				if (!e.canRun(subj, combatant))
					return false;
			}
			return true;
		}
		
		public static function getLockoutEffectText(subj:Creature):String
		{
			if (subj.hasEnchantment("paralyze"))
				return "PARALYZED";
			if (subj.hasEnchantment("hunger"))
				return "HUNGRY";
			return "IDKLOL";
		}
	}

}