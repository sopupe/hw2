package org.sevenchan.dongs.towns
{
	
	/**
	 * Used for masturbation scene selection, and other biome-specific text
	 * @author Harbinger
	 */
	public class Biome
	{
		public static const WOODS:Biome = new Biome("woods");
		public static const PLAINS:Biome = new Biome("plains");
		public static const BEACH:Biome = new Biome("beach");
		public static const JUNGLE:Biome = new Biome("jungle");
		public static const MOUNTAINS:Biome = new Biome("mountains");
		public static const CAVE:Biome = new Biome("cave");
		
		public var name:String = "";
		
		public function Biome(name:String)
		{
			this.name = name;
		}
	
	}

}