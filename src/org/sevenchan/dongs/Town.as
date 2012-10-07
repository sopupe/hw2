package org.sevenchan.dongs
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.bodyparts.Gender;
	import org.sevenchan.dongs.creature.Human;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.screens.Shop;
	import org.sevenchan.dongs.towns.*;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Town extends Screen
	{
		// Explore, Shop, Rest (10G), Leave, Fap
		private var context:Array = [];
		
		public var text:String = "";
		
		public static var knownTowns:Object = {};
		
		public var shops:Object = null;
		
		/**
		 * ID of the town
		 */
		public var ID:String = "";
		
		/**
		 * Name of the town
		 */
		public var name:String = "";
		
		/**
		 * IDs of connected towns to list when exiting.
		 */
		public var connectedTowns:Array = [];
		
		/**
		 * Is this town actually a Wilds?
		 */
		public var isWilds:Boolean = false;
		
		/**
		 * Does this town have free room and board?
		 */
		public var freeRest:Boolean = false;
		
		/**
		 * What kinds of creatures inhabit this town? (Hostile and otherwise)
		 *
		 * TYPE => CHANCE (0-1)
		 */
		public var inhabitants:Dictionary = new Dictionary();
		
		private var menu:String = "main";
		
		public var biome:Biome = Biome.WOODS;
		
		public static function setup():void
		{
			Item.fillRegistry();
			knownTowns = {barn: new TownBarn(), banala: new TownBanala(), damned: new TownDamned(), haara: new WildsHaaraWastes(), harpycabin: new TownHarpyCabin(), horus: new WildsHorusSpine(), lake: new WildsLake()};
		}
		
		public function Town()
		{
			this.appearanceButton = true;
			this.debugMenuButton = true;
			this.exportGameButton = false;
			this.loadOrSaveButton = true;
			this.newGameButton = false;
			this.importGameButton = false;
			
			this.clearButtons()
		}
		
		public function onShopBuyMenu():String
		{
			// TODO: Needs work
			return "<p>&quot;So, what interests you today, buddy?&quot;  The shopkeeper asks, watching you (and your money-bag) with great intensity.</p>";
		}
		
		public function onShopSellMenu():String
		{
			// TODO: Needs work
			return "<p>&quot;All right, let's see what you got, chief.&quot;</p>";
		}
		
		public function onShopWelcome():String
		{
			// TODO: Needs work
			return "<p>The shopkeeper is, as usual, mopping the old, dirty floor with an equally old and dirty mop when he notices you enter.  His piggish face brightens a bit.</p>" + "<p>&quot;Oh great. My favorite customer.&quot; He mutters sarcastically, continuing to mop.  &quot;So, do you wanna buy, or sell?&quot;</p>";
		}
		
		override public function processButtonPress(id:int):Boolean
		{
			if (id == -1)
			{
				menu = "main";
				if (!main.player.getExplored(ID))
				{
					if (onRevelation())
					{
						main.player.setExplored(ID);
					}
					else
					{
						text += "You cannot enter this area... Yet.";
						return false;
					}
				}
				else
				{
					onEnter();
				}
				clearButtons();
				setButton(0, "Explore");
				if (!isWilds)
				{
					if (shops != null)
						setButton(1, "Shop");
					if (freeRest)
						setButton(2, "Rest");
					else
						setButton(2, "Rest (10G)");
				}
				setButton(3, "Leave");
				setButton(4, "Masturbate");
				setButton(5, "Inventory");
				updateScreen();
				return false;
			}
			else
			{
				switch (menu)
				{
					case "main": 
						switch (id)
					{
						case 0: 
							var c:Creature = getRandomInhabitant();
							if (c != null)
							{
								if (c.getHostile(main.player))
								{
									main.startCombat(this, c);
									return false;
								}
								else
								{
									var encounter:Boolean = c.onEncounter(main.player)
									if (!encounter)
										onExplore(c);
									return encounter;
								}
							}
							onExplore(c);
							break;
						case 1: 
							menu = "shop";
							clearButtons();
							setButton(0, "Back");
							var i:int = 0;
							text = "<h2>Shop</h2><p>You look around cautiously for a place to buy some wares.  After a cursory examination of your surroundings, you find the following places of commerce:</p><ul>";
							context = [];
							for (var shopName:String in shops)
							{
								i++;
								setButton(i, shopName);
								context.push(shopName);
								text += "<li><b>" + shopName + "</b> - " + (shops[shopName] as Shop).description + "</li>";
							}
							text += "</ul>";
							updateScreen();
							return false;
							break;
						case 2: 
							menu = "rest";
							if (main.player.gold >= 10 || freeRest)
							{
								//trace("success");
								if (!freeRest)
									main.player.gold -= 10;
								onSuccessfulRest();
								main.player.HP = main.player.maxHP;
								main.refreshStats();
							}
							else
							{
								main.refreshStats();
								onFailedRest();
							}
							clearButtons();
							setButton(NEXT_BUTTON, "Next");
							updateScreen();
							return false;
							break;
						case 3: 
							menu = "leave";
							clearButtons();
							setButton(0, "CANCEL");
							text = "<p>You peer at the roadsigns in the middle of town and try to make out the destinations.</p>";
							if (connectedTowns.length == 0)
							{
								text += "<p>However, you cannot make them out (bug; connectedTowns=[]).</p>";
							}
							else
							{
								text += "<ul>";
								for (var j:int = 0; j < connectedTowns.length; j++)
								{
									var t:Town = Town.knownTowns[connectedTowns[j]];
									setButton(j + 1, t.ID);
									if (t.isWilds)
										text += "<li><b>" + t.ID + "</b> - " + t.name + " (Wilds)</li>";
									else
										text += "<li><b>" + t.ID + "</b> - " + t.name + "</li>";
								}
								text += "</ul>";
							}
							updateScreen();
							return false;
							break;
						case 4: 
							setButton(NEXT_BUTTON, "NEXT");
							text = "<h2>Masturbate</h2>";
							if (main.player.currentTown.isWilds)
							{
								getWildsMasturbation();
							}
							else
							{
								text += getShelteredMasturbation();
							}
							var propText:String = getPropositioned();
							if (propText.length > 0)
							{
								// Let the system handle it
								return false;
							}
							text += "<p>The yearning for release drives you on, pushing you to ";
							if (main.player.gender.hasDick)
								text += "pump";
							if (main.player.gender.hasDick && main.player.gender.hasVag)
								text += " and ";
							if (main.player.gender.hasVag)
								text += "finger";
							text += " as fast as you can. Grimacing in sheer delight, you moan out in ecstasy. With feverish need, ";
							text += "you bring yourself to the point of no return and groan in primal bliss as your orgasm";
							if (main.player.gender.hasDick)
							{
								text += " works its way up your " + Utils.pluralize(main.player.dicks.length, "cock") + ".";
								//TODO: Need to get clarification on these, as cum amount is determined by the testicles.
								// Low:
								if (main.player.balls.length >= 2 && main.player.balls.length < 4)
								{
									text += "Your "+Utils.pluralize(main.player._dicks.length,"prick erupts","pricks erupt")+" with thin strands of semen that arc through the air, landing on ";
									text += "the ground before you."
								}
								// Moderate:
								if (main.player.balls.length >= 4 && main.player.balls.length < 8)
								{
									text += "Drooling with lust, your "+Utils.pluralize(main.player._dicks.length,"cock unleashes its","cocks unleash their")+" liberal payload ";
									text += "against the ground, coating it in thick strands of your pent up arousal.";
								}
								// High:
								if (main.player.balls.length >= 8)
								{
									text += "Release is fast and furious, as your "+Utils.pluralize(main.player._dicks.length,"member explodes and rains its","members explode and rain their")+" copious juices all over the immediate area, dosing you in jism while you twitch uncontrollably.";
								}
							}
							else if (main.player.gender.hasVag)
							{
								var vagDescr:String = main.player.vaginas[0].getDescr(1, main.player);
								//text += "ic excitement throbs through your " + ;
								// Reword this, makes the PC sound like a fucking werewolf.
								text += " gushes forth from your " + vagDescr + "; the culmination of your sexual talent and pent up lust bringing forth a noisy series of howls from your mouth.";
							}
							else
							{
								text += " hits your body like a runaway oxcart.";
							}
							text += "</p>";
							text += "<p>Spent, you lie against the ground, breathing heavily as you pant from the exhaustive efforts. ";
							text += "You decide that laying there for a bit doesn’t sound like a bad idea, you think to yourself, ";
							text += "still high on the rush of orgasm as you rest.</p>";
							text += "<p>Once your strength returns, you grab a hold of your clothing and proceed to don it once more, ";
							text += "eager to set out and stop the Demon menace that ravages both these lands.</p>";
							main.player.lust = 0;
							updateScreen();
							return false;
							break;
						case 5: 
							main.showInventory();
							return false;
							break;
					}
						updateScreen();
						return false;
						break;
					case "shop": 
						if (id == 0)
						{
							processButtonPress(-1);
							return false;
						}
						AdventureController.screenQueue.write(shops[context[id - 1]] as Shop);
						return true;
						break;
					case "rest": 
						processButtonPress(-1);
						break;
					case "leave": 
						if (id == 0)
						{
							processButtonPress(-1);
							return false;
						}
						main.setTown(knownTowns[connectedTowns[id - 1]]);
						return true;
					case "inventory":
					
					case "masturbate": 
						break;
				}
			}
			return false;
		}
		
		public function getWildsMasturbation():String
		{
			var t:String = "";
			t += "<p>The lust boiling in your loins is too much to ignore anymore as you nervously look around ";
			t += "for other signs of life; you don’t want some sex crazed Demon or creature to get the drop on ";
			t += "you while you tend to your urges. ";
			if ((main.player as Player).baseType is Human)
			{
				t += "Or worse, by some stroke of chance having a survivor from your unit stumble upon you as you ";
				t += "relieve a little &quot;tension&quot;.";
			}
			t += "</p><p>";
			t += "Spotting only the harmless landscape, you deem that its safe enough to find someplace private ";
			t += "and get intimately acquainted with your body.</p>";
			
			var gbody:String = (main.player.gender == Gender.ASEXUAL) ? "body" : "genitalia";
			
			switch (main.player.currentTown.biome)
			{
				case Biome.WOODS: 
					t += "<p>Ducking into a secluded bush, you endeavor to work yourself free of your ";
					t += "clothing and free your ";
					switch (main.player.gender)
				{
					case Gender.FEMALE: 
						t += Utils.pluralize(main.player.vaginas.length, "vagina");
						break;
					case Gender.HERM: 
						t += "genitalia";
						break;
					case Gender.MALE: 
						t += Utils.pluralize(main.player.dicks.length, "cock");
						break;
					case Gender.ASEXUAL: 
						t += "body";
						break;
				}
					break;
				case Biome.PLAINS: 
					var sexes:String = (main.player.gender == Gender.ASEXUAL) ? "body" : Utils.pluralize(main.player.vaginas.length + main.player.dicks.length, "sex", "sexes");
					t += "<p>Concealing yourself in between a pair of boulders, you finally indulge the ";
					t += "ceaseless lamentations of your " + sexes + " and free ";
					switch (main.player.gender)
				{
					case Gender.FEMALE: 
						t += "your " + Utils.pluralize(main.player.vaginas.length, "vagina");
						break;
					case Gender.HERM: 
						t += "your genitalia";
						break;
					case Gender.MALE: 
						t += "your " + Utils.pluralize(main.player.dicks.length, "cock");
						break;
					case Gender.ASEXUAL: 
						t += "yourself";
						break;
				}
					t += " of your clothing</p>";
					break;
				case Biome.BEACH: 
					t += "<p>Finding a nice, out of way spot on the hot sand, you eagerly strip down and ";
					t += "expose your " + gbody + " to the brisk air that blows over the tranquil environment.</p>";
					break;
				case Biome.JUNGLE: 
					t += "<p>Working your way up the humid, slippery trunk of a tree, you manage to perch ";
					t += "yourself on a stable branch that’s high enough off the ground to give you some advance ";
					t += "warning.</p>";
					break;
				case Biome.MOUNTAINS: 
					t += "<p>Shielded from the whipping winds of this plateau by welcome rockface, you ";
					t += "breath a sigh of relief and take in the feeling of solid ground under your body; ";
					t += "something that's been sorely lacking as you’ve explored these mountains. Now filled ";
					t += "with a sense of security, you work to remove your clothing and bring your " + gbody + " to attention.</p>";
					break;
				case Biome.CAVE: 
					t += "<p>After scoping out and wiping down a well hidden hole in the cavernous ";
					t += "tunnels, you climb inside and quickly undo your pant buckles. Even in the darkness, you ";
					t += "instinctively know where ";
					if (main.player.gender == Gender.ASEXUAL)
					{
						t += "your " + gbody + " are, reaching down and taking a firm hold on ";
						t += Utils.pluralize(main.player.vaginas.length + main.player.dicks.length, "it", "them") + ".";
					}
					else
					{
						t += "you need to touch, trying your best to trigger a body shuddering spasm of joyful gratification.";
					}
					break;
			}
			return t;
		}
		
		public function getShelteredMasturbation():String
		{
			var t:String = "<p>Your physical arousal no longer deniable, you find your hands taking to your ";
			if (main.player.gender.hasDick)
				t += Utils.stripA(main.player.getDickDescr());
			else if (main.player.gender.hasVag)
				t += Utils.stripA(main.player.getVagDescr());
			else
				t += "body";
			t += " with a primal need, ";
			if (main.player.gender.hasDick)
				t += "stroking the sensitive features of your flaring head";
			else
				t += "caressing your tender skin";
			t += " with such tantalizing efforts that only you know how to achieve. Closing your eyes, you allow";
			t += " the physical touch of your efforts to resonate through your body; your hunger for sexual";
			t += " stimulation at long last being sated as ";
			if (main.player.gender.hasDick)
				t += "the rise and fall of your palm against your flesh causes you to groan in satisfaction. ";
			else
				t += "the sensation of your delicate fingers solicits a whimper from your pursed mouth. ";
			t += "Physically flushed with pleasure you power onwards, ";
			if (main.player.gender.hasDick)
				t += "pumping your " + Utils.pluralize(main.player.dicks.length, "cock") + " with ever increasing ferocity";
			else
				t += "taking to your pussy like a succulent pastery as you work your fingers into your honey pot, the surprise jolt of intense euphoria teasing your mind.";
			t += "</p>";
			return t;
		}
		
		public function getPropositioned():String
		{
			var t:String = text;
			//Check to see if PC is propositioned by a passer-by (monster girl, etc) or attacked 
			var c:Creature = this.getRandomInhabitant();
			if (c == null)
				return "";
			if (!isWilds && c.getInterested(main.player))
			{
				t += "<p>&quot;H-hey!&quot; A voice rings out, startling you as you snap back to reality.</p>";
				t += "<p>Expecting the worst, ";
				if (main.player.hasAnyWeapon())
				{
					t += "you reach for your weapon";
				}
				else
				{
					t += "ready yourself for battle";
				}
				t += ". &quot;Whoa, WHOA! Take it easy!&quot; The " + c.getTypeName() + " exclaims, palms facing you in a defensive gesture.";
				t += " &quot;I heard you... tending to yourself and was coming to see who it was...” %SUB% states, before looking you up";
				t += " and down. &quot;Mhmmm... and whether they wanted to give up playing with themselves and spend some time with me instead.&quot;";
				t += "</p>";
				
				t += "<p>Your visitor is " + c.getDescription() + "</p>";
				t += "<p>&quot;Full disclosure:  <b>I'm actually a " + c.gender.label + "</b>,&quot; %CSUB% blushes beet red with the revelation.</p>";
				
				t += "<p>Do you want to forego masturbation and indulge the " + c.getTypeName() + ", or would you rather not?</p>";
				t = c.getApparentGender().doReplace(t);
				
			}
			if (isWilds && c.getHostile(main.player))
			{
				t += "The sounds of something moving around your hiding spot ";
				t += "draws you from the realm of carnal gratification and into the real world. Cautiously, you ";
				if (main.player.hasAnyWeapon())
					t += "reach for your " + main.player.getFirstWeapon().name;
				else
					t += "ready yourself for a fight."
				t += "&quot;I can smell your excitement in the air! Why don’t you come on out here and let me have a little fun with you...&quot;";
				t += "The unknown entity calls out. &quot;I’d <i>hate</i> to have to hurt you if you resist; I doubt you can take me when I’ve ";
				t += "caught you with your ";
				if (main.player.gender.hasDick)
					t += "dick in your hand";
				else
					t += "pants down";
				t += ".&quot;</p>";
				t += "<p><i>Great, no time to suit back up</i>, you think to yourself. Your musings and disappointment in being found are ";
				t += "shattered as a pair of eyes dart towards your face. &quot;Gotcha!&quot; The " + c.getTypeName() + " cries out, grinning like a ";
				if (c.getApparentGender().hasDick)
					t += "man";
				else
					t += "woman";
				t += " possessed at the &quot;bounty&quot %SUB% has happened upon.";
				t = c.getApparentGender().doReplace(t);
				//leads to a butt naked fight.
				InfoScreen.push(t);
				// Detach all clothing.
				main.player.inventory.push(main.player.clothing);
				main.player.clothing.splice(0, main.player.clothing.length);
				main.startCombat(null, c, false);
				return "combat";
			}
			return t;
		}
		
//Being found isn’t triggered
		
//Haven't implemented anything for this yet.
//Massaging
//
//Sexual stimulation certainly can be difficult when you lack the proper “equipment” to do so, but you are determined to rid yourself of all this pent up lust. As you strip down to your birthday suit you begin to caress at your body, allowing your digits to teasingly slide across your chest and stomach. 
//
//PC is at level 0 Massage: It’s hard to properly stimulate yourself when you have so little 
//experience with this sort of thing, but you trudge on regardless as...
//
//PC is at level 1 Massage: What little experience you possess allows for a more sensual rub down, but you definitely have much to learn if you are to properly manage your lust in your current state.
//
//PC is at level 2-3 Massage: Now possessing some experience at getting yourself off to your own soft tough, you are much more adept at releasing sexual tension, and you eagerly look forward to improving on your technique.
//
//PC is at level 4-5 Massage: Stimulating your sexless body has become as natural as breathing, and you crave the near orgasmic state you can bring yourself to now as...
//
//!!Check for interruption at this point!! Display standard interruption dialouge for whatever gets triggered; proposition or attacked
//
//Your hands busily explore your sexless body, sweeping along your [breast descript] and [nipple descript] before darting down to your [thigh descript], massaging the sensitive contours of your lower torso. You 
//
//PC is at level 0-1: attempt to derive what little pleasure you can from your unco-ordinated and ultimately blinded efforts to stimulate yourself, frustratingly deprived of the release you  so crave.
//
//PC is at level 2-3 bask in the satisfying embrace of your hands, eager to further your 
//skills as you feel yourself coming so close to “release”.
//
//PC is at level 4-5: can’t help but twitch like a bug under a magnifying glass, the supple 
//touch of your fingers along your [skin] simply too much to bear as you fall over in “orgasm”, unleashing a series of distorted moans as you surrender yourself to sensual bliss.
//
//Endings for all except levels 4-5
//
//With some time and effort you manage to slate some of your pent up lust, rising to your feet and breathing a final, heavy sigh of relief. It hasn’t dissipated completely, but it’s better than the state you you were in when you started. Eager to get back to your adventure you reach down and grab your [armor], hopping along as you work yourself back into your attire.
//
//Ending for levels 4-5
//
//“Normal” people might place a lot of importance on having genitalia or the ability to “orgasm”; they can have them! you think to yourself, still reeling from your body shaking spasm of sensual pleasure. You’ll get your (armor) back on soon enough; right now you just want to lay back, smile, and enjoy the fruits of your labor.
		
		override public function getScreenText():String
		{
			return text;
		}
		
		/**
		 * omg new town what's it like
		 */
		public function onRevelation():Boolean
		{
			text = "REVELATION";
			return true;
		}
		
		public function onExplore(bumpedInto:Creature):void
		{
			text = "EXPLORE";
		}
		
		public function onEnter():void
		{
			text = "ENTER";
		}
		
		public function onFailedRest():void
		{
			text = "FAILEDREST";
		}
		
		public function onSuccessfulRest():void
		{
			text = "SUCCESSFULREST";
		}
		
		public function getRandomInhabitant():Creature
		{
			for (var type:Object in inhabitants)
			{
				var c:Creature = type as Creature;
				var rnd:Number = Math.random();
				trace("CRND", getQualifiedClassName(c), rnd);
				if (inhabitants[type] > rnd)
				{
					c.setupBody();
					return c;
				}
			}
			return null;
		}
	}

}