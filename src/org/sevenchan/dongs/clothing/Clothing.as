package org.sevenchan.dongs.clothing 
{
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * An article of clothing or armor, is also an item.
	 * @author Harbinger
	 */
	public class Clothing extends Item
	{
		public var HP:Number = 0;
		public var maxHP:Number = 5;
		public var type:ClothingType = ClothingType.HEADGEAR; // Determines what is obscured.
		public var opaque:Boolean = true;
		public var isArmor:Boolean = false;
		
		public function Clothing(num:uint=0) 
		{
			super(num);
		}
		
		/**
		 * Used by the body part to determine if it's being hidden.
		 * @param	part
		 */
		public function isObscuring(part:IBodyPart):Boolean {
			return opaque && type.obscures.some(function(o:*):Boolean {
				return part.category == (o as String);
			});
		}
		
		public function getDescr(host:Creature):String {
			return "[LOL NO GetDescr()!]";
		}
		
		override public function Use(host:Creature):Boolean 
		{
			if ((HP / maxHP) < 0.1){
				InfoScreen.push("This " + this.getDescr(host) + " is too damaged to be worn.");
				return false;
			}
			var text:String = "";
			switch(type) {
				case ClothingType.FOOTWEAR:
					if (host.legs.length == 0){
						InfoScreen.push("You cannot wear this item, as you have no legs with feet on which to wear them.");
						return false;
					}
					text = "You drop the " + this.getDescr(host) + " onto the ground and slide your feet into them, finding them nice and snug";
					if (HP / maxHP < 0.5)
						text += ", despite the holes";
					else if (HP / maxHP < 0.7)
						text += ", despite the obvious wear";
					text += "."
					break;
				case ClothingType.HEADGEAR:
					text = "You place the " + this.getDescr(host) + " onto your head, knowing that you now look";
					if (HP / maxHP < 0.5)
						text += " like a peasant on his way to a soup kitchen.";
					else if (HP / maxHP < 0.7)
						text += " like an old gentleman, the item being as worn as it is.";
					else 
						text += " very dapper.";
					break;
				case ClothingType.PANTS:
					if (host.legs.length == 0){
						InfoScreen.push("You cannot wear this item, as you have no legs to wear them on.");
						return false;
					}
					text = "You find a nice secluded area and slip into your " + this.getDescr(host);
					if (HP / maxHP < 0.5)
						text += ", being mindful of the huge holes slashed into the garment";
					else if (HP / maxHP < 0.7)
						text += ", aware of the worn knees and scratches.";
					break;
				case ClothingType.TOP:
					text = "Ensuring no one's around to catch you off-guard, you slip the " + this.getDescr(host) + " over your head";
					if (HP / maxHP < 0.5)
						text += ", peeking through the holes and cuts to be sure no one sneaks up on you.";
					else if (HP / maxHP < 0.7)
						text += ", ignoring the scratches and loose fibers.";
					break;
			}
			InfoScreen.push(text);
			host.clothing.push(this);
			return true;
		}
		
	}

}