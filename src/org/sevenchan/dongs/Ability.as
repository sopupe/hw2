package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Ability 
	{
		
		public var label:String = "";
		public var name:String = "";
		public var description:String = "";
		public var manaCost:Number = 25;
		public var cannotBeRestrainedToUse:Boolean = true;
		
		public function Ability() 
		{
			
		}
		
		public function activate(activator:Creature, rapee:Creature):Boolean {
			return true;
		}
	}

}