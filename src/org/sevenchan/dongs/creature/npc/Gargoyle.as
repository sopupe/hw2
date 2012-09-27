package org.sevenchan.dongs.creature.npc 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.encounters.GargoyleEncounter;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Gargoyle extends NPC 
	{
		public var confidence:int = 0;
		public function Gargoyle() 
		{
			super("Gargoyle");
			// Defer setup until later.
		}
		override public function getTypeName():String 
		{
			return "Gargoyle";
		}
		override public function onNewNPC():void 
		{
			trace("Gargoyle.onNewNPC()!");
		}
		
		override public function onLoad(npc:NPC):void 
		{
			trace("Gargoyle.onLoaded()!", npc);
			if (npc!=null)
			{
				confidence = (npc as Gargoyle).confidence;
			}
		}
		override public function onEncounter(ply:Creature):Boolean 
		{
			GargoyleEncounter.push(this);
			return true;
		}
		override public function getHostile(subj:Creature):Boolean 
		{
			return false;
		}
		
	}

}