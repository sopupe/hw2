package org.sevenchan.dongs.enchantment 
{
	import flash.net.registerClassAlias;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Demon;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * Oh look I made an STD
	 * @author N3X15
	 */
	public class Corruption extends Enchantment 
	{
		registerClassAlias("ECorruption", Corruption);
		public var level:Number;
		public var host:Creature;
		public function Corruption(amt:Number) 
		{
			super();
			level = amt;
		}
		
		override public function getName():String 
		{
			return "Corruption";
		}
		
		override public function getDescr():String 
		{
			return "Then John was the demons. Current level: " + level;
		}
		
		override public function onInit(newHost:Creature):String 
		{
			host = newHost;
			if (level == -1) {
				level = 0;
				cancelAddition = true;
				delete newHost.enchantments[getID()];
				return "You are no longer corrupted.";
			}
			if (newHost.enchantments[getID()] != null) {
				(newHost.enchantments[getID()] as Corruption).level += level;
				cancelAddition = true;
				if (level >= 100)
				{
					if(host is Player) {
						(host as Player).changeTo(new Demon());
					} else {
						var oldHost:Creature = host;
						host = new Demon();
						host.changeFrom(oldHost);
					}
					level = 100;
				}
				return "Your corruption level has increased to level "+getLevelOf(newHost)+".";
			} else {
				if(host is Player) {
					var ply:Player = Player(host);
					if (!ply.getExplored("corruptionintro")) {
						ply.setExplored("corruptionintro");
						InfoScreen.push("<h2>Corrupted</h2><p>You are now " + level + "% corrupted.  If this reaches 100%, you will become a Demon.</p><p>Check your appearance screen to see your effects.</p>");
					}
				}
				return "You are now corrupted.";
			}
			if (statbar == null && host is Player) {
				statbar = (newHost as Player).AdventureController.createNewStatusBar();
			}
		}
		
		public static function getLevelOf(host:Creature):Number {
			if (host.enchantments["corruption"] != null)
				return (host.enchantments["corruption"] as Corruption).level;
			return 0;
		}
		
		override public function onCombatComplete(hostWon:Boolean, other:Creature):void 
		{
		}
		
		override public function getID():String 
		{
			return "corruption";
		}
	}

}