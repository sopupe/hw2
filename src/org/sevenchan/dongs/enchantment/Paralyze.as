package org.sevenchan.dongs.enchantment 
{
	import flash.sampler.NewObjectSample;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
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
			if(newHost is Player) {
				InfoScreen.push("<h2>Paralyzed</h2><p>You are now paralyzed.</p><p>Check your appearance screen to see your effects.</p>");				
				return "You are now paralyzed.";
			}
			var creatureRef:String = newHost.getTypeName();
			var story:String = <![CDATA[
<h2>Morel Dust</h2>
<p>
	You jam your hand into your pack and withdraw a small clay jar. Judging its weight and eyeing {the [CREATURE]}.  %CSUB% eyes you 
	right back, albeit wary of the container in your hand, and equally wary of your darkening expression.
</p>
<p>
	Without warning, you throw the jar at %CSUB%, and ]]>.toString();
	if(newHost.speed > 0.25){
		story += "reacting quickly, the "+creatureRef+" rolls out of the way as the jar strikes the ground";
	} else {
		if(newHost.arms.length == 0 || isParalyzed(newHost))
			story+="being unable to move";
		else
			story += "having poor reaction time";
		story += ", the jar smashes into %POS% arm";
	} 
	story += <![CDATA[ and shatters, releasing the powder into the air in a small black explosion.
</p>
<p>
	%CSUB% immediately goes limp and collapses to the ground, paralyzed from the morel dust's effects.
</p>
]]>.toString();
			newHost.gender.doReplace(story);
			return "The " + creatureRef + " is now paralyzed.";
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