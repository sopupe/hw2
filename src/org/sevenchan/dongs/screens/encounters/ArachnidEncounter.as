package org.sevenchan.dongs.screens.encounters
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Arachnid;
	import org.sevenchan.dongs.screens.Encounter;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class ArachnidEncounter extends Encounter
	{
		
		public function ArachnidEncounter(target:Creature)
		{
			super(target);
			currentItem.clearChildren();
			currentItem.content = text;
			currentItem.pushAction("Accept", -1, "Accept the invitation.", onEncounterAccept);
			currentItem.pushAction("Decline", -1, "Tell her to piss off.", onEncounterDecline);
		}
		
		override public function onStartupScreen():void {
			text = "<p>While exploring the area, you suddenly come across many large spiderwebs. ";
			text += "You brush through them, when you hear something scuttle through the brush ";
			text += "behind you. Worried, you slowly turn around, and see a beautiful woman.  ";
			text += "Or at least, the top half of one atop the body of a enormous black spider, ";
			text += "and if women had 8 red, gleaming eyes.</p>";
			text += "<p>She blushes as you stare at her strange, twisted body.  &quot;I hope you like";
			text += " what you ssssssee,&quot; she hisses awkwardly.  &quot;I mussssst mate ";
			text += " ssssssoon, and it ssssseems that you are the only... male nearby.";
			text += "&quot;  She smiles, fondling one of her plump breasts.  &quot;I hope you don't";
			text += " mind.  Otherwise, I will have to fffffight you.&quot;</p>";
		}
		
		public static function push(a:Arachnid):void
		{
			AdventureController.screenQueue.write(new ArachnidEncounter(a));
		}
		
		private function onEncounterAccept(ply:Creature, node:ActionNode, o:*):Boolean
		{
			performRape(ply, node);
			return true;
		}
		
		private function onEncounterDecline(ply:Creature, node:ActionNode, o:*):Boolean
		{
			fight(ply, node);
			return true;
		}
	
	}

}