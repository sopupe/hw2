package org.sevenchan.dongs.bodyparts 
{
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class SexualPreference 
	{
		registerClassAlias("P_SexPref", SexualPreference);
		public static const STRAIGHT:SexualPreference = new SexualPreference(true, false, "straight");
		public static const GAY:SexualPreference = new SexualPreference(false, true, "gay");
		public static const BISEXUAL:SexualPreference = new SexualPreference(true, true, "bi");
		public static const ASEXUAL:SexualPreference = new SexualPreference(false, false,"asexual");
		
		public var label:String = "";
		public var likesOppositeSex:Boolean;
		public var likesSameSex:Boolean;
		public function SexualPreference(opposite:Boolean=false,same:Boolean=false,lbl:String="") 
		{
			this.label = lbl;
			likesOppositeSex = opposite;
			likesSameSex = same;
		}
		/** +-----------------+---+---+
		 *  | SexPref         | S | O |
		 *  +-----------------+---+---+
		 *  | Straight        | F | T |
		 *  | Gay             | T | F |
		 *  | Bisexual        | T | T |
		 *  | ASexual         | F | F |
		 *  +-----------------+---+---+
		 */
		public function likesGender(me:Gender, target:Gender):Boolean {
			var oppo:Boolean = isOppositeGender(me, target);
			if (likesOppositeSex && oppo)
				return true;
			if (likesSameSex && !oppo)
				return true;
			return false;
		}
		
		public function isOppositeGender(me:Gender, target:Gender):Boolean {
			switch(me) {
				case Gender.ASEXUAL:
					return true;
					break;
				case Gender.FEMALE:
					switch(target) {
						case Gender.MALE:
							return true;
						case Gender.FEMALE:
							return false;
					}
					break;
				case Gender.HERM:
					return true;
					break;
				case Gender.MALE:
					switch(target) {
						case Gender.FEMALE:
							return true;
						case Gender.MALE:
							return false;
					}
					break;
			}
			return true;
		}
	}

}