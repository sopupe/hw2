package  
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.creature.npc.*;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class CreatureRegistry 
	{
		// NPCs
		public static function get gargoyle():Creature { return new Gargoyle();}
		// BOSSDUDES
		public static function get ala():Creature { return new Ala(); }
		
		// General biomes
		public static function get arachnid():Creature { return new Arachnid(false); }
		public static function get arachnid_pregnant():Creature { return new Arachnid(true); }
		public static function get demon():Creature { return new Demon(); }
		
		// City Biomes
		public static function get bova():Creature { return new Bova(); }
		public static function get witch():Creature { return new Witch(); }
		
		// Mountain biomes
		public static function get harpy():Creature { return new Harpy(false); }
		public static function get harpy_dark():Creature { return new Harpy(true); }
		public static function get morel():Creature { return new Morel(); }
		
		// Desert biomes
		public static function get sandworm():Creature { return new Sandworm(); }
		
		// In development
		public static function get human():Creature { return new Human(); }
		public static function get scylla():Creature { return new Scylla(); }
		public static function get manticore():Creature { return new Manticore(); }
	}

}