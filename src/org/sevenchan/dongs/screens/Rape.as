package org.sevenchan.dongs.screens
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.MenuNode;
	
	/**
	 * Just use the menus presented by the creature.
	 * @author Harbinger
	 */
	public class Rape extends Encounter
	{
		public function Rape(target:Creature)
		{
			super(target);
			lustCost = 3;
			currentItem.clearChildren();
			target.onRape(MenuNode(currentItem));
		}
	}

}