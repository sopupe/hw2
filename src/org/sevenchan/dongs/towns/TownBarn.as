package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class TownBarn extends Town 
	{
		
		public function TownBarn() 
		{
			super();
			ID = "barn";
			name = "The Barn";
			inhabitants = [];
			isWilds = false;
			freeRest = true;
			connectedTowns = [
				"banala"
			];
		}
		
		// TODO: Rework
		override public function onRevelation():void 
		{
			text = "<p>You slowly awaken.</p>";
			text += "<p>You stand up, cursing from both pain and frustration as you survey your surroundings.  You appear to have landed in an ancient wooden barn, heavily damaged by an equally ancient fire.  The roof is gone, and the blackened walls have immense cracks through which you can see slivers of the outside world. Looking out of the warped windows, all you can see are rolling red sand dunes beneath a bright, red sky that shimmers in the heat.  The sun looms above, taking up about two-thirds of the sky. The horizon is filled with shimmering mirages.  You tense when you realize that one is coming closer and growing larger, and duck behind a windowsill, still watching.</p>";
			text += "<p>The mirage slowly takes the form of an old, frail main atop an old, rickety merchant's wagon pulled by unseen, but apparently domesticated creatures. As hew draws nearer, a wheel creaks, and then snaps off, throwing the cursing old man into the soft sand below.  You cringe, praying that he'd okay, and sure enough, he stands, muttering &quot;As good a place as any,&quot; and begins setting up his shop.</p>";
			text += "<p>You slink ito the corner of the barn and begin setting up camp, yourself, but quietly. You ARE in Hell, after all, so it wouldn't be wise to run up to the merchant right away.</p>";
		}
		
		override public function onEnter():void 
		{
			text = "<p>You've managed to do some cleaning in the barn, mostly clearing out the old sawdust and hay so you can breathe without erupting into a fit of coughing.  Your camp, with a new fire pit, is set up in the rear of the barn, where most of the roof still remains and a small hand pump still dispenses surprisingly clean water.</p>";
		}
		
		override public function onSuccessfulRest():void 
		{
			text = "<p>You ease yourself into your tent and curl up in the clean wool blanket, possibly the only surviving item left from Aldoria.  The smell of it soothes you into sleep, and you dream of your home.  You wake up  8 hours later, refreshed and alert.</p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = "<p>The barn is extremely old, and appears to have once stored horses, judging by the horseshoes on racks by the door.  No horses exist anymore; the structure was largely gutted by fire some time ago, so only the walls and a portion of the ceiling still stand.</p>";
			text += "<p>Sometime during the night, the merchant decided to move into the barn, and you suddenly notice that he has red skin, like the demons, but doesn’t seem to have bothered you during your sleep.  Maybe there are multiple species, or factions of demons?  You might be able to use this to your advantage.</p>";
			text += "<p>You also notice that flies and dust vanish once they reach the burnt-out hole in the ceiling, so it’s possible that the other end of the portal lies there.  However, the portal is far too high for you to reach.  You silently wish you had wings, despite the fact that you need to finish your business in this world before you return.</p>";
		}
	}

}