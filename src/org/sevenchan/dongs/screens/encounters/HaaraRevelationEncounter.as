package org.sevenchan.dongs.screens.encounters 
{
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Hunger;
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.screens.Encounter;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class HaaraRevelationEncounter extends Encounter 
	{
		public static function push():void
		{
			AdventureController.screenQueue.write(new HaaraRevelationEncounter(null));
		}
		public function HaaraRevelationEncounter(target:Creature) 
		{
			super(target);
			lustCost = 0;
			currentItem.clearChildren();
			text = <![CDATA[
				<p>
					For some reason, you get it into your thick skull to wander out into the desert surrounding Banala
					(which - according to the grouchy Innkeeper, anyway - is called the Haara Wastes, after the demon
					general who led his army into it and was never heard from again). Since you're not completely 
					braindead, you bring enough water to allow you to survive in the blinding desert for a couple of 
					weeks, provided you ration it carefully.
				</p>
				<p>
					Unfortunately, the desert has other plans.
				</p>
				<p>
					The first day into your journey, you are horrified to discover that the goatskin bag containing your 
					main water supply has come apart at the bottom, and most of the water has already leaked out. You 
					begin to head back to Banala, but the rapidly setting sun and the fact that you have no idea where 
					you are gives you pause.
				</p>
			]]>.toString();
			currentItem.content = text;
			currentItem.canGoBack = false;
			currentItem.pushAction("Banala", -1, "Head back to Banala.", onBanala, null);
			var mnuCamp:MenuNode = currentItem.pushMenu("Camp", "Set up camp.");
			{
				mnuCamp.content = <![CDATA[
					<p>You sigh, check your spare goatskin, and set up camp for the night.</p>
					<p>
						Your sleep is fitful. You dream of the shifting sands, and the mysterious creatures that might inhabit the Wastes.
					</p>
					<p>
						You then dream of a beautiful woman, dressed in long, sand - colored robes, rising from the desert.  She approaches you, lays a hand on your cheek, and whispers your name into your ear.
					</p>
					<p>
						You awaken to a golden flask, lightly dusted with sand, propped up next to you.  Startled, you jump to your feet and look around the camp quickly, but find no one. Wondering what the hell is going on, you peer into the flask, and find a clear fluid at the bottom.
					</p>
					
				]]>.toString();
				
				/* Menu: Drink/Don’t Drink */
				mnuCamp.canGoBack = false;
				mnuCamp.pushAction("Drink", -1, "Drink the contents.", onDrink);
				mnuCamp.pushAction("Don't drink", -1, "Leave it sealed.", onNoDrink);
			}
		}
		
		public function onNoDrink(ply:Creature, node:ActionNode, o:*):Boolean {
			//If player selects Don’t Drink*

			text=<![CDATA[
				<p>
					Suspicious, you ignore the mysterious flask and begin packing your belongings for the journey 
					back to Banala. As you leave, you give a single glance back to the flask, but only see swirling sands.
				</p>
				<p>
					The walk back is arduous, and you begin to wish you had taken a chance and drunk from the flask. By 
					the time you finally find the road leading back to Banala, your throat is painfully parched.
				</p>
			]]>.toString();
			//Player loses some HP, but not as much as they would if they had not camped in the desert.
			main.player.HP = main.player.HP / 8;
			return true;
		}
		
		public function onDrink(ply:Creature, node:ActionNode, o:*):Boolean
		{
			text=<![CDATA[
				<p>
					You raise the flask to your lips cautiously, and taste the liquid within.
				</p>
			]]>.toString();
			// Game randomly selects the flask’s contents.
			var possibilities:Array = new Array(
				"water",
				"pink potion",
				"gold potion"
			);
			
			//CONSEQUENCES
			var result:String = String(MathUtils.getRandomArrayEntry(possibilities));

			// If flask contents are water
			if (result == "water")
			{
				text+=<![CDATA[
					<p>
						Water? But how did...?   A surprisingly large flood of water of pours into your mouth, and you hungrily drink.
					</p>
				]]>.toString();
			}
			//If flask contents are pink potion
			if (result == "pink potion")
			{
				text+=<![CDATA[
					<p>
						The flask’s warm liquid rushes down your throat. It tastes almost like warm milk, but sweeter. A strange 
						warmth spreads over your chest, and you drop the flask in surprise as your [breast description] begin 
						to expand. 
					</p>
				]]>.toString()
					.replace("[breast description]", main.player.getBreastDescr());
				
				// Player’s breast size increases
				if (main.player.breasts.length == 0) {
					trace(main.player,"doesn't have boobs, adding.");
					main.player.addBreast();
					main.player.addBreast();
				} else {
					for (var i:int = 0; i < main.player.breasts.length;i++)
						main.player.breasts[i].bigger();
				}
				var lastPart:String = <![CDATA[
					<p>
						Pulling open your [clothing description], you curiously squeeze your new [breast description]. You 
						attempt to stand and stagger slightly, unused to the new, heavy weight on your chest.
					</p>
				]]>.toString()
					.replace("[breast description]", main.player.getBreastDescr())
					.replace("[clothing description]", main.player.getClothingDescr()); // TODO: Use ClothingType.Top or something.
			}
			// If flask contents are gold potion
			if (result == "gold potion")
			{
				var effects:String = "";
				// If player has less than max HP
				if (main.player.HP < main.player.maxHP)
				{
					effects += "All the scrapes and bruises you’ve accumulated disappear.";
					main.player.HP = main.player.maxHP;
				}
				//If player has a deadly enchantment
				if (main.player.hasEnchantment("hunger")) {
					delete main.player.enchantments["hunger"];
					if (effects.length > 0)
						effects += " ";
					effects += "You are no longer afflicted with hunger.";
				}
				text+=<![CDATA[
					<p>
						The liquid is pleasantly sweet. As you continue to drink from the flask, a feeling of calmness 
						overtakes you, and warmth spreads through your body. [effects]
					</p>
				]]>.toString()
					.replace("[effects]", effects);
			}
			text+=<![CDATA[
				<p>
					After quenching your thirst, you are surprised to notice the flask is the same weight as when you 
					first picked it up. Shaking your head in abject wonder, you begin the task of packing up your dusty 
					belongings to continue your exploration of the desert, sans one goatskin bag.
				</p>
				<p>
					Once your belongings are packed, you go to retrieve the flask. However, all you see is swirling sand; 
					You attempt to dig around for the flask, but find nothing. Sighing, you begin to trudge back towards Banala.
				</p>
			]]>.toString();
			main.setTown(Town.knownTowns.banala);
			InfoScreen.push(text);
			return true;
		}
		
		public function onBanala(ply:Creature, node:ActionNode,o:*):Boolean
		{
			text = <![CDATA[
				<p>
					Despite the darkening sky and your lack of direction, you resolutely continue your journey back to Banala. 
					You strike out in a random direction, hoping it leads back to civilization.
				</p>
				<p>
					Night swiftly falls, and the darkness makes you even more lost. You wander about the desert for the entire night, 
					and only stumble into Banala the following day, thirsty and worn.
				</p>
			]]>.toString();
			main.player.HP = main.player.HP / 4;
			main.setTown(Town.knownTowns.banala);
			InfoScreen.push(text);
			return true;
		}
	}

}