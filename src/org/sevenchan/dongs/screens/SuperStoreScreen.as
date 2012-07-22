package org.sevenchan.dongs.screens
{
	import flash.utils.*;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.bodyparts.Hair;
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.enchantment.Hunger;
	import org.sevenchan.dongs.enchantment.Paralyze;
	import org.sevenchan.dongs.enchantment.WindBlessing;
	import org.sevenchan.dongs.INode;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.MenuNode;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class SuperStoreScreen extends Encounter
	{
		private var title:String = "";
		private var priceoffset:Number = 0;
		private var dickincrement:Number = 0;
		private var type:int = 0;
		private var inventory:Array = [];
		
		public static function push():void
		{
			AdventureController.screenQueue.write(new SuperStoreScreen());
		}
		
		public function SuperStoreScreen()
		{
			super(null);
			setup(0, 6, "WelMart");
			inventory = [];
			for each (var item:Item in Item.Registry)
			{
				var i:Item = item.copy();
				i.amount = 100;
				inventory.push(i);
			}
			
			currentItem.clearChildren();
			// Buy:
			//   Body Parts:
			//   Transformations:
			//   Items:
			//   Enchantments:
			//   Pregnancies:
			// Leave
			
			var BuyMenu:MenuNode = currentItem.pushMenu("Buy", "Buy anything.  Literally.");
			var BuyBodyParts:MenuNode = BuyMenu.pushMenu("BodyParts", "Buy any kind of body part under the sun.");
			{
				var ArmsMenu:MenuNode = BuyBodyParts.pushMenu("Arms", "");
				var AssholesMenu:MenuNode = BuyBodyParts.pushMenu("Assholes", "");
				var BreastsMenu:MenuNode = BuyBodyParts.pushMenu("Breasts", "");
				var EyesMenu:MenuNode = BuyBodyParts.pushMenu("Eyes", "");
				var HairMenu:MenuNode = BuyBodyParts.pushMenu("Hair", "");
				var LegsMenu:MenuNode = BuyBodyParts.pushMenu("Legs", "");
				var PenisMenu:MenuNode = BuyBodyParts.pushMenu("Penis", "");
				var SkinMenu:MenuNode = BuyBodyParts.pushMenu("Skin", "");
				var TesticleMenu:MenuNode = BuyBodyParts.pushMenu("Testicle", "");
				var VaginaMenu:MenuNode = BuyBodyParts.pushMenu("Vagina", "");
				var WingMenu:MenuNode = BuyBodyParts.pushMenu("Wing", "");
				
				for each (var name:XML in describeType(BodyPartRegistry)..accessor.@name)
				{
					var partname:String = name.toString();
					var bpo:* = BodyPartRegistry[partname];
					if (bpo is IBodyPart)
					{
						var bp:IBodyPart = (bpo as IBodyPart);
						trace(bp, bp.category);
						switch (bp.category)
						{
							case "arms": 
								ArmsMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.arms.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "assholes": 
								AssholesMenu.pushAction(bp.name, 100, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.assholes.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "breasts": 
								BreastsMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.breasts.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "hair": 
								HairMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.hair = bp as Hair;
										return true;
									}, bp);
								break;
							case "legs": 
								LegsMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.legs.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "dicks": 
								PenisMenu.pushAction(bp.name, 100, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.dicks.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "balls": 
								TesticleMenu.pushAction(bp.name, 100, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.balls.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "vaginas": 
								VaginaMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.vaginas.push(o as IBodyPart);
										return true;
									}, bp);
								break;
							case "wings": 
								WingMenu.pushAction(bp.name, 250, bp.getShortDescr(), function(ply:Creature, node:ActionNode, o:*):Boolean
									{
										ply.wings.push(o as IBodyPart);
										return true;
									}, bp);
								break;
						}
					}
				}
			}
			var BuyEnchantments:MenuNode = BuyMenu.pushMenu("Enchant", "Buy any enchantment or curse possible.");
			{
				
				BuyEnchantments.pushAction("Corruption", 0, "Add +10 Corruption", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addEnchantment(new Corruption(10));
						return true;
					});
				BuyEnchantments.pushAction("Hunger(Egg)", 0, "Add hunger for Harpy Eggs.", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addEnchantment(new Hunger(ItemRegistry.DARK_HARPY_EGG.id, 1));
						return true;
					});
				
				BuyEnchantments.pushAction("Hunger(Gonad)", 0, "Add hunger for gonad.", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addEnchantment(new Hunger(ItemRegistry.SPIDER_GONAD.id, 2));
						return true;
					});
				
				BuyEnchantments.pushAction("Paralyze", 0, "Duh, 5 turns", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addEnchantment(new Paralyze());
						return true;
					});
				
				BuyEnchantments.pushAction("WindBless", 1500, "Add wind blessing", function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addEnchantment(new WindBlessing());
						return true;
					});
			}
			var BuyItems:MenuNode = BuyMenu.pushMenu("Items", "Any materialistic item you could dream of.");
			for each (var item:Item in Item.Registry)
			{
				BuyItems.pushAction(item.name, item.value, item.descr, function(ply:Creature, node:ActionNode, o:*):Boolean
					{
						ply.addToInventory(o as Item);
						return true;
					}, item);
			}
			var BuyTransformations:MenuNode = BuyMenu.pushMenu("Preg", "Order up any kind of pregnancy.", needsOriface);
		
		}
		
		public function needsOriface(ply:Creature, node:MenuNode):Boolean
		{
			return ply.assholes.length > 0 || ply.vaginas.length > 0;
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
			if (abort)
			{
				return true;
			}
			switch (id)
			{
				case-1: 
					onStartupScreen();
					appendMenu();
					updateScreen();
					return false;
					break;
				case 0: 
					if (currentItem.parent == null)
					{
						onLeaving();
						return true;
					}
					else
					{
						currentItem = currentItem.parent;
						text = currentItem.content;
						appendMenu();
						updateScreen();
						return false;
					}
					break;
				default: 
					var nci:INode = currentItem.children[id - 1];
					var ret:Boolean = false;
					if (nci is ActionNode)
					{
						ret = (ActionNode(nci)).invoke(this, this.main.player, (nci as ActionNode).arg);
					}
					else
					{
						if ((MenuNode(nci)).canSwitchTo(main.player, subject, this))
						{
							currentItem = nci;
						}
					}
					if (!abort)
						text = nci.content;
					if (!ret && !abort)
					{
						appendMenu();
					}
					updateScreen();
					return ret;
			}
			return false;
		}
		
		override public function getScreenText():String
		{
			return text;
		}
	
	}

}