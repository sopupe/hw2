package org.sevenchan.dongs.screens.shops 
{
	import flash.utils.Dictionary;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.bodyparts.IBodyPart;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.screens.Shop;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BodyShop extends Shop 
	{
		private var partsInventory:Dictionary = new Dictionary();
		private var BuyItems:MenuNode;
		public function BodyShop(name:String, description:String, t:Town, markup:Number, itemsSold:Array) 
		{
			super(name, description, t, markup, []);
			inventory = [];
			
			currentItem.clearChildren();
			currentItem.content = <![CDATA[
			<p>
				As soon as your eyes adjust to the interior lighting, you immediately gag and back towards the door.  Before you, lit by 
				flickering candle light, are rows upon rows of body parts displayed in clear glass cases.  Everything from spider legs to 
				tentacles to unidentified organs sit on luxurious red pillows inside of their dimly lit cases.
			</p>
			<p>
				“Hey, not on the rug, buddy !”  The store owner shouts from behind the thick marble counter, jabbing his fat finger in your
				direction while peering over his jeweler’s spectacles perched over what could be called a nose.  “I’m not gonna have a 
				fucking drunk wreck my new carpet.”  He reveals a thick wooden bat and wobbles it at you in a somewhat threatening manner.
			</p>
			<p>
				You hold up your hands in defense.  “Uh, sorry.  I’ve never seen a, uh…”  You flail your hands a bit, indicating the shop 
				in its entirety.  The store owner narrows his eyes. “You’ve never seen a body shop before?  Seriously?”  You nod in 
				response, eyes focused on the bat.   He scratches his balding head, and then sighs, his rotund body collapsing in 
				exasperation as he throws the bat into a cupboard and rolls his eyes. “Alright, I guess I’ve got nothing better to do than give people the 
				grand fucking tour.”  He starts to explain, and the pieces begin to fall together.
			</p>
			<p>
				Most towns in the demon realm have body shops.  Here, you can buy and sell body parts, which comes in handy when you begin 
				to collect excess limbs from creature encounters.  In addition, some body parts carry their own special attacks or 
				abilities.  However, anatomy is hard to come by, so it’s typically very expensive, and the spells to safely graft the more 
				powerful limbs to your body require more in the way of potions and labor, so they’re more costly.
			</p>
			]]>.toString();
			BuyItems = currentItem.pushMenu("Buy", "Check out the frightening display of limbs");
			
			var ArmsMenu:MenuNode = null;
			var AssholesMenu:MenuNode = null;
			var BreastsMenu:MenuNode = null;
			var EyesMenu:MenuNode = null;
			var HairMenu:MenuNode = null;
			var LegsMenu:MenuNode = null;
			var PenisMenu:MenuNode = null;
			var SkinMenu:MenuNode = null;
			var TesticleMenu:MenuNode = null;
			var VaginaMenu:MenuNode = null;
			var WingMenu:MenuNode = null;
			var cats:Array = [];
			for each (var o:* in itemsSold)
			{
				var bp:IBodyPart = o as IBodyPart;
				partsInventory[bp.name] = MathUtils.rand(1, 5);
				if (cats.lastIndexOf(bp.category) == -1)
				{
					cats.push(bp.category);
					switch(bp.category) {
					case "arms":
						AddToOrCreateMenu(ArmsMenu, "arms", "Arms", "Arms and similar limbs.",bp);
						break;
					case "assholes":
						AddToOrCreateMenu(AssholesMenu, "assholes", "Anuses", "Buttholes, rectums, insectoid/spider abdomens and such.",bp);
						break;
					case "breasts":
						AddToOrCreateMenu(BreastsMenu, "breasts", "Breasts", "Boobs and other secretion glands shaped like boobs.", bp);
						break;
					case "eyes":
						AddToOrCreateMenu(EyesMenu, "eyes", "Eyes", "Sight organs of all kinds",bp);
						break;
					//case "hair":
					//	AddToOrCreateMenu(HairMenu, "hair", "Hair", "Hair.  There's not much to it", bp);
					//	break;
					case "legs":
						AddToOrCreateMenu(LegsMenu, "legs", "Legs", "Limbs made for locomotion (and sometimes kicking).", bp);
						break;
					case "dicks":
						AddToOrCreateMenu(PenisMenu, "dicks", "Penises", "Male sex organs.", bp);
						break;
					case "skin":
						AddToOrCreateMenu(SkinMenu, "skin", "Skin", "Skin, scales, fur, slime.  Change your body texture.", bp);
						break;
					case "testicle":
						AddToOrCreateMenu(TesticleMenu, "balls", "Testes", "Balls affect how your semen looks and how it affects people who get pumped full of it.", bp);
						break;
					case "vagina":
						AddToOrCreateMenu(VaginaMenu, "vaginas", "Vaginas", "Female sex organs of all shapes and sizes.", bp);
						break;
					default:
						trace("!!!!!!WAAAAAAAT!!!!",typeof(bp), bp.category);
					}
				}
			}
		}
		
		private function AddToOrCreateMenu(menu:MenuNode, bodyGroup:String, menuName:String, menuDescription:String, bp:IBodyPart):void 
		{
				trace("Adding " + bp.sellDesc + ": " + bp.value);
				if (menu == null) {
					menu = BuyItems.pushMenu(menuName, menuDescription);
					menu.content = menuDescription;
				}
				menu.pushAction(bp.name,bp.value+(bp.value*markup),bp.sellDesc,function(ply:Creature, node:ActionNode, o:*):Boolean
				{
					ply[bodyGroup].push(bp);
					return true;
				}, bp);
		}
	}

}