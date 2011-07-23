package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.Town;
	/**
	 * ...
	 * @author N3X15
	 */
	public class WildsHaaraWastes extends Town 
	{
		[Embed(source="txt/haara/intro.htm",mimeType="application/octet-stream")]
		private var Intro:Class;
		
		public function WildsHaaraWastes() 
		{
			super();
			ID = "haara";
			name = "Haara Wastes";
			inhabitants = [
				CreatureRegistry.oldspace,
				CreatureRegistry.arachnid,
				CreatureRegistry.arachnid_pregnant,
				CreatureRegistry.witch,
			];
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
			var re:Number = Math.round(MathUtils.rand(0, 3));
			trace("HAARA EVENT #"+re);
			switch(re) {
				case 0:
					text += "<p>Your trip through the desert is enlightening.</p><p>+1 INT</p>";
					this.main.player.intellect += 1;
					return;
				break;
				case 1:
					text = "<p>While exploring, the sands suddenly swirl about you in a blinding sandstorm.  You wrap your shirt about your face to filter the air, and set about trying to establish a camp for shelter, when you hear a high-pitched laugh pierce the howling winds.  You think you see a woman for brief moment, but she vanishes and the winds subside.  Confused, you return to exploring.</p>";
					main.player.lust += 2;
					return;
				break;
				case 2:
					text += "<p>You trip over a rock and scrape up your hands and face, but otherwise, nothing else happens.</p>";
					main.player.HP -= 2;
					return;
				break;
				case 3:
				break;
			}
			text += "<p>Not much happens during your exploration";
			if(bumpedInto!=null)
				text += ", except for bumping into a " + bumpedInto.getTypeName();
			text +=".</p>";
		}
		
		override public function onRevelation():Boolean 
		{
			text = new Intro();
			return true;
		}
		
	}

}