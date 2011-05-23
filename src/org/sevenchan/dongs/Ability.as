package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Ability 
	{
		
		public var label:String = "";
		public var name:String = "";
		public var description:String = "";
		
		public function Ability() 
		{
			
		}
		
		public function activate(activator:Creature, rapee:Creature):Boolean {
			return true;
		}
	}

}