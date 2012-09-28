package org.sevenchan.dongs.creature.npc 
{
	import org.sevenchan.dongs.bodyparts.Breast;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.encounters.GargoyleEncounter;
	import flash.net.*;

	/**
	 * ...
	 * @author Harbinger
	 */
	public class Gargoyle extends NPC 
	{
		registerClassAlias("_NPC_Gargoyle", Gargoyle);
		public var confidence:int = 0;
		public function Gargoyle() 
		{
			super("Gargoyle");
			// Defer setup until onNewNPC, since it's stored in saves.
		}
		override public function getTypeName():String 
		{
			return "Gargoyle";
		}
		override public function onNewNPC():void 
		{
			trace("Gargoyle.onNewNPC()!");
			ownName = "The Gargoyle";
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
		
		override public function addBreast():Breast 
		{
			var boob:Breast = BodyPartRegistry.demon_breast;
			boob.size = 6;
			breasts.push(boob);
			return boob;
		}
		
	}

}