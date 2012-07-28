package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.Creature;
	import flash.net.registerClassAlias;
	/**
	 * A nice, stupid way for creatures to have defined builds.
	 * @author Harbinger
	 */
	public class Build
	{
		registerClassAlias("P_Build", Build);
		public static const AVG:Build = new Build(1, 1,"is of average weight and build");
		public static const HIDEOUS:Build = new Build(2.5, -0.5, "is hideously fat;  You can practically <i>smell</i> the decaying flesh between the rolls");
		public static const CHUBBY:Build = new Build(1.5, -0.5,"is a bit chubby, with a slightly bulging belly and a round face");
		public static const MALNOURISHED:Build = new Build(-1.5, -0.5,"is terrifyingly malnourished;  Bones poke out in seemingly every direction");
		public static const PRETTYSTRONG:Build = new Build(1, 1.5,"has lean muscles rippling across %POS% slim body");
		public static const EATSTRAINS:Build = new Build(1, 1.5, "is covered in a swarm of immense, car-crushing muscles that even ten bucket-fulls of steroids couldn't possibly produce");
		
		public var weightMultiplier:Number;
		public var strengthMultiplier:Number;
		public var bodyIsText:String;
		public function Build(weightmult:Number=1, strmult:Number=1, descr:String="") {
			weightMultiplier = weightmult;
			strengthMultiplier = strmult;
			bodyIsText = descr;
		}
		
		public function calculateWeight(height:Number, density:Number):int {
			return (int)((height * density) * weightMultiplier * (strengthMultiplier * 0.05));
		}
		
		public function getDescription():String {
			return bodyIsText;
		}
	}

}