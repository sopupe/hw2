package org.sevenchan.dongs.bodyparts
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.*;
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class Penis implements IBodyPart
	{
		registerClassAlias("P_Dick", Penis);
		
		public var size:Number = 0;
		public var sizeMult:Number = 1;
		public var _name:String;
		
		public function Penis(name:String = "", sz:Number = 1, targetEnch:Enchantment = null, hostEnch:Enchantment = null)
		{
			size = sz;
			this._name = name;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get category():String
		{
			return "dicks";
		}
		
		public function getDescr(num:Number, host:Creature):String
		{
			var sizeDesc:String = "average";
			var erectDesc:String = "flaccid";
			var dick:String = getShortDescr();
			
			var lust:Number = host.lust;
			var sz:Number = size * sizeMult;
			
			if (sz > 100)
				sizeDesc = "car-sized, bloated and";
			else if (sz > 50)
				sizeDesc = "man-sized, bulging and";
			else if (sz > 35)
				sizeDesc = "huge, pulsing and";
			else if (sz > 20)
				sizeDesc = "massive";
			else if (sz > 10)
				sizeDesc = "big";
			else if (sz > 7)
				sizeDesc = "large";
			
			if (lust >= 100)
				erectDesc = "rock-hard, throbbing";
			else if (lust >= 75)
				erectDesc = "hard";
			else if (lust >= 50)
				erectDesc = "hardening";
			else if (lust >= 25)
				erectDesc = "growing";
			
			var dm:String = sizeDesc + " " + erectDesc + " " + MathUtils.inchesToFootInches(sz) + " " + name + " " + dick + ((num > 1) ? "s" : "");
			if (num > 1)
				dm = num + " " + dm;
			return dm;
		}
		
		public function getShortDescr(withModifier:Boolean = false):String
		{
			var t:String = "dick"
			if (withModifier)
				t = name + " " + t;
			return t;
		}
		
		public function onFailedAttack(from:Creature, to:Creature):void
		{
		}
		
		public function onGoodAttack(from:Creature, to:Creature):void
		{
		}
		
		public function onAdded(atStore:Boolean, ply:Creature):void
		{
			var text:String = "<h2>New Penis</h2>";
			if (atStore)
			{
				text += "<p>The witch whispers a few words, and then pokes your groin with her wand.  You begin ";
				text += "whispering your own hushed curses as you ";
			}
			else
			{
				text += "<p>You groan as you ";
			}
			text += "feel your groin heat up and begin bulging outward.  The bulge then slowly ";
			text += "worms outward, like a meaty tenticle, until it begins to take the shape of a " + getDescr(1, ply) + "."
			InfoScreen.push(text);
		}
		
		public function onRemoved(atStore:Boolean, ply:Creature):void
		{
			var text:String = "<h2>Remove a Penis</h2>";
			
			if (atStore)
				text += "<p>The old woman mutters a few ancient words under her breath, and then jabs at your " + getDescr(1, ply) + " with her old wand, doing a twisting motion with her wrist as she does so.  An accusing scowl takes over her face and she continues chanting, her voice becoming more angry.  Almost like a dog running away from an angry owner with its tail tucked between its legs, your dong retreats back into your body and vanishes.</p>";
			else
				text += "<p>You groan as your " + getDescr(1, ply) + " retracts into your body like a hose being reeled in.</p>";
			
			InfoScreen.push(text);
		}
		
		public function grow(ply:Creature, atStore:Boolean, size:Number):String {
			var descr:String = getDescr(1, ply);
			return "You feel more weight in your trousers.  Frightened, you look down and see a penis has grown to become " +Utils.A(descr)+" "+descr+ ".";
		}
		
		public function shrink(ply:Creature,atStore:Boolean, size:Number):String {
			return "You groan as you feel your " + getDescr(1, ply) + " sucked back into your body a few inches.";
		}
	}

}