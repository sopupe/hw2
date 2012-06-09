package org.sevenchan.dongs.screens.encounters
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.creature.Bova;
	import org.sevenchan.dongs.creature.Harpy;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.screens.Encounter;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.towns.WildsHorusSpine;
	
	/**
	 * @author Harbinger
	 */
	public class BovaEncounterScreen extends Encounter
	{
		private var state:String = "main";
		
		public static function push(bova:Bova):void
		{
			AdventureController.screenQueue.write(new BovaEncounterScreen(bova));
		}
		
		public function BovaEncounterScreen(subj:Creature)
		{
			super(subj);
			lustCost = 3;
			currentItem.content = "<p>The cowgirl looks at you tiredly, flicking one of her ears at a fly.  \"What?\", she asks in her deep voice, tilting her head in frustration at your indecisiveness.  The movement causes her cowbell to ding.</p>";
			currentItem.children.push(new ActionNode(currentItem, "Milk", MathUtils.rand(250, 300), "Buy some milk from her for a few hundred gold.", onBuyMilk));
			main = Main.main;
			if (main.player.dicks.length > 0)
				currentItem.children.push(new ActionNode(currentItem, "Sex", 0, "Tempt her with sex", onFuck));
		}
		
		override public function onStartupScreen():void
		{
			if (!main.player.getExplored("seenbova"))
			{
				main.player.setExplored("seenbova");
				text = "<h2>Bova</h2><p>While exploring the markets (which typically involves you ";
				text += "poking an item of food with a stick to see if it'd try to eat ";
				text += "you), you are grabbed from behind and dragged into an alley by ";
				text += "a firm hand.  Scared stupid and not afraid to admit it, you ";
				text += "ball your fists and swing at the hand.  You miss, of course, ";
				text += "but the hand releases you, letting your head hit the pavement ";
				text += "with a muffled <i>thud</i>.  You then jump to your feet and ";
				text += "whirl on your attacker, a cute, female human, but side from the ";
				text += "head and general body structure, something strikes you as ";
				text += "odd.  First, she doesn't seem interested in killing you, so ";
				text += "your anger fades.  Second, she has bovine horns erupting from ";
				text += "the sides of her skull, a cowbell around her neck, and ";
				text += "extremely large breasts and buns.  A welcoming smile, along the ";
				text += "way she plays with her breasts tells you that she's interested.</p>";
				
				text += "<p>&quot;So, I guess I'm your first Bova, huh?&quot;  She cracks ";
				text += "a mischeivious smile, revealing strong, white teeth.  &quot;Well, ";
				text += "I can do a couple of things for you...  First, I can sell you milk. ";
				text += "Milk can heal you while boosting your mana, but it'll cost you.  ";
				text += "If you're not into milk, well...&quot; She winks.  &quot;I can do.";
				text += ".. Other things, too.&quot;  You've been through enough to know ";
				text += "<i>exactly</i> what she's talking about. &quot;So, what'll it be?&quot;</p>";
			}
			else
			{
				text = currentItem.content;
			}
		}
		
		public function onBuyMilk(ply:Creature, node:ActionNode):Boolean
		{
			text = "<h2>Bova Milk</h2><p>The pretty cowgirl lights up with joy, though "
			text += "the burdens of city life have left obvious mental and physical scars "
			text += "that still dampen her strange enthusiasm.  After counting the change, "
			text += "she hugs you with a sincere &quot;Thank you,&quot;, produces a "
			text += "glass jar, and milks her own milk into it, smiling all the while.  "
			text += "You suppose the smile is from her being able to afford to eat.  "
			text += "Before you could muse further on her sad state, she hands the warm "
			text += "bottle to you. &quot;There you go.  Anything else?&quot;  She tilts "
			text += "her head.</p>";
			ply.addToInventory(ItemRegistry.MILK);
			node.content = text;
			return false;
		}
		
		public function onFuck(ply:Creature, node:ActionNode):Boolean
		{
			// You didn't use a fucking gas mask
			
			if (!ply.hasItem(ItemRegistry.GAS_MASK.id))
			{
				text = "<h2>Always Use Protection</h2>";
				text += "<p>She smiles mischieviously again as you unzip, and then blushes as she, too, slips out of her clothing, letting her huge tits spill out of her tight shirt.  You lick their puffy, swollen nipples, eliciting a soft moan as you soothe her skin.  You finish undressing each other in a cheap hotel room you hurriedly purchase together from a bored innkeeper who was all too happy to see bare breasts.  The door barely closes behind the both of you as you throw yourselves into bed.</p>";
				text += "<p>Your " + ply.getDickDescr() + " throb uncontrollably against her thigh, and it doesn't take long to find yourself balls-deep in a moaning cowgirl while suffocating in her massive tits.</p>";
				text += "<p>And that's when it all goes terribly wrong.</p>";
				text += "<p>You loudly stifle a giggle as a loud fart escapes her buns while in the middle of orgasm.  Her eyes shoot open, and you finish into her right before she screams at you to run.  &quot;Why?  It's not like there's a fucking Ala in this room.  Are you concerned about the fart, because I don't m-&quot;  She interrupts you by shoving you out of bed and huddling you towards the door, but it's too late as the effects of her gasses take hold</p>";
				//text += "<p>TODO: Transformation into a Bova</p>";
				InfoScreen.push(text);
				ply.lust = 0;
				if (ply is Player)
					(ply as Player).changeTo(CreatureRegistry.bova);
			}
			else
			{
				var paid:int = Math.min(100, ply.gold);
				ply.gold -= paid;
				node.content = "<p>She smiles mischieviously again as you unzip, and then blushes as she, too, slips out of her clothing, letting her huge tits spill out of her tight shirt.  She notices your gas mask fall out of your bag, and she puts it on you.  You look at her in confusion, but she merely plants a wet kiss on the goggles and whispers &quot;trust me&quot; into your ear.   You finish undressing each other in a cheap hotel room you hurriedly purchase together from a bored innkeeper who was all too happy to see bare breasts.  The door barely closes behind the both of you as you throw yourselves into bed.</p>";
				node.content += "<p>Your " + ply.getDickDescr() + " " + Utils.pluralize(ply.dicks.length, "throbs", "throb") + " uncontrollably against her thing, and it doesn't take yourself long to find yourself ball-deep in her wet cunt.<p>";
				node.content += "<p>After a about half an hour of slow thrusting,  your goggles are completely steamed up on the inside and smeared with cheap lipstick on the outside.  You can't see a thing, but you understand why the mask was put on, as she passed gas the entire time you were in bed with her.  Even though it is hot and stale inside of the mask, it's certainly tolerable compared to outside...</p>";
				node.content += "<p>After you leave, she leaves a stack of gold on the nightstand, explaining it was for the ruined, milk-soaked bed and the miasma.  You pay her " + paid + "G for the experience, receiving a warm kiss and a hug in exchange.  As she turns to leave, you see her wiggle  her bum and wink back at you before she vanishes into the crowd.</p>";
				ply.lust = 0;
			}
			return true;
		}
	}

}