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
		
		override public function onRevelation():void 
		{
			text = "<h2>Welcome to Hell</h2>";
			text += "<p>You slowly awaken.</p>";
			text += "<p>You stand up, cursing from both pain and ";
			text += "frustration as you survey your surroundings. You appear to have landed ";
			text += "in an ancient wooden barn, heavily damaged by an equally ancient fire. ";
			text += "The roof is gone, and the blackened walls have immense cracks through ";
			text += "which you can see slivers of the outside world. Looking out through the ";
			text += "warped windows, all you can see are rolling red sand dunes beneath a ";
			text += "bright, red sky that shimmers in the heat. The sun looms above, taking ";
			text += "up about two-thirds of the sky. The horizon is filled with shimmering ";
			text += "mirages. You tense when you realize that one is coming closer and ";
			text += "growing larger, and your heart races. Besides the demons known to ";
			text += "populate this land, you have no idea what to expect, and duck behind a ";
			text += "charred windowsill to be safe. You peek over the top, nervously ";
			text += "observing.</p>";
			text += "<p>The mirage slowly takes the form of an old, frail ";
			text += "sunburnt man atop an old, rickety merchant's wagon pulled by unseen, but ";
			text += "apparently domesticated creatures. As he draws nearer, a wheel creaks, ";
			text += "and then snaps off, throwing the cursing old man into the soft sand ";
			text += "below. You cringe, praying that he'd okay, and sure enough, he stands ";
			text += "and mutters in frustration. He examines the remains of his wagon’s axle ";
			text += "before sighing and initiating the process of setting up his shop in the ";
			text += "back of the wagon, still cursing under his breath.</p>";
			text += "<p>Satisfied that ";
			text += "he’s probably not a threat, you quietly set up camp in the shaded back ";
			text += "of the barn. However, you decide to take your time and observe the ";
			text += "merchant some more before approaching him for wares. This is Hell, after ";
			text += "all. Who knows what could happen?</p> ";
			text += "";
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