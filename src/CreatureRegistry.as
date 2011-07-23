package  
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	/**
	 * ...
	 * @author N3X15
	 */
	public class CreatureRegistry 
	{
		public static function get ala():Creature { return new Ala(); }
		public static function get arachnid():Creature { return new Arachnid(false); }
		public static function get arachnid_pregnant():Creature { return new Arachnid(true); }
		public static function get bova():Creature { return new Bova(); }
		public static function get demon():Creature { return new Demon(); }
		public static function get harpy():Creature { return new Harpy(false); }
		public static function get harpy_dark():Creature { return new Harpy(true); }
		public static function get human():Creature { return new Human(); }
		public static function get morel():Creature { return new Morel(); }
		public static function get oldspace():Creature { return new SandNigger(); }
		public static function get scylla():Creature { return new Scylla(); }
		public static function get witch():Creature { return new Witch(); }
	}

}