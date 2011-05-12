package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Item 
	{
		
		public var id:int = 0;
		public var name:String = "";
		public var descr:String = "";
		public var value:int = 0;
		public var amount:uint = 0;
		
		public function Item(num:uint) {
			amount = num;
		}
		
		public function Use(host:Creature):Boolean {
			InfoScreen.push("<h2>Use Item</h2><p>Nothing happens.</p>");
			return false;
		}
	}

}