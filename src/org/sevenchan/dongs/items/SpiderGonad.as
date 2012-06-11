package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author ...
	 */
	public class SpiderGonad extends Item
	{
		
		public function SpiderGonad(num:uint=0) {
			super(num);
			id = 11;
			value = 2000;
			this.descr = "A bright-red, raspberry-shaped gland.";
			this.name = "Spider Venom Sac";
		}
		
		override public function copy():Item 
		{
			return new SpiderGonad(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			host.dicks.push(BodyPartRegistry.arachnid_penis);
			var text:String = "Immediately, you feel something displace inside your body as something large and throbbing forms inside of you.  You groan a bit, feeling your groin's skin bulge outwards, and then suck inside.  Aroused, ";
			if (host.dicks.length > 0)
			text += "your other " + Utils.pluralize(host.dicks.length, "dick begins", "dicks begin") + " to slowly erect";
			if (host.dicks.length > 0 && host.vaginas.length > 0)
			text += ", as";
			if (host.vaginas.length > 0)
			text += "your pussies begin to dampen";
			text += ", when all of a sudden, a large, forearm-sized spike of pulsing meat slides from the hole in your groin, oozing a clear, sticky fluid from all over, especially the swollen, bulbous tip.";
			InfoScreen.push("<h2>Spider Gonad</h2><p>You pop the sweet-smelling gland into your mouth and swallow.</p><p>"+text+"</p>");
			return true;
		}
		
	}

}