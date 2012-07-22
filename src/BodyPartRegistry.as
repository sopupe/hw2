package  
{
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.bodyparts.asshole.*;
	import org.sevenchan.dongs.bodyparts.eye.*;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.enchantment.Hunger;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class BodyPartRegistry 
	{
		//assholes
		public static function get human_anus():Asshole { return new Asshole(600,"human"); }
		public static function get demon_anus():Asshole { return new Asshole(500,"demon"); }
		public static function get arachnid_anus():Asshole { return new Abdomen("Arachnid"); }
		//arms
		public static function get human_arm():Arm { return new Arm(450,"human", null, null); }
		//balls
		public static function get arachnid_testicle():Testicle { return new Testicle("internal testes", 3785, new Hunger(ItemRegistry.DARK_HARPY_EGG.id,1), null, "spider egg"); }
		public static function get demon_testicle():Testicle { return new Testicle("demon nut",38,new Corruption(10),null,"boiling-hot sticky black substance"); }
		public static function get human_testicle():Testicle { return new Testicle("human testicle", 17, null, null, "hot stringy off-white seed"); }
		//breasts
		public static function get demon_breast():Breast { return new Breast(400,"demon"); }
		public static function get human_breast():Breast { return new Breast(500,"human"); }
		//dicks
		public static function get arachnid_penis():Penis { return new Penis("Arachnid",1000,12); }
		public static function get demon_penis():Penis { return new Penis("demon",300,10,new Corruption(1),null); }
		public static function get human_penis():Penis { return new Penis("human", 400,5, null, null); }
		//eyes
		public static function get ghost_yellow_eye():Eye { return new GhostEye("ghost", "yellow"); }
		public static function get human_blue_eye():Eye { return new Eye("human", "blue", "round"); }
		public static function get human_brown_eye():Eye { return new Eye("human", "brown", "round"); }
		public static function get human_green_eye():Eye { return new Eye("human", "green", "round"); }
		public static function get human_red_eye():Eye { return new Eye("human", "red", "round"); }
		public static function get arachnid_big_eye():Eye { return new Eye("human-ish Arachnid", "red", "round"); }
		public static function get arachnid_small_eye():Eye { return new Eye("small Arachnid", "black", "segment"); }
		public static function get harpy_light_eye():Eye { return new Eye("harpy", "amber", "slit"); }
		public static function get harpy_dark_eye():Eye { return new Eye("darkharpy", "red", "slit"); }
		public static function get demon_eye():Eye { return new Eye("demon", "amber", "slit"); }
		//legs
		public static function get arachnid_leg():Leg { return new Leg(400,"Arachnid"); }
		public static function get harpy_leg():Leg { return new Leg(450,"long birdlike harpy"); }
		public static function get human_leg():Leg { return new Leg(450,"human"); }
		//vaginas
		public static function get arachnid_vagina():Vagina { return new Vagina(650,"Arachnid"); }
		public static function get demon_vagina():Vagina { return new Vagina(450,"demon"); }
		public static function get human_vagina():Vagina { return new Vagina(550,"human"); }
		//wings
		public static function get harpy_wing():Wing { return new Wing("harpy", false, "brown and white", 10,600); }
		public static function get harpy_dark_wing():Wing { return new Wing("darkharpy", false, "black and violet", 10,500); }
	}

}