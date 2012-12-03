package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.screens.encounters.HaaraRevelationEncounter;
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
			HaaraRevelationEncounter.push();
			return false;
		}
		
	}

}