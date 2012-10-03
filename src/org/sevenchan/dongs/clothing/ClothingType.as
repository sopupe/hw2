package org.sevenchan.dongs.clothing
{
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	
	public class ClothingType
	{
		public static const HEADGEAR:ClothingType = new ClothingType("headgear", [], "head");
		public static const TOP:ClothingType = new ClothingType("top", [""], "torso");
		public static const PANTS:ClothingType = new ClothingType("pants", ["dicks","balls","vaginas","assholes"], "legs");
		public static const FOOTWEAR:ClothingType = new ClothingType("footwear", [], "feet");
		
		public var name:String = "";
		
		/**
		 * Body part category name(s) that are hidden by this clothing.
		 */
		public var obscures:Array = []; 
		
		/**
		 * What kind of body part does this attach to? (BodyPart category, + head, torso)
		 */
		public var attachesTo:String = "head";
		
		public function ClothingType(name:String, obscures:Array, attachesTo:String) {
			this.name = name;
			this.obscures = obscures;
			this.attachesTo = attachesTo;
		}
	}
}