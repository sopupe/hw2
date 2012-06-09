package org.sevenchan.dongs.ability 
{
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Instawin extends Ability 
	{
		
		public function Instawin() 
		{
			this.manaCost = 0;
			this.description = "Because the attack damage algorithm is fucked.";
			this.label = "Instawin";
			this.name = "Instant Win";
			this.cannotBeRestrainedToUse = false;
		}
		
		override public function activate(activator:Creature, rapee:Creature):Boolean 
		{
			InfoScreen.push("<h2>Insta-win!</h2><p>You fucking cheat and win because Harbinger is too tired to fix the punch damage thing.</p>");
			rapee.HP = 0;
			return true;
		}
		
	}

}