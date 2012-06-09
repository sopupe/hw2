package org.sevenchan.dongs.bodyparts.asshole 
{
	import org.sevenchan.dongs.bodyparts.Asshole;
	import org.sevenchan.dongs.Creature;
	/**
	 * As in spiders.
	 * @author Harbinger
	 */
	public class Abdomen extends Asshole
	{
		
		public function Abdomen(species:String) 
		{
			this.capacity = 18927; // 5 gallons?
			this._name = species;
		}
		override public function getDescr(num:Number, host:Creature):String 
		{
			var tightness:String = "tight";
			var filled:String = "";
			if (timesFucked > 10)
				tightness = "loose";
			if (pregCounter > -1)
				filled = ", pregnant"; // Oh god how do i describe this
			else {
				if (filledWith.length != 0) {
					filled += ", ";
					if (this.capacity < this.volumeFilled)
						filled += "bloated, ";
					filled += filledWith + "-filled";
				}
			}
			return num + " " +tightness+filled+ " "+_name + " abdomen"+((num>1)?"s":"");
		}
		
		
		override public function getShortDescr(withModifier:Boolean = false):String 
		{
			var t:String = "abdomen";
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
	}

}