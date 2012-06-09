package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.screens.ShopScreen;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class TownDamned extends Town 
	{
		
		public function TownDamned() 
		{
			super();
			ID = "damned";
			name = "Damned";
			inhabitants[CreatureRegistry.demon] = 0.1;
			inhabitants[CreatureRegistry.bova] = 0.1;
			inhabitants[CreatureRegistry.witch] = 0.1;
			
			isWilds = false;
			freeRest = false;
			connectedTowns = [
				"horus",
				"lake"
			];
			this.shop = new ShopScreen(this, 20, [
				ItemRegistry.BERRY_WHITE.id,
				ItemRegistry.POTION_PINK.id,
				ItemRegistry.SPIDER_VENOM.id,
				ItemRegistry.GAS_MASK.id,
			]);
		}
		
		override public function onEnter():void 
		{
			text = "<p>The city festers around you, ignorant of your plans.</p>";
		}
		
		override public function onRevelation():Boolean 
		{
			if (main.player.hasEnchantment("windblessing")) {
				text = "<h2>Damned</h2><p>You look up from the rock path cut into the mountain, dust "
				+"caked into your travel-tanned skin.  As you reach the summit of the mountain, you "
				+"look ahead and see a thickly forested valley, with a city in the middle.  You make "
				+"your way towards it, and begin to make it out.</p>" +
				"<p>Black towers with eerie red lights stretch into the burning skies, as though "
				+"defying gravity itself.  Walkways interconnect the tower and swarm with beasts "
				+"great and small.  A terrible smell, that of death and body odor, fills the murky "
				+"air.  To top it all off, as you reach the front gate, a tattered iron sign "
				+"proudly proclaims the city's name: Damned.</p>";
				return true;
			} else {
				// WIND BOSS
				//trace("COMBATTIEM");
				main.startCombat(null, CreatureRegistry.ala);
				return false;
			}
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = "<p>Damned is an immense city built from a black stone mined from the surrounding "
				+"mountains. Torches are everywhere because of the stone making the rooms, towers, and "
				+"catwalks around the city look dark.  You doubt any amount of torches would make the "
				+"city look even remotely inviting, as the designers seemed to have thrown up their "
				+"hands in exasperation and went with the evil theme.  Sharp-looking rock spires jut "
				+"from every external surface, and some corpses are even skewered on many of them,  "
				+"either as a warning or, more likely, purely for decoration.</p>"
				+"<p>The people that live here aren't much friendlier.  Roving gangs of thugs "
				+"terrorize the business district, demanding money for &quot;protection&quot;, many "
				+"simply killing the owner after taking his money.  Smarter (and richer) business "
				+"owners have resorted to hiring their own gangs to protect themselves from the other "
				+"gangs (and earn side-money selling narcotics and whores).  The entire town is a "
				+"cycle of crime.</p>";
		}
		
		override public function onShopWelcome():String 
		{
			return "<p>&quot;Well, I'll be goddamned.  If it isn't an outsider.&quot; A thick, "
				+"italian accent remarks from behind fat, red lips in the middle of an equally "
				+"fat red face.  You can't do anything but stare at the top of the demon's head, where "
				+"a pile of grease that might have once been hair resides.</p><p>The man frowns. "
				+"&quot;Are you gonna buy anything, or what?&quot;  He crosses his rather hairy arms."
				+"</p>";
		}
		
		override public function onShopBuyMenu():String 
		{
			return "<p>You can hear sweaty palms rub together anxiously as a terrifying grin parts the "
				+"shopkeeper's mouth.  &quot;Great, so what'll it be?&quot;";
		}
		
		override public function onShopSellMenu():String 
		{
			return "<p>&quot;Oh, and who did you steal this from?  Nah, just kidding, show me what you"
				+"'ve got.&quot;</p>";
		}
	}

}