package org.sevenchan.dongs 
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.screens.InventoryScreen;
	import org.sevenchan.dongs.screens.ShopScreen;
	import org.sevenchan.dongs.towns.TownBanala;
	import org.sevenchan.dongs.towns.TownBarn;
	import org.sevenchan.dongs.towns.TownDamned;
	import org.sevenchan.dongs.towns.TownHarpyCabin;
	import org.sevenchan.dongs.towns.WildsHaaraWastes;
	import org.sevenchan.dongs.towns.WildsHorusSpine;
	import org.sevenchan.dongs.towns.WildsLake;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Town extends Screen
	{
		public var text:String = "";
		
		public static var knownTowns:Object = { };
		
		public var shop:ShopScreen=null;
		
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
		 */
		public var inhabitants:Array = [];
		
		private var menu:String = "main";
		
		public static function setup():void {
			Item.fillRegistry();
			knownTowns={
				barn: new TownBarn(),
				banala: new TownBanala(),
				damned: new TownDamned(),
				haara: new WildsHaaraWastes(),
				harpycabin: new TownHarpyCabin(),
				horus: new WildsHorusSpine(),
				lake: new WildsLake()
			};
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
		
		public function onShopBuyMenu():String {
			return "<p>&quot;So, what interests you today, buddy?&quot;  The shopkeeper asks, watching you (and your money-bag) with great intensity.</p>";
		}
		
		public function onShopSellMenu():String {
			return "<p>&quot;All right, let's see what you got, chief.&quot;</p>";
		}
		
		public function onShopWelcome():String {
			return "<p>The shopkeeper is, as usual, mopping the old, dirty floor with an equally old and dirty mop when he notices you enter.  His piggish face brightens a bit.</p>" +
			"<p>&quot;Oh great. My favorite customer.&quot; He mutters sarcastically, continuing to mop.  &quot;So, do you wanna buy, or sell?&quot;</p>";
		}
		
		// Explore, Shop, Rest (10G), Leave, Fap
		override public function processButtonPress(id:int):Boolean 
		{
			if (id == -1)
			{
				menu = "main";
				if (!main.player.getExplored(ID)) {
					if(onRevelation()) {
						main.player.setExplored(ID);
					} else {
						text += "You cannot enter this area... Yet.";
						return false;
					}
				} else {
					onEnter();	
				}
				clearButtons();
				setButton(0, "Explore");
				if (!isWilds) {
					if(shop!=null)
						setButton(1, "Shop");
					if(freeRest)
						setButton(2, "Rest");
					else
						setButton(2, "Rest (10G)");
				}
				setButton(3, "Leave");
				setButton(4, "Masturbate");
				setButton(5, "Inventory");
				updateScreen();
				return false;
			} else {
				switch(menu) {
					case "main":
						switch(id) {
							case 0:
								var cs:Number = MathUtils.rand(0, 3);
								trace("COMBAT CHANCE SAMPLE " +cs);
								if(cs==0 && inhabitants.length>0) {
									var c:Creature = getRandomInhabitant();
									c.initialGenderSetup();
									if (c.getHostile(main.player)) {
										main.startCombat(this, c);
										return false;
									} else {
										var encounter:Boolean=c.onEncounter(main.player)
										if(!encounter)
											onExplore(c);
										return encounter;
									}
								}
								onExplore(null);
								break;
							case 1:
								AdventureController.screenQueue.write(this.shop);
								return true;
								break;
							case 2:
								menu = "rest";
								if (main.player.gold >= 10 || freeRest) {
									//trace("success");
									if(!freeRest)
										main.player.gold -= 10;
									onSuccessfulRest();
									main.player.HP = main.player.maxHP;
									main.refreshStats();
								} else {
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
								if (connectedTowns.length == 0) {
									text += "<p>However, you cannot make them out (bug; connectedTowns=[]).</p>";
								} else {
									text +="<ul>";
									for (var i:int = 0; i < connectedTowns.length; i++) {
										var t:Town = Town.knownTowns[connectedTowns[i]];
										setButton(i + 1, t.ID);
										if(t.isWilds)
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
								if(main.player.dicks.length>0 || main.player.vaginas.length>0) {
									text = "<h2>Masturbate</h2><p>Blah blah blah, you blast cum everywhere or something.</p>";
									main.player.lust = 0;
								} else {
									text = "<p>You look at your groin, and find nothing there for fap with.</p>";
								}
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
					case "rest":
						processButtonPress( -1);
						break;
					case "leave":
						if (id == 0) {
							processButtonPress( -1);
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
		
		private function getRandomInhabitant():Creature {
			return MathUtils.getRandomArrayEntry(inhabitants);
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
		
		/**
		 * omg new town what's it like
		 */
		public function onRevelation():Boolean { text = "REVELATION"; return true; }
		
		public function onExplore(bumpedInto:Creature):void { text = "EXPLORE"; }
		
		public function onEnter():void { text = "ENTER"; }
		
		public function onFailedRest():void { text = "FAILEDREST"; }
		public function onSuccessfulRest():void { text = "SUCCESSFULREST"; }
		
	}

}