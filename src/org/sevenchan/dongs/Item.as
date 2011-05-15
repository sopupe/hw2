package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Item 
	{
		public static var Registry:Object = { };
		
		
		public var id:int = 0;
		public var name:String = "";
		public var descr:String = "";
		public var value:int = 0;
		public var amount:uint = 0;
		
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
				spider_venom: new SpiderVenomSac()
			};
		}
		
		public static function findByID(id:int):Item {
			for each(var item:Item in Registry) {
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