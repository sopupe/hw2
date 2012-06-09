package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.bodyparts.Testicle;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class SpiderVenomSac extends Item 
	{
		public function SpiderVenomSac(num:uint=0) {
			super(num);
			id = 3;
			value = 20;
			this.descr = "A black, sticky gland the size of your fist.";
			this.name = "Spider Venom Sac";
		}
		
		override public function copy():Item 
		{
			return new SpiderVenomSac(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			var action:Function = function(nut:*, index:int, array:Array):void {
				(nut as Testicle).loadMult += 1;
			};
			InfoScreen.push("<h2>Spider Venom</h2><p>You drink the spider venom, and your semen output is increased by 1.</p>");
			return true;
		}
		
	}

}