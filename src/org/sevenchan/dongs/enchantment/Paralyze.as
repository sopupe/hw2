package org.sevenchan.dongs.enchantment 
{
	import flash.sampler.NewObjectSample;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.CombatScreen;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Paralyze extends Enchantment 
	{
		private var host:Creature;
		private var turn:int = 0;
		public function Paralyze() 
		{
		}
		
		public static function isParalyzed(subj:Creature):Boolean {;
			return subj.hasEnchantment("paralyze");
		}
		override public function onInit(newHost:Creature):String 
		{
			host = newHost;
			cancelAddition = false;
			InfoScreen.push("<h2>Paralyzed</h2><p>You are now paralyzed.</p><p>Check your appearance screen to see your effects.</p>");
			return "You are now paralyzed.";
		}
		
		override public function onMyCombatTurn(screen:CombatScreen,other:Creature):Boolean
		{
			turn++;
			trace("Paralyze.onMyCombatTurn()")
			if (turn>=3)
			{
				remove();
			}
			return super.onMyCombatTurn(screen,other);
		}
		
		override public function onCombatComplete(hostWon:Boolean, other:Creature):void 
		{
			remove();
		}
		
		private function remove():void {
			InfoScreen.push("<h2>NOT Paralyzed</h2><p>You are no longer paralyzed.</p>");
			delete host.enchantments[getID()];
		}
		
		override public function getID():String 
		{
			return "paralyze";
		}
	}

}