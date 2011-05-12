package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.items.WhiteBerries;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	/**
	 * ...
	 * @author N3X15
	 */
	public class WildsHorusSpine extends Town 
	{
		
		public function WildsHorusSpine() 
		{
			super();
			ID = "horus";
			name = "Horus' Spine";
			inhabitants = [
				new Arachnid(false),
				new Morel(),
				new Harpy(false),
				new Harpy(true)
			];
			isWilds = true;
			freeRest = true;
			connectedTowns = [
				"banala"
			];
		}
		
		
		
		override public function onEnter():void 
		{
			text = "<p>The mountains wait, as they have since the beginning of time.</p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			var re:Number = Math.round(MathUtils.rand(0, 3));
			switch(re) {
				case 0:
					text = "<p>The serene landscape clears your thoughts, and tests your muscles.</p><p><b>+1 INT, +1 STR</b></p>";
					this.main.player.intellect += 1;
					this.main.player.strength += 1;
				break;
				case 1:
					text = "<p>A rock falls onto your head while you explore, eliciting a long string of curses that echo across the landscape.</p>";
					main.player.HP -= 5;
				break;
				case 2:
					text = "<p>You see harpies circling over a mountain peak, probably preparing to swoop down on some poor bastard.  You take a turn to avoid them.</p>";
					return;
				break;
				case 3:
					text = "<p>You find some sweet, white berries.</p>";
					main.player.addToInventory(new WhiteBerries(2));
					return;
				break;
			}
			main.player.mana += 10;
			
			text += "<p>Not much else happens during your exploration";
			if(bumpedInto!=null) {
				text += ", except for bumping into a " + bumpedInto.getTypeName();
				text += ", who nearly tumbles off a cliff";
			}
			text += ".</p>";
			
		}
		
		override public function onRevelation():void 
		{
			text = "<h2>Horus' Spine</h2>";
			text += "<p>It's not hard to see how the travelers who crossed these mountains long ago gave them their name.  Gigantic white rocks stretch into the sky.  You assume them to be limestone, not that it matters here.  For all you know, it could be the dried semen that the lustful creatures here collect and dump into massive piles that reach into the sky.  You shudder at the thought.</p>";
			text += "<p>Gripping a random branch on the ground as a walking stick, you begin your ascent into the unknown.</p>";
		}
		
		
		
	}

}