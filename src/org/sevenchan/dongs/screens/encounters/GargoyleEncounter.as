package org.sevenchan.dongs.screens.encounters
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.npc.Gargoyle;
	import org.sevenchan.dongs.creature.npc.NPC;
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.screens.Encounter;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class GargoyleEncounter extends Encounter
	{
		
		public static function push(subj:Gargoyle):void
		{
			AdventureController.screenQueue.write(new GargoyleEncounter(subj));
		}
		
		public var gargoyle:Gargoyle = new Gargoyle();
		
		public function GargoyleEncounter(subj:Gargoyle)
		{
			super(subj);
			gargoyle.load();
			currentItem.clearChildren();
			if (!gargoyle.getExplored("PC"))
			{
				gargoyle.setExplored("PC");
				currentItem.content = "TESTING THE GODDAMN NPC SERIALIZING STUFF";
				var boobs:MenuNode = currentItem.pushMenu("BOOBUSSES", "HOW MANY TITS DOES SHE HAVE")
				{
					boobs.pushAction("ADD", -1, "GIRL U NEED MORE MEET ON UR BONEZ", addBoobs);
					boobs.pushAction("REMOVE", -1, "SHIT GRL U LOOK LIKE A WATARMELON CENTERPEED", remBoobs);
				}
			}
			else
			{
				currentItem.content = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
			}
		}
		
		override public function onStartupScreen():void 
		{
			gargoyle.load();
			text = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
		}
		override public function onLeaving():void 
		{
			gargoyle.save();
		}
		
		private function addBoobs(ply:Creature, node:ActionNode, o:*):Boolean
		{
			gargoyle.addBreast();
			gargoyle.addBreast();
			text = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
			trace(text);
			return false;
		}
		
		private function remBoobs(ply:Creature, node:ActionNode, o:*):Boolean
		{
			if (gargoyle.breasts.length > 0)
			{
				gargoyle.breasts = gargoyle.breasts.splice(0, 2);
			}
			text = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
			trace(text);
			return false;
		}
	}
}