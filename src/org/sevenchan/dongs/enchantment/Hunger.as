package org.sevenchan.dongs.enchantment 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.CombatScreen;
	import org.sevenchan.dongs.screens.InfoScreen;
	import flash.net.registerClassAlias;
	/**
	 * Require user to obtain one or more items in order to fend off curse.
	 *  - Forces use of item when obtained
	 *  - If opponent has item, force either surrender or attack, depending on how to get the item
	 *  - 1 HP each turn
	 * @author ...
	 */
	public class Hunger extends Enchantment 
	{
		
		registerClassAlias("EHunger", Corruption);
		public var forWhat:int = 0;
		public var amount:Number = 0;
		private var host:Creature;
		public var item:Item;
		public function Hunger(_forWhat:int, _howMuch:Number) 
		{
			super();
			this.forWhat = _forWhat;
			this.amount = _howMuch;
		}
		override public function onInit(newHost:Creature):String 
		{
			host = newHost;
			cancelAddition = false;
			this.item = Item.findByID(forWhat);
			InfoScreen.push("<h2>Hunger</h2><p>You are now hungry for " + amount + " " + item.name + ".</p><p>Check your appearance screen to see your effects.</p>");
			return "You are now hungry."
		}
		override public function getName():String 
		{
			return "Hunger";
		}
		override public function getID():String 
		{
			return "hunger";
		}
		
		override public function getDescr():String 
		{
			return "You are hungry for "+amount+"x "+item.name+".";
		}
		
		private function haveItemsNeeded():Boolean {
			if (this.host.hasItem(forWhat)) {
				var i:int = 0;
				for each (var item:Item in this.host.inventory) {
					if (item.id == forWhat) {
						if (item.amount >= amount) {
							return true;
						}
					}
				}
			}
			return false;
		}
		
		override public function onMyCombatTurn(screen:CombatScreen,other:Creature):Boolean 
		{
			if (other.hasItem(forWhat)) {
				if (item.isSexuallyTransmitted) {
					screen.passAction = CombatScreen.PASS_SKIP;
					InfoScreen.push("<h2>Hunger</h2><p>You're too hungry to think about anything other than " + other.getTypeName() + "'s " + item.name + "!</p>");
					return false;
				} else {
					screen.passAction = CombatScreen.PASS_SKIP;
					InfoScreen.push(other.gender.doReplace("<h2>Hunger</h2><p>You're too hungry to think about anything other than " + other.getTypeName() + "'s " + item.name + ", and viciously attack %CSUB%!</p>"));
					return false;
				}
			}
			host.HP --;
			return false;
		}
		
		override public function onInventoryReceived(item:Item):int 
		{
			if (item.id == this.item.id) {
				remove();
				return INTERCEPT_ACTION_USE; // Eat? Drink? Who fucking cares
			}else
				return super.onInventoryReceived(item);
		}
		
		private function remove():void {
			InfoScreen.push("<p>Your hunger subsides.</p>");
			delete host.enchantments[getID()];
		}
	}

}