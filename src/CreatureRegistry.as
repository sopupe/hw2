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
		public static var ala:Creature = new Ala();
		public static var arachnid:Creature = new Arachnid(false);
		public static var arachnid_pregnant:Creature = new Arachnid(true);
		public static var demon:Creature = new Demon();
		public static var harpy:Creature = new Harpy(false);
		public static var harpy_dark:Creature = new Harpy(true);
		public static var human:Creature = new Human();
		public static var morel:Creature = new Morel();
		public static var oldspace:Creature = new SandNigger();
	}

}