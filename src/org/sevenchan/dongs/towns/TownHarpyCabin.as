package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.items.DarkHarpyEgg;
	import org.sevenchan.dongs.screens.Shop;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class TownHarpyCabin extends Town 
	{
		
		public function TownHarpyCabin() 
		{
			ID = "harpycabin";
			name = "Harpy Cabin";
			//inhabitants[] = ;
			isWilds = false;
			freeRest = true;
			connectedTowns = [
				"horus"
			];
		}
		
		override public function onRevelation():Boolean 
		{
			text = "Whoops, I forgot this one. WIP.";
			
			return true;
		}
		
		override public function onEnter():void 
		{
			text = "<p>The cabin is warm, despite the falling snow and ice outside.  </p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = "<p>You expected the cabin to be a bunch of sticks, but it's constructed out of solid timber and has a stone fireplace held together with mortar.  The place is kept very tidy, as well.  Not a single feather to be found (except in the bedroom, of course).</p>";
		}
		
		override public function onShopBuyMenu():String 
		{
			return "";
		}
		
		override public function onSuccessfulRest():void 
		{
			text = "You slip into bed beside her.  After a wild night, you awaken feeling fully rested.";
			var eggs:int = 0;
			var gold:int = 0;
			for each(var itm:Item in main.player.inventory) {
				if (itm is DarkHarpyEgg) {
					eggs++;
					var item:Item = itm.copy();
					var price:int = item.value + 5;
					gold += price;
					item.amount = 1;
					main.player.takeFromInventory(item);
					main.player.gold += price;
					main.refreshStats();
				}
			}
			if (eggs > 0) {
				  text += "You also notice that your collection of " + eggs + "Dark Harpy Eggs is missing, ";
				  text += "and your gold supply is "+gold+" coins larger. </p><p>You enjoy breakfast with her, especially ";
				  text += "with your new earplugs.</p>";
			}
		}
	}

}