package org.sevenchan.dongs.screens
{
	import flash.utils.*;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.bodyparts.Breast;
	import org.sevenchan.dongs.bodyparts.Penis;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.items.GoldPotion;
	import org.sevenchan.dongs.items.PinkPotion;
	import org.sevenchan.dongs.items.Potion;
	import org.sevenchan.dongs.Screen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class WitchShopScreen extends Screen
	{
		private var page:String = "main";
		private var subpage:String = "main";
		private var text:String = "";
		private var state:String = "main";
		private var title:String = "";
		private var priceoffset:Number = 0;
		private var dickincrement:Number = 0;
		private var type:int = 0;
		private var inventory:Array = [];
		
		public static function push(id:int = -1):void
		{
			AdventureController.screenQueue.write(new WitchShopScreen(id));
		}
		
		public function WitchShopScreen(id:int = -1)
		{
			if (id == -1)
				id = MathUtils.rand(0, 3);
			this.type = id;
			switch (id)
			{
				//Oh god don't sue me
				case 0: 
					setup(-5, 3, "Mildred's Manacles:  Body Parts for LESS!");
					break;
				case 1: 
					setup(0, 6, "Hallasee's Potion Shoppe: Always Low Quality.  Always.");
					inventory = [
						new GoldPotion(MathUtils.rand(6, 10)), 
						new PinkPotion(MathUtils.rand(6, 10))];
					break;
				case 2: 
					setup(1, 12, "Ehf's Dick Depot: Every Fuck Begins with Ehf.");
					break;
				case 3: 
					setup(10, 24, "Granny Rasputin's Grand Gonads: The Balls of Champions.");
					break;
			}
		}
		
		private function setup(po:Number, i:Number, t:String):void
		{
			this.title = t;
			this.priceoffset = po;
			this.dickincrement = i;
		}
		
		override public function processButtonPress(id:int):Boolean
		{
			clearButtons();
			trace(id, page);
			if (page == "main")
				return onStartupScreen(id);
			if (page == "buy")
				return onBuy(id);
			if (page == "sell")
				return onSell(id);
			if (page == "bodymod")
				return onBodyMod(id);
			return false;
		}
		
		override public function getScreenText():String
		{
			return text;
		}
		
		public function onStartupScreen(id:int):Boolean
		{
			switch (id)
			{
				case 0: // Buy
					page = "buy";
					return onBuy(-1);
					break;
				case 1: // Sell
					page = "sell";
					return onSell(-1);
					break;
				case 2: // BodyMods
					page = "bodymod";
					return onBodyMod(-1);
					break;
				case 3: // leave
					return true;
					break;
			}
			//[Buy] [Sell] [Change]
			setButton(0, "Buy");
			setButton(1, "Sell");
			setButton(2, "Body Mods");
			setButton(3, "Leave");
			text = "<p>While walking through the town, your arm is grabbed by a frail-looking old woman.  She ogles you, and then pulls a wand from the folds of her strange-looking clothing.  It immediately dawns upon you that she is a Witch and is about to cast a spell. <i>Shit-</i> You think, right before she waves the wand.</p>";
			text += "<p>A flash blinds you, and, instead of waking up at the barn, you look around and find that you're in a old, rustic shop that sprung up around you and the witch after she used her wand.</p>";
			text += "<p>A cackle brings you to attention.  The old woman is reclining precariously on a stool behind the shop's counter, surrounded by what can only be prices on various items.  You're startled to see that there are some numbers beside illustrations of body parts, as well. The old woman notices your visible shock. &quot;Oh, come on, my prices aren't THAT bad.&quot; She frowns.  &quot; So, tell me what you want.&quot;</p>";
			text += "<p>Well, it couldn't hurt to ask.  &quot;Well, a translation would be nice.  I'm from out of town.&quot;  You request sheepishly.</p>";
			text += "<p>The witch looks at you in confusion, and then her expression gives way to embarassment. &quot;Oh, crap.  I forgot to change the menus from Orcish.  Just a moment...&quot;  A wave of her wand later, and the title and purpose of the establishment becomes readable:</p>";
			text += "<p><b>" + title + "</b></p>";
			text += "<p>At this shop, and those like it, you can buy and sell potions, and buy modifications to your body.</p>";
			updateScreen();
			return false;
		}
		
		public function onBuy(id:int):Boolean
		{
			var item:Item = null;
			text = "<h2>Buy</h2>";
			text += "<ul>";
			setButton(0, "BACK");
			for (var i:int = 0; i < inventory.length; i++)
			{
				// 2x WhiteBerry (15G)
				item = inventory[i];
				text += "<li><b>" + item.amount + "x " + item.name + " (" + (item.value + priceoffset) + "G)</b> - <i>" + item.descr + "</i></li>";
				setButton(i + 1, item.name);
			}
			text += "</ul>";
			
			if (id == 0)
			{
				page = "main";
				return processButtonPress(-1);
			}
			if (id > 0)
			{
				item = Item.findByID((inventory[id - 1] as Item).id);
				var price:int = (item.value + priceoffset);
				// Check if we have enough money
				if (main.player.gold - price < 0)
				{
					text = "You don't have enough money for this.";
					updateScreen();
					return false;
				}
				// Deduct from store
				(inventory[id - 1] as Item).amount--;
				if ((inventory[id - 1] as Item).amount == 0)
				{
					inventory.splice(id - 1, 1);
				}
				
				// Give to player
				item.amount = 1;
				main.player.addToInventory(item);
				main.player.gold -= price;
				main.refreshStats();
				updateScreen();
				return false;
			}
			updateScreen();
			return false;
		}
		
		public function onSell(id:int):Boolean
		{
			var i:int = 0;
			var item:Item = null;
			text = "<h2>Sell</h2>";
			setButton(0, "BACK");
			if (inventory.length > 0)
			{
				text += "<ul>";
				for (i = 0; i < main.player.inventory.length; i++)
				{
					// 2x WhiteBerry (15G)
					item = main.player.inventory[i];
					text += "<li><b>" + item.amount + "x " + item.name + " (" + (item.value - priceoffset) + "G)</b> - <i>" + item.descr + "</i></li>";
					setButton(i + 1, item.name);
				}
				text += "</ul>";
			}
			else
			{
				text += "<p><i>You have nothing to sell.</i></p>";
			}
			
			if (id == 0)
			{
				page = "main";
				return processButtonPress(-1);
			}
			if (id > 0)
			{
				item = main.player.inventory[id - 1]
				trace("SHOPSCREEN ITEM", item);
				if (item is Item)
				{
					item = item.copy();
					var price:Number = (item.value - priceoffset);
					item.amount = 1;
					main.player.takeFromInventory(item);
					main.player.gold += price;
					main.refreshStats();
				}
				updateScreen();
				return false;
			}
			updateScreen();
			return false;
		}
		
		public function onBodyMod(id:int):Boolean
		{
			if (subpage == "main")
			{
				text = "<h2>Body Modifications</h2>";
				//  BACK      Species   Penises Testes Vaginas Breasts
				//            Abilities Enchant Arms   Legs    Wings
				setButton(0, "BACK");
				setButton(1, "Species");
				setButton(2, "Penises");
				//setButton(3, "Testes");
				//setButton(4, "Vaginas");
				//setButton(5, "Breasts");
				//setButton(7, "Abilities");
				//setButton(8, "Enchant");
				//setButton(9, "Arms");
				//setButton(10, "Legs");
				//setButton(11, "Wings");
				
				if (id == -1)
					subpage = "main";
				switch (id)
				{
					case 0: 
						page = "main";
						return processButtonPress(-1);
						break;
					case 1: 
						subpage = "species";
						id = -1;
						break;
					case 2: 
						subpage = "penises";
						id = -1;
						break;
					case 3: 
						subpage = "testes";
						id = -1;
						break;
					case 4: 
						subpage = "vaginas";
						id = -1;
						break;
					case 5: 
						subpage = "breasts";
						id = -1;
						break;
					case 7: 
						subpage = "abilities";
						id = -1;
						break;
					case 8: 
						subpage = "enchantments";
						id = -1;
						break;
					case 9: 
						subpage = "arms";
						id = -1;
						break;
					case 10: 
						subpage = "legs";
						id = -1;
						break;
					case 1: 
						subpage = "wings";
						id = -1;
						break;
				}
			}
			
			if (subpage == "species")
				return BSChooseSpecies(id);
			if (subpage == "penises")
				return BSPenises(id);
			if (subpage == "testes") 
				return BSTestes(id);
			//if (subpage == "vaginas") 
			//	return BSVaginas(id);
			//if (subpage == "breasts") return BSBreasts(id);
			//if (subpage == "abilities") return BSAbilities(id);
			//if (subpage == "enchantments") return BSEnchantments(id);
			//if (subpage == "arms") return BSArms(id);
			//if (subpage == "legs") return BSLegs(id);
			//if (subpage == "wings") return BSWings(id);
			updateScreen();
			return false;
		}
		
		public function BSChooseSpecies(id:int):Boolean
		{
			if (main.player.gold < 1000)
			{
				InfoScreen.push("<h2>Transformation</h2><p>You do not have enough gold.</p>");
				WitchShopScreen.push();
				return true;
			}
			text = "<h2>Choose a Species</h2><p>Choose any creature to change into it for 1000G.</p>";
			clearButtons();
			setButton(0, "CANCEL");
			setButton(1, "Arachnid");
			setButton(2, "Bova");
			setButton(3, "Demon");
			setButton(4, "Harpy");
			setButton(4, "Human");
			
			switch (id)
			{
				case 0: 
					subpage = "main";
					return processButtonPress(-1);
					break;
				case 1: 
					main.player.changeTo(CreatureRegistry.arachnid);
					main.player.gold -= 1000;
					WitchShopScreen.push(type);
					return true;
					break;
				case 2: 
					main.player.changeTo(CreatureRegistry.bova);
					main.player.gold -= 1000;
					WitchShopScreen.push(type);
					return true;
					break;
				case 3: 
					main.player.changeTo(CreatureRegistry.demon);
					main.player.gold -= 1000;
					WitchShopScreen.push(type);
					return true;
					break;
				case 4: 
					main.player.changeTo(CreatureRegistry.harpy);
					main.player.gold -= 1000;
					WitchShopScreen.push(type);
					return true;
					break;
				case 5: 
					main.player.changeTo(CreatureRegistry.human);
					main.player.gold -= 1000;
					WitchShopScreen.push(type);
					return true;
					break;
			}
			updateScreen();
			return false;
		}
		
		private function addMenuOption(id:int, label:String, price:Number, descr:String):String
		{
			// * Add Penis ($400) - Grow a new penis of your choice.
			if (main.player.gold >= price)
				setButton(id, label);
			return "<li><b>" + label + " (" + price.toString() + "G)</b> - " + descr + "</li>";
		}
		
		public function BSPenises(id:int):Boolean
		{
			trace("BSPenises", id)
			clearButtons();
			setButton(0, "CANCEL");
			text = "<h2>Penis Modifications</h2><p>Here, you can modify your member(s)... For a price.</p>";
			text += "<ul>";
			text += addMenuOption(1, "Add", 1000 + priceoffset, "Grow a new penis of your choice");
			var numdicks:int = main.player.dicks.length;
			if (numdicks > 0)
			{
				text += addMenuOption(2, "Remove", -900 + priceoffset, "Remove one of your penises and sell it to the store.");
				text += addMenuOption(3, "Grow", numdicks * (100 + priceoffset), "Make your dongs bigger (by 6\")");
				text += addMenuOption(4, "Shrink", numdicks * (100 + priceoffset), "Shrink your wangs (by 6\")");
					//text += addMenuOption(5, "Reset", 1000 + priceoffset, "Reset your groin to the default number, type, and size of dicks for your species.");
			}
			text += "</ul>";
			
			switch (id)
			{
				case 0: 
					subpage = "main";
					return processButtonPress(-1);
					break;
				case 1: 
					var wang:Penis = main.player.addDick();
					if (wang == null)
					{
						InfoScreen.push("Your species doesn't have a default penis, so you'll get a human dick instead.");
						wang = BodyPartRegistry.human_penis;
					}
					wang.onAdded(true, main.player);
					WitchShopScreen.push(type);
					main.player.gold -= 1000 + priceoffset;
					return true;
					break;
				case 2: 
					wang = main.player.dicks.pop();
					main.player.gold += 900 - priceoffset;
					wang.onRemoved(true, main.player);
					WitchShopScreen.push(type);
					return true;
					break;
				case 3: 
					text = "<h2>Grow Dicks</h2>";
					var glassDesc:String = "shot glass";
					if (dickincrement >= 6 && dickincrement < 12)
					{
						glassDesc = "vial";
					}
					else if (dickincrement >= 12 && dickincrement < 18)
					{
						glassDesc = "flask";
					}
					else if (dickincrement >= 18 && dickincrement < 24)
					{
						glassDesc = "tumbler";
					}
					else if (dickincrement >= 24)
					{
						glassDesc = "beer mug";
					}
					text += "<p>The proprietor of the shop produces a " + glassDesc + " full of a maroon, murky liquid and hands the warm glass ";
					text += "to you. </p><p>&quot;Drink.&quot; She directs in a bored tone.</p><p>You give the liquid a quick glance, and then ";
					text += "shrug, raising the " + glassDesc + " to your lips and draining it of its sweet contents.  It doesn't take long for ";
					text += "the effects to take hold, as pins-and-needles rush over your " + Utils.pluralize(main.player.dicks.length,"penis") + ".  The skin tightens, ";
					text += "and then expands.  You groan loudly as your " + Utils.pluralize(main.player.dicks.length,"member") + " erect to their full size, and then ";
					text += "continue until they reach the size you requested:</p><ul>";
					for (var i:int = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].grow(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 4: 
					text = "<h2>Shrink Dicks</h2>";
					text += "<p>The old woman nods after counting her cash, picks up her wand, and then suddenly screams at your groin, pointing ";
					text += "her wand at it.  She stops and returns to counting her cash as your penises retract the amount you specified:</p>";
					text += "<ul>";
					for (i = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].shrink(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 5: 
					var cc:Class = getDefinitionByName(getQualifiedClassName(main.player)) as Class;
					var c:Creature = new cc();
					main.player.gold -= 1000;
					return true;
					break;
			}
			updateScreen();
			return false;
		}
		
		public function BSTestes(id:int):Boolean
		{
			trace("BSPenises", id)
			clearButtons();
			setButton(0, "CANCEL");
			text = "<h2>Testicle Modifications</h2><p>Here, you can modify your nut(s)... For a price.</p>";
			text += "<ul>";
			text += addMenuOption(1, "Add", 1000 + priceoffset, "Grow a new testicle of your choice");
			var numballs:int = main.player.dicks.length;
			if (numballs > 0)
			{
				text += addMenuOption(2, "Remove", -900 + priceoffset, "Remove one of your balls and sell it to the store.");
					//text += addMenuOption(5, "Reset", 1000 + priceoffset, "Reset your groin to the default number, type, and size of dicks for your species.");
			}
			text += "</ul>";
			
			switch (id)
			{
				case 0: 
					subpage = "main";
					return processButtonPress(-1);
					break;
				case 1: 
					var wang:Penis = /*main.player.addBall()*/null;
					if (wang == null)
					{
						InfoScreen.push("Your species doesn't have a default penis, so you'll get a human dick instead.");
						wang = BodyPartRegistry.human_penis;
					}
					wang.onAdded(true, main.player);
					WitchShopScreen.push(type);
					main.player.gold -= 1000 + priceoffset;
					return true;
					break;
				case 2: 
					wang = main.player.dicks.pop();
					main.player.gold += 900 - priceoffset;
					wang.onRemoved(true, main.player);
					WitchShopScreen.push(type);
					return true;
					break;
				case 3: 
					text = "<h2>Grow Dicks</h2>";
					var glassDesc:String = "shot glass";
					if (dickincrement >= 6 && dickincrement < 12)
					{
						glassDesc = "vial";
					}
					else if (dickincrement >= 12 && dickincrement < 18)
					{
						glassDesc = "flask";
					}
					else if (dickincrement >= 18 && dickincrement < 24)
					{
						glassDesc = "tumbler";
					}
					else if (dickincrement >= 24)
					{
						glassDesc = "beer mug";
					}
					text += "<p>The proprietor of the shop produces a " + glassDesc + " full of a maroon, murky liquid and hands the warm glass ";
					text += "to you. </p><p>&quot;Drink.&quot; She directs in a bored tone.</p><p>You give the liquid a quick glance, and then ";
					text += "shrug, raising the " + glassDesc + " to your lips and draining it of its sweet contents.  It doesn't take long for ";
					text += "the effects to take hold, as pins-and-needles rush over your " + Utils.pluralize(main.player.dicks.length,"penis") + ".  The skin tightens, ";
					text += "and then expands.  You groan loudly as your " + Utils.pluralize(main.player.dicks.length,"dick") + " erect to their full size, and then ";
					text += "continue until they reach the size you requested:</p><ul>";
					for (var i:int = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].grow(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 4: 
					text = "<h2>Shrink Dicks</h2>";
					text += "<p>The old woman nods after counting her cash, picks up her wand, and then suddenly screams at your groin, pointing ";
					text += "her wand at it.  She stops and returns to counting her cash as your penises retract the amount you specified:</p>";
					text += "<ul>";
					for (i = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].shrink(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 5: 
					var cc:Class = getDefinitionByName(getQualifiedClassName(main.player)) as Class;
					var c:Creature = new cc();
					main.player.gold -= 1000;
					return true;
					break;
			}
			updateScreen();
			return false;
		}
		public function BSBreasts(id:int):Boolean
		{
			trace("BSBreasts", id)
			clearButtons();
			setButton(0, "CANCEL");
			text = "<h2>Breast Modifications</h2><p>Want bigger boobs?  More tits?  Fewer tits?  Pay up and they're yours.</p>";
			text += "<ul>";
			text += addMenuOption(1, "Add", 1000 + priceoffset, "Grow a new breast");
			var numboobs:int = main.player.breasts.length;
			if (numboobs > 0)
			{
				text += addMenuOption(2, "Remove", -900 + priceoffset, "Remove one of your balls and sell it to the store.");
				text += addMenuOption(3, "Grow", 100 + priceoffset, "Fuck up your back by growing enormous tits!");
				text += addMenuOption(4, "Shrink", 100 + priceoffset, "Shrink your boobs");
					//text += addMenuOption(5, "Reset", 1000 + priceoffset, "Reset your groin to the default number, type, and size of dicks for your species.");
			}
			text += "</ul>";
			
			switch (id)
			{
				case 0: 
					subpage = "main";
					return processButtonPress(-1);
					break;
				case 1: 
					var boob:Breast = main.player.addBreast();
					if (boob == null)
					{
						InfoScreen.push("Your species doesn't have a default breast type, so you'll get a human boob instead.");
						boob = BodyPartRegistry.human_breast;
					}
					boob.onAdded(true, main.player);
					WitchShopScreen.push(type);
					main.player.gold -= 1000 + priceoffset;
					return true;
					break;
				case 2: 
					boob = main.player.breasts.pop();
					main.player.gold += 900 - priceoffset;
					boob.onRemoved(true, main.player);
					WitchShopScreen.push(type);
					return true;
					break;
				case 3: 
					text = "<h2>Grow Dicks</h2>";
					var glassDesc:String = "shot glass";
					if (dickincrement >= 6 && dickincrement < 12)
					{
						glassDesc = "vial";
					}
					else if (dickincrement >= 12 && dickincrement < 18)
					{
						glassDesc = "flask";
					}
					else if (dickincrement >= 18 && dickincrement < 24)
					{
						glassDesc = "tumbler";
					}
					else if (dickincrement >= 24)
					{
						glassDesc = "beer mug";
					}
					text += "<p>The proprietor of the shop produces a " + glassDesc + " full of a maroon, murky liquid and hands the warm glass ";
					text += "to you. </p><p>&quot;Drink.&quot; She directs in a bored tone.</p><p>You give the liquid a quick glance, and then ";
					text += "shrug, raising the " + glassDesc + " to your lips and draining it of its sweet contents.  It doesn't take long for ";
					text += "the effects to take hold, as pins-and-needles rush over your " + Utils.pluralize(main.player.dicks.length,"penis") + ".  The skin tightens, ";
					text += "and then expands.  You groan loudly as your " + Utils.pluralize(main.player.dicks.length,"member") + " erect to their full size, and then ";
					text += "continue until they reach the size you requested:</p><ul>";
					for (var i:int = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].grow(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 4: 
					text = "<h2>Shrink Dicks</h2>";
					text += "<p>The old woman nods after counting her cash, picks up her wand, and then suddenly screams at your groin, pointing ";
					text += "her wand at it.  She stops and returns to counting her cash as your penises retract the amount you specified:</p>";
					text += "<ul>";
					for (i = 0; i < main.player.dicks.length; i++)
					{
						text += "<li>" + main.player.dicks[i].shrink(main.player, true, dickincrement) + "</li>";
						main.player.gold -= 100 + priceoffset;
					}
					text += "</ul>";
					break;
				case 5: 
					var cc:Class = getDefinitionByName(getQualifiedClassName(main.player)) as Class;
					var c:Creature = new cc();
					main.player.gold -= 1000;
					return true;
					break;
			}
			updateScreen();
			return false;
		}
		
		private function BSVaginas(id:int):Boolean
		{
			return false;
		}
	}

}