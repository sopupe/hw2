package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.Town;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class WildsHaaraWastes extends Town 
	{
		
		public function WildsHaaraWastes() 
		{
			super();
			ID = "haara";
			name = "Haara Wastes";
			
			inhabitants[CreatureRegistry.arachnid] = 0.1;
			inhabitants[CreatureRegistry.arachnid_pregnant] = 0.1;
			inhabitants[CreatureRegistry.witch] = 0.1;
			//inhabitants[CreatureRegistry.sandworms] = 0.1;
			
			isWilds = true;
			freeRest = true;
			connectedTowns = [
				"banala"
			];
			
		}
		
		override public function onEnter():void 
		{
			text = "<p>The desert stretches from horizon to horizon before you, beckoning you forwards.</p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = "<p>The Haara is what you'd generally expect from deserts.  Although the area nearest Banala is primarily endless sand dunes in every direction, the rest of the desert are sand-blasted rock plains, with plenty of places for the various inhabitants of the wastes to hide and lay ambush.</p>";
			var re:Number = Math.round(MathUtils.rand(0, 2));
			trace("HAARA EVENT #"+re);
			switch(re) {
				case 0:
					text += "<p>Your trip through the desert is enlightening.</p><p>+1 INT</p>";
					this.main.player.intellect += 1;
					return;
				break;
				case 1:
					text += "<p>You trip over a rock and scrape up your hands and face, but otherwise, nothing else happens.</p>";
					main.player.HP -= 2;
					return;
				break;
				default:
				break;
			}
			text += "<p>Not much happens during your exploration";
			if(bumpedInto!=null)
				text += ", except for bumping into a " + bumpedInto.getTypeName();
			text +=".</p>";
		}
		
		override public function onRevelation():Boolean 
		{
			text = <![CDATA[
<p>
	For some reason, you get it into your thick skull to wander
	out into the desert surrounding Banala (which - according to the grouchy
	Innkeeper, anyway - is called the Haara Wastes, after the demon general who led his army
	into it and was never heard from again). Not being braindead, however, you bring enough water
	to get you into the blinding desert for a couple of <i>weeks</i>, provided you
	ration your water.
</p>
<p>
	Unfortunately, the desert has other plans.
</p>
<p>
	The first day into your journey into the wastes, you
	discover, to your horror, that the goatskin bag with your water has come apart
	at the bottom, and most of the water had leaked out over the desert.  You begin
	to head back to Banala, but become aware of the fact that the sun is going
	down, and you have no idea where you are.  You sigh, check the other goatskin,
	and set up camp for the night.
</p>
<p>
	Your sleep is fitful, and you dream of the shifting sands,
	and the creatures that might inhabit the Wastes.  You then dream of a beautiful
	woman, dressed in long, sand-colored robes, rising from the desert.  She approaches
	you, lays a hand on your cheek, and whispers your name into your ear.
</p>
<p>
	You awaken to find a golden flask, dusted lightly in sand,
	propped up next to you.  Startled, you jump to your feet and look around the camp quickly, but find no one. 
	Wondering what the hell is going on, you peer into the flask, and find a clear
	fluid at the bottom. <i>Water? But how did...?</i>  You raise it to your lips,
	just to be sure, and taste it.  A surprising amount of water hits your lips,
	and you hungrily drink.  To your further surprise, the flask stays the same
	weight. Shaking your head in pure, abject wonder, you begin the task of packing up your dusty camp to continue your exploration of the desert, sans one goatskin bag.
</p>
			]]>.toString();
			return true;
		}
		
	}

}