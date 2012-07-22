package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.*;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Wing implements IBodyPart
	{
		private var descriptor:String;
		private var species:String;
		private var reptilian:Boolean;
		private var wingspan:Number;
		public function Wing(species:String,reptilian:Boolean,_descr:String,wingspan:Number,value:Number) 
		{
			this._value = value;
			this.species = species;
			this.reptilian = reptilian;
			descriptor = _descr;
			this.wingspan = wingspan;
		}
		
		public function get sellDesc():String { return getShortDescr(true); }
		
		private var _value:Number;
		public function get value():Number {
			return _value;
		}
		
		public function get category():String {
			return "wings";
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " " + descriptor + " "+(reptilian?"leathery":"feathered")+ " " + species + " wing"+(num>1?"s":"");
		}
		
		public function get name():String { return species; }
		
		
		public function getShortDescr(withModifier:Boolean = false):String 
		{
			var t:String = "wing";
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void {}
		public function onGoodAttack(from:Creature, to:Creature):void {}
		
	}

}