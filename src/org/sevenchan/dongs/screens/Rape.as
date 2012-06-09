package org.sevenchan.dongs.screens
{
	import mx.accessibility.ButtonAccImpl;
	import org.sevenchan.dongs.bodyparts.Asshole;
	import org.sevenchan.dongs.bodyparts.Build;
	import org.sevenchan.dongs.bodyparts.Vagina;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.enchantment.Corruption;
	import org.sevenchan.dongs.MenuNode;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Rape extends Encounter
	{
		public function Rape(target:Creature)
		{
			super(target);
			lustCost = 3;
			currentItem.clearChildren();
			
			var restrainMenu:MenuNode = currentItem.pushMenu("Restrain", target.gender.doReplace("Ensure %SUB% has limited opportunites to fight back"), tryRestrain);
			
			var fingerMenu:MenuNode = restrainMenu.pushMenu("Finger", target.gender.doReplace("Jam your finger into %POS% orifaces"));
			if (target.assholes.length > 0)
				fingerMenu.pushAction("Ass", -1, "", onFingerAss);
			if (target.vaginas.length > 0)
				fingerMenu.pushAction("Cunt", -1, "", onFingerCunt);
			fingerMenu.pushAction("Ear", -1, "", onFingerEar);
			
			var gropeMenu:MenuNode = restrainMenu.pushMenu("Grope", target.gender.doReplace("Play with %POS% body"));
			if (target.assholes.length > 0)
				gropeMenu.pushAction("Ass", -1, "", onGropeAss);
			//if (target.balls.length > 0)
			//	gropeMenu.pushAction("Balls", -1, "", onGropeBalls);
			if (target.vaginas.length > 0)
				gropeMenu.pushAction("Cunt", -1, "", onGropeCunt);
			//if (target.dicks.length > 0)
			//	gropeMenu.pushAction("Dick", -1, "", onGropeDick);
			//if (target.legs.length > 0)
			//	gropeMenu.pushAction("Legs", -1, "", onGropeLegs);
			//if (target.breasts.length > 0)
			//	gropeMenu.pushAction("Breasts", -1, "", onGropeAss);
			/*
			var penetrateMenu:MenuNode = restrainMenu.pushMenu("Penetrate", "Fuck %POS%.");
			if (target.assholes.length > 0)
				penetrateMenu.pushAction("Ass", -1, "", onFuckAss);
			if (target.vaginas.length > 0)
				penetrateMenu.pushAction("Cunt", -1, "", onFuckCunt);
			if (target.tits.length > 0)
				penetrateMenu.pushAction("Tits", -1, "", onFuckTits);
			
			var releaseMenu:MenuNode = restrainMenu.pushMenu("Release", "Find a way to let %POS% go.");
			releaseMenu.pushAction("Untie", 0, "Cut the ropes and run!", onUntie);
			releaseMenu.pushAction("Dump", 0, "Dump %POS% at the side of a road", onDump);
			releaseMenu.pushAction("Sell", 0, "Sell %POS% to a slaver", onSell);*/
		}
		
		private function tryRestrain(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{
			var arm:String = otherCreature.arms[0].getShortDescr();
			if (!ply.speedCheckAgainst(otherCreature))
			{
				// Too slow
				abortEncounter(otherCreature.gender.doReplace("<h2>Too Slow</h2><p>As you grab for %POS% arm, %SUB% lashes out with a lightning-quick " + arm + ", snatches your wrist, and uses your momentum to drive your head into a wall.  You're dazed, and %SUB% escapes.</p>"));
				ply.HP -= ply.maxHP / 2; 
				return false;
			}
			if (!ply.strengthCheckAgainst(otherCreature))
			{
				// Too weak
				abortEncounter(otherCreature.gender.doReplace("<h2>Too Weak</h2><p>You grab %POS% " + arm + " and wrench on it, trying to force %POS% to the ground.  %SUB% merely laughs, and jerks %POS% " + arm + " out of your grasp, striding away casually.  You try again, and this time, you receive a deep impression of a fist in your face for your troubles.</p>"));
				ply.HP -= ply.maxHP / 2;
				abort = true;
				return false;
			}
			
			node.content = "<p>You grab for %POS% " + arm + " and successfully hold onto it.  She struggles, but she's not match for you.  You eventually wrestle her to the ground and use some rope that you keep in your backback to tie her up firmly.  A hand over her mouth ensures she doesn't scream while you tear up strips of her clothing to use as an impromptu gag.</p>";
			node.content += "<p>You now have your very own " + otherCreature.getTypeName() + " to play with.  What shall you do?</p>";
			node.content = otherCreature.gender.doReplace(node.content);
			return true;
		}
		
		/***********************************************************
		 * FINGERING
		 ***********************************************************/
		private function onFingerAss(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{
			if (otherCreature.assholes.length == 0)
			{
				node.content = otherCreature.gender.doReplace("<p>%SUB% doesn't have an asshole!</p>");
				return false;
			}
			var asshole:Asshole = MathUtils.getRandomVectorEntry(Vector.<*>(otherCreature.assholes));
			var ass:String = asshole.getShortDescr();
			node.content = "<h2>Finger Ass</h2>";
			node.content += otherCreature.gender.doReplace("<p>%SUB% strains against the restraints as you push your finger into %POS% warm " + ass + ", teasing %OBJ%.</p>");
			asshole.timesFucked++;
			return true;
		}
		
		private function onFingerCunt(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{
			if (otherCreature.vaginas.length == 0)
			{
				node.content = otherCreature.gender.doReplace("<p>%SUB% doesn't have a cunt!</p>");
				return false;
			}
			var cunt:Vagina = MathUtils.getRandomVectorEntry(Vector.<*>(otherCreature.vaginas));
			var cunt_s:String = cunt.getShortDescr();
			node.content = "<h2>Finger Cunt</h2>";
			node.content += otherCreature.gender.doReplace("<p>%SUB% strains against the restraints as you push your finger into %POS% warm " + cunt_s + ", teasing %OBJ%.</p>");
			cunt.timesFucked++;
			return true;
		}
		
		private function onFingerEar(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{
			node.content = "<h2>Finger Ear</h2>";
			node.content += otherCreature.gender.doReplace("<p>%SUB% stifles a laugh as you jam your finger into %POS% ear.</p>");
			return true;
		}
		
		private function onGropeAss(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{			
			if (otherCreature.assholes.length == 0)
			{
				node.content = otherCreature.gender.doReplace("<p>%SUB% doesn't have an asshole!</p>");
				return false;
			}
			node.content = "<h2>Grope Ass</h2><p>%SUB% emits a muffled yelp of surprise as ";
			var firm:String = "firm and supple";
			if (otherCreature.build == Build.CHUBBY) {
				firm = "Fat, sweaty";
			}
			if (otherCreature.build == Build.EATSTRAINS) {
				firm = "big, muscly";
			}
			if (otherCreature.build == Build.HIDEOUS) {
				firm = "wrinkled, flabby";
			}
			node.content += "you wrap your hands around %POS% " + firm + " buns and feel them vigourously, appreciating their shape with your anxious hands.  Your victim doesn't seem to appreciate it much.</p>"
			node.content = otherCreature.gender.doReplace(node.content);
			return true;
		}
		
		/*************************************************************
		 * GROPING
		 *************************************************************/
		private function onGropeCunt(ply:Creature, otherCreature:Creature, node:MenuNode):Boolean
		{			
			return false
		}
	}

}