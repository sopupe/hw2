package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.*;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Wing implements IBodyPart
	{
		private var descriptor:String;
		private var species:String;
		private var reptilian:Boolean;
		private var wingspan:Number;
		public function Wing(species:String,reptilian:Boolean,_descr:String,wingspan:Number) 
		{
			this.species = species;
			this.reptilian = reptilian;
			descriptor = _descr;
			this.wingspan = wingspan;
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " " + descriptor + " "+(reptilian?"reptilian":"feathered")+ " " + species + " wing"+(num>1?"s":"");
		}
		
		public function get name():String { return species; }
		
		public function onFailedAttack(from:Creature, to:Creature):void {}
		public function onGoodAttack(from:Creature, to:Creature):void {}
		
	}

}