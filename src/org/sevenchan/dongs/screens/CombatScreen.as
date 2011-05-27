package org.sevenchan.dongs.screens 
{
	import org.sevenchan.AdventureController;
	import flash.accessibility.Accessibility;
	import org.sevenchan.dongs.bodyparts.Arm;
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.enchantment.Enchantment;
	import org.sevenchan.dongs.enchantment.events.CombatEndEvent;
	import org.sevenchan.dongs.enchantment.events.CombatTurnEvent;
	import org.sevenchan.dongs.enchantment.Paralyze;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Ability;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.towns.TownBarn;
	import org.sevenchan.dongs.Utils;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class CombatScreen extends Screen 
	{
		private var oldScreen:Screen;
		private var combatant:Creature;
		private var text:String = "";
		private var act:String = "";
		private var playerInitiated:Boolean;
		// Combat
		//   Attack Items Abilities Run Forfeit
		// Attack
		//	 Punch Kick Headbutt 
		public function CombatScreen(prevScrn:Screen,c:Creature,playerInitiated:Boolean) 
		{
			oldScreen = prevScrn;
			combatant = c;
			this.playerInitiated = playerInitiated;
			clearButtons();
		}
		
		override public function processButtonPress(id:int):Boolean 
		{
			main.refreshStats();
			clearButtons();
			if (id == -1 && act=="")
			{
				act = "main";
				combatant.onCombatInit();
				if(playerInitiated) {
					tryAttack(main.player, combatant);
					return true;
				}
			}
			text = "<h2>Fight</h2>";
			text += combatant.combatDescr(main.player);
			text += "<p><b>Attacker's HP:</b> "+combatant.HP+"/"+combatant.maxHP+" (" + Math.round((combatant.HP / combatant.maxHP) * 100) + "%)</p>";
			if ("main" == act)
				return mainMenu(id);
			if ("attack" == act)
				tryAttack(main.player, combatant);
				if (combatant.HP<=0)
				{
					win();
					return true;
				}
				if (main.player.HP<=0)
				{
					lose();
					return true;
				}
			if ("items" == act) {
				AdventureController.screenQueue.write(new InventoryScreen());
				//AdventureController.screenQueue.write(new InfoScreen("NOT IMPLEMENTED"));
				return true;
			}
			if ("abilities" == act) {
				return abilitiesMenu(id);
			}
			
			return false;
		}
		private function mainMenu(id:int):Boolean {
			clearButtons();
			if (!Paralyze.isParalyzed(main.player)) {
				setButton(0, "Attack");
				setButton(1, "Items");
				setButton(2, "Abilities");
				setButton(3, "Run");
				setButton(4, "Forfeit");
			} else {
				setButton(0, "PARALYZED");
			}
			
			switch(id) {
				case 0://attack
					main.player.notifyEnchantments(new CombatTurnEvent(combatant));
					if (Paralyze.isParalyzed(main.player))
					{
						InfoScreen.push("<h2>Paralyzed</h2><p>You are paralyzed, so you can't do shit.</p>");
						combatant.yourMove(this, main.player);
					} else {
						tryAttack(main.player, combatant);
					}
					if (combatant.HP<=0)
					{
						win();
						return true;
					}
					if (main.player.HP<=0)
					{
						lose();
						return true;
					}
					if (main.player.lust>=100)
					{
						lose();
						return true;
					}
					return true;
					break;
				case 1: //Items
					AdventureController.screenQueue.write(new InventoryScreen());
					return true;
					break;
				case 2:
					act = "abilities";
					return abilitiesMenu( -1);
					break;
				case 3:
					if (main.player.speed - combatant.speed > -1) {
						text = "<p>You successfully manage to get away!</p>";
						main.endCombat(oldScreen);
					} else {
						text = "<p>You're unable to get away!</p>";
						main.player.notifyEnchantments(new CombatTurnEvent(combatant));
					}
					updateScreen();
					return true;
					break;
				case 4:
					lose();
					return true;
					break;
			}
			updateScreen();
			return false;
		}
		private function abilitiesMenu(id:int):Boolean {
			clearButtons();
			setButton(0, "CANCEL");
			var ab:Array = [];
			text = "<h2>Abilities</h2>";
			
			if(MathUtils.lengthOf(main.player.abilities)>0) {
				text += "<p>Here are the abilities you currently possess:<ul>";
				for (var k:String in main.player.abilities) {
					ab.push(main.player.abilities[k]);
				}
				
				for (var i:int = 1; i < 12; i++) {
					var ability:Ability = (ab[i - 1] as Ability);
					if(ability!=null) {
						setButton(i, ability.label);
						text += "<li><b>" + ability.name + "</b> - " + ability.description + "</li>";
					}
				}
				text += "</ul></p>";
			}
			else {
				text += "<p><i>You don't have any abilities at the moment.</i></p>";
			}
			if (id == -1) {
				updateScreen();
				return false;
			}
			if (id == 0) {
				act = "main";
				updateScreen();
				return false;
			} else {
				(ab[id - 1] as Ability).activate(main.player, combatant);
				main.player.notifyEnchantments(new CombatTurnEvent(combatant));
				if (combatant.HP<=0)
				{
					win();
					return true;
				}
				if (main.player.HP<=0)
				{
					lose();
					return true;
				}
				if (main.player.lust>=100)
				{
					lose();
					return true;
				}
				act = "main";
				return true;
			}
		}
		override public function getScreenText():String 
		{
			return text;
		}
		
		private function missed(limb:IBodyPart, from:Creature, to:Creature):Boolean {
			var chances:Number = (from.speed - to.speed);
			trace("Probability of " + limb.getDescr(1,from) + " successfully attacking: " + (chances/100));
			return (/*to.counter(limb) &&*/ Math.random() * 100 <= chances);
		}
		
		public function tryAttack(from:Creature, to:Creature):void {
			// Check if paralyze affects from
			if (from.arms.length > 0 && (from.legs.length==0 || MathUtils.rand(0,1) == 0)) {
				var arm:IBodyPart = MathUtils.getRandomVectorEntry(Vector.<*>(from.arms));
				if(missed(arm,from,to))
					arm.onFailedAttack(from,to);
				else
					arm.onGoodAttack(from, to);
				to.yourMove(this,main.player);
				return;
			}
			if (from.legs.length > 0) {
				var leg:IBodyPart = MathUtils.getRandomVectorEntry(Vector.<*>(from.legs));
				if(missed(leg,from,to))
					leg.onFailedAttack(from,to);
				else
					leg.onGoodAttack(from,to);
				to.yourMove(this,main.player);
				return;
			}
			var txt:String = "";
			if(from is Player)
				text = "<p>You don't have arms or legs, so you can't attack!</p>";
			else 
				text = "<p>Your attacker doesn't have arms or legs, so it can't attack!</p>";
			//txt += "<p>Arms: " + from.arms.length +"</p>";
			//txt += "<p>Legs: " + from.legs.length +"</p>";
			AdventureController.screenQueue.write(new InfoScreen(txt));
			to.yourMove(this,main.player);
		}
		
		private function notifyEnchOfCombatEnd(host:Creature, other:Creature, winning:Boolean):void {
			for (var k:String in host.enchantments) {
				host.enchantments[k].onCombatComplete(winning, other);
			}
		}
		
		private function win():void {
			combatant.notifyEnchantments(new CombatEndEvent(false,main.player));
			main.player.notifyEnchantments(new CombatEndEvent(true,combatant));
			main.player.gold += combatant.gold;
			main.player.XP += 6+((main.player.level - combatant.level)*1);
			if (!combatant.onLose(main.player)) {
				WinnerScreen.push(main.player,combatant);
			}
			main.endCombat(oldScreen);
			return;
		}
		
		private function lose():void {
			main.player.HP = main.player.maxHP;
			main.player.gold -= 30;
			main.player.currentTown = Town.knownTowns["barn"];
			combatant.notifyEnchantments(new CombatEndEvent(true,main.player));
			main.player.notifyEnchantments(new CombatEndEvent(false,combatant));
			if (!combatant.onWin(main.player)) {
				LoserScreen.push(main.player,combatant);
			}
			main.endCombat(oldScreen);
			return;
		}
	}

}