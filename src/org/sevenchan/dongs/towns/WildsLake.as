package org.sevenchan.dongs.towns
{
	import org.sevenchan.dongs.items.Fish;
	import org.sevenchan.dongs.items.WhiteBerries;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class WildsLake extends Town
	{
		
		public function WildsLake()
		{
			super();
			ID = "lake";
			name = "The Black Lake";
			inhabitants = [CreatureRegistry.scylla, CreatureRegistry.harpy_dark, CreatureRegistry.arachnid, CreatureRegistry.arachnid_pregnant, CreatureRegistry.witch,];
			isWilds = true;
			freeRest = true;
			connectedTowns = ["damned"];
		}
		
		override public function onEnter():void
		{
			text = "<p>The water is not really inviting.</p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void
		{
			var re:Number = Math.round(MathUtils.rand(0, 3));
			switch (re)
			{
				case 0: 
					text = "<p>The sound of water rythmically rapping at the shore of the lake helps relax you.</p><p><b>+1 INT, +5 HP, +5 XP</b></p>";
					
					this.main.player.intellect += 1;
					this.main.player.XP += 5;
					this.main.player.HP += 5;
					break;
				case 1: 
					text = "<p>You casually jog around the shore of the lake, slightly improving your speed.</p>";
					this.main.player.speed += 1;
					return;
					break;
				case 2: 
					text = "<p>You find a pair of sweet, white berries.</p>";
					main.player.addToInventory(new WhiteBerries(2));
					return;
					break;
				case 3: 
					text = "<p>You try to catch what appears to be a kind of fish with your bare hands. ";
					if (main.player.speed < 50)
					{
						text += "Unfortunately, you're too slow, and it darts off.</p>";
					}
					else
					{
						text += "You breathe, and, after slowly getting your hand near the fish, you snatch it from the water and toss it into your bag.</p>";
						main.player.addToInventory(new Fish(1));
					}
					return;
					break;
			}
			main.player.mana += 10;
			
			text += "<p>Not much else happens during your exploration";
			if (bumpedInto != null)
			{
				text += ", except for bumping into a " + bumpedInto.getTypeName();
			}
			text += ".</p>";
		
		}
		
		override public function onRevelation():Boolean
		{
			text = "<h2>The Black Lake</h2>";
			text += "<p>As you walk along the path leading away from the city, you enter ";
			text += "a dense forest, surrounded on two sides by snow-capped mountains.  ";
			text += "You hear crows calling out amongst the dark, foggy treetops, echoing";
			text += " against the hills.</p>";
			text += "<p>As you continue, the fog gets thicker, until you can barely see in ";
			text += "front of you.  At that moment, your feet sink into sand.  Cautiously ";
			text += "continuing forward, the air clears, and you find yourself looking at ";
			text += "a large lake, framed by mountains on all side.  The water is ";
			text += "impenetrably dark, and you see movement beneath the waves.</p>";
			
			return true;
		}
	
	}

}