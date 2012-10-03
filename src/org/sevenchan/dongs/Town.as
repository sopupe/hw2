package org.sevenchan.dongs
{
	import flash.utils.Dictionary;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.bodyparts.Gender;
	import org.sevenchan.dongs.creature.Human;
	import org.sevenchan.dongs.creature.Player;
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
							for (var type:Object in inhabitants)
							{
								var c:Creature = type as Creature;
								var rnd:Number = Math.random();
								trace("CRND", flash.utils.getQualifiedClassName(c), rnd);
								if (inhabitants[type] > rnd)
								{
									c.setupBody();
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
							}
							onExplore(null);
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
							if (main.player.currentTown.isWilds)
							{
								text = "<h2>Masturbate</h2>";
								text += "<p>The lust boiling in your loins is too much to ignore anymore as you nervously look around ";
								text += "for other signs of life; you don’t want some sex crazed Demon or creature to get the drop on ";
								text += "you while you tend to your urges. ";
								if ((main.player as Player).baseType is Human)
								{
									text += "Or worse, by some stroke of chance having a survivor from your unit stumble upon you as you ";
									text += "relieve a little &quot;tension&quot;.";
								}
								text += "</p><p>";
								text += "Spotting only the harmless landscape, you deem that its safe enough to find someplace private ";
								text += "and get intimately acquainted with your body.</p>";
								
								var gbody:String = (main.player.gender == Gender.ASEXUAL) ? "body" : "genitalia";
								
								switch (main.player.currentTown.biome)
								{
									case Biome.WOODS: 
										text += "<p>Ducking into a secluded bush, you endeavor to work yourself free of your ";
										text += "clothing and free your ";
										switch (main.player.gender)
									{
										case Gender.FEMALE: 
											text += Utils.pluralize(main.player.vaginas.length, "vagina");
											break;
										case Gender.HERM: 
											text += "genitalia";
											break;
										case Gender.MALE: 
											text += Utils.pluralize(main.player.dicks.length, "cock");
											break;
										case Gender.ASEXUAL: 
											text += "body";
											break;
									}
										break;
									case Biome.PLAINS: 
										var sexes:String = (main.player.gender == Gender.ASEXUAL) ? "body" : Utils.pluralize(main.player.vaginas.length + main.player.dicks.length, "sex", "sexes");
										text += "<p>Concealing yourself in between a pair of boulders, you finally indulge the ";
										text += "ceaseless lamentations of your " + sexes + " and free ";
										switch (main.player.gender)
									{
										case Gender.FEMALE: 
											text += "your " + Utils.pluralize(main.player.vaginas.length, "vagina");
											break;
										case Gender.HERM: 
											text += "your genitalia";
											break;
										case Gender.MALE: 
											text += "your " + Utils.pluralize(main.player.dicks.length, "cock");
											break;
										case Gender.ASEXUAL: 
											text += "yourself";
											break;
									}
										text += " of your clothing</p>";
										break;
									case Biome.BEACH: 
										text += "<p>Finding a nice, out of way spot on the hot sand, you eagerly strip down and ";
										text += "expose your " + gbody + " to the brisk air that blows over the tranquil environment.</p>";
										break;
									case Biome.JUNGLE: 
										text += "<p>Working your way up the humid, slippery trunk of a tree, you manage to perch ";
										text += "yourself on a stable branch that’s high enough off the ground to give you some advance ";
										text += "warning.</p>";
										break;
									case Biome.MOUNTAINS: 
										text += "<p>Shielded from the whipping winds of this plateau by welcome rockface, you ";
										text += "breath a sigh of relief and take in the feeling of solid ground under your body; ";
										text += "something that's been sorely lacking as you’ve explored these mountains. Now filled ";
										text += "with a sense of security, you work to remove your clothing and bring your " + gbody + " to attention.</p>";
										break;
									case Biome.CAVE: 
										text += "After scoping out and wiping down a well hidden hole in the cavernous ";
										text += "tunnels, you climb inside and quickly undo your pant buckles. Even in the darkness, you ";
										text += "instinctively know where ";
										if (main.player.gender == Gender.ASEXUAL)
										{
											text += "your "+gbody+" are, reaching down and taking a firm hold on ";
											text += Utils.pluralize(main.player.vaginas.length + main.player.dicks.length, "it", "them") + ".";
										}
										else
										{
											text += "you need to touch, trying your best to trigger a body shuddering spasm of joyful gratification.";
										}
										break;
								}
							}
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
	
	}

}