package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Item 
	{
		public static var Registry:Object = { };
		
		
		public var id:int = 0;
		public var name:String = "";
		public var descr:String = "";
		public var value:int = 0;
		public var amount:uint = 0;
		public var isSexuallyTransmitted:Boolean = false;
		
		public function Item(num:uint=0) {
			amount = num;
		}
		
		public function copy():Item {
			return null;
		}
		
		public static function fillRegistry():void {
			Registry={
				berry_white: new WhiteBerries(),
				harpy_tincture: new HarpyTincture(),
				spider_venom: new SpiderVenomSac(),
				darkharpyegg: new DarkHarpyEgg(),
				potion_pink: new PinkPotion(),
				potion_gold:new GoldPotion(),
				spider_egg:new SpiderEgg(),
				gas_mask:new GasMask(),
				milk:new Milk()
			};
		}
		
		public static function findByID(id:int):Item {
			trace("Asked to find", id);
			for each(var item:Item in Registry) {
				trace(item.name, item.id);
				if (item.id == id) return item.copy();
			}
			return null;
		}
		
		public function Use(host:Creature):Boolean {
			InfoScreen.push("<h2>Use Item</h2><p>Nothing happens.</p>");
			return false;
		}
	}

}