package org.sevenchan.dongs
{
	import adobe.utils.CustomActions;
	import org.sevenchan.dongs.items.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Item
	{
		public static var Registry:Object = { };
		public static var IDs:Array = new Array();
		
		public var id:int = 0;
		public var name:String = "";
		public var descr:String = "";
		public var value:int = 0;
		public var amount:uint = 0;
		public var isSexuallyTransmitted:Boolean = false;
		
		public function Item(num:uint = 0)
		{
			amount = num;
		}
		
		public function copy():Item
		{
			return null;
		}
		
		public static function fillRegistry():void
		{
			Registry = {
				berry_white: new WhiteBerries(), 
				harpy_tincture: new HarpyTincture(), 
				spider_venom: new SpiderVenomSac(),
				darkharpyegg: new DarkHarpyEgg(),
				potion_pink: new PinkPotion(), 
				potion_gold: new GoldPotion(), 
				spider_egg: new SpiderEgg(),
				gas_mask: new GasMask(), 
				milk: new Milk(), 
				spider_gonad: new SpiderGonad(),
				anchor_stone: new AnchorStone()
				};
			for each (var i:Item in Registry)
			{
				trace(i.name+"\t"+i.id);
				if (IDs[i.id] != null)
					throw new Error(i.name + " has duplicate ID!  Conflicts with " + (IDs[i.id] as Item).name);
				IDs[i.id] = i;
			}
		}
		
		public static function findByID(id:int):Item
		{
			trace("Asked to find", id);
			for each (var item:Item in Registry)
			{
				trace(item.name, item.id);
				if (item.id == id)
					return item.copy();
			}
			return null;
		}
		
		public function Use(host:Creature):Boolean
		{
			InfoScreen.push("<h2>Use Item</h2><p>Nothing happens.</p>");
			return false;
		}
	}

}