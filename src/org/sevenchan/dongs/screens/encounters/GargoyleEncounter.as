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
					boobs.pushAction("ADD", -1, "GIRL U NEED MORE MEET ON UR BONEZ", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						gargoyle.addBreast();
						gargoyle.addBreast();
						gargoyle.save();
						node.content = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
						return true;
					});
					boobs.pushAction("REMOVE", -1, "SHIT GRL U LOOK LIKE A WATARMELON CENTERPEED", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						if (gargoyle.breasts.length > 0) {
							gargoyle.breasts=gargoyle.breasts.splice(0, 2);
						}
						gargoyle.save();
						node.content = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
						return true;
					});
				}
			}
			else {
				currentItem.content = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
			}
		}
	}

}