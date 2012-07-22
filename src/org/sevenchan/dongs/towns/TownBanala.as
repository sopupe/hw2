package org.sevenchan.dongs.towns 
{
	import flash.utils.Dictionary;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.screens.shops.BodyShop;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class TownBanala extends Town 
	{
		
		public function TownBanala() 
		{
			super();
			ID = "banala";
			name = "Banala";
			
			inhabitants = new Dictionary();
			inhabitants[CreatureRegistry.demon] = 0.25;
			inhabitants[CreatureRegistry.witch] = 0.25;
			
			isWilds = false;
			freeRest = false;
			connectedTowns = [
				"barn","haara","horus"
			];
			
			shops = {
				SQUIGGLE: new Shop("SQUIGGLE","You're not entirely sure;  All you can see are two carved vertical squiggles.  For all yiou know, they might be two S's.",this, 0.40, [
					ItemRegistry.BERRY_WHITE,
					ItemRegistry.SPIDER_VENOM,
					ItemRegistry.POTION_PINK
				]),
				PARTS: new BodyShop("PARTS", "An arm is beautifully painted on an old, distressed sign.  Below that are unintelligable slashes.  Well, unintelligable to you, anyway.", this, 0.35,
				[
					BodyPartRegistry.arachnid_leg,
					BodyPartRegistry.arachnid_penis,
					BodyPartRegistry.demon_breast,
					BodyPartRegistry.demon_eye,
					BodyPartRegistry.demon_penis,
					BodyPartRegistry.human_penis,
					BodyPartRegistry.human_breast
				])
			};
		}
		
		override public function onEnter():void 
		{
			text = "<p>The sleepy town of Banala awaits you.</p>";
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = "<p>Banala is surprisingly... Normal.  For a town built by demons, you expected it to be much different than anything you've experienced, but it's much like your village at home:  The buildings are rickety little places made out of old, sandblasted wood nailed together with a strange, reddish metal. Hand-painted signs in some language you cannot speak advertise the various businesses, and pictures on each sign help you figure out what they sell: Food, Potions, an inn, and  what you can only assume to be body parts, based upon the penis scrawled on the sign.</p>";
			text += "<p>Not much happens during your exploration";
			if(bumpedInto!=null)
				text += ", except for bumping into a " + bumpedInto.getTypeName();
			text +=".</p>";
		}
		
		
		// TODO: Rework
		override public function onRevelation():Boolean 
		{
			text = "<p>You round a sand dune, probably the 5th one this hour, and curse to yourself for not bringing enough water.  <i>Brilliant fucking work,</i> you scold yourself, and continue walking, feeling faint.</p>";
			text += "<p>An hour later, you arrive at Banala.  You immediately begin drinking out of the community well, and nearly fall in.  After a few minutes of slurping noisily from the bucket, you lift your head, suddenly acutely aware of a great number of demons and demonesses looking in your direction, most carrying weapons or shop implements.</p>";
			text += "<p>&quot;...Uh, hello.&quot; You try, hoping they’re of the same group as the Barn merchant.</p>";
			text += "<p>The group doesn't waver. &quot;We want nothing to do with Lord Paimon's invasion.  Get the fuck out of here.&quot; A very large demoness orders, her fat moving as she brandishes a broom in your direction.</p>";
			text += "<p>&quot;Are you inferring that I am a part of that sick, traitorous bastard's personal army?&quot;  You ask, your mood souring as the insult touches a nerve.  The anger boils in your blood. &quot;He burned our villages, raped our women, and sold our children into slavery.  I want nothing more than to see him die on my sword.&quot;</p>";
			text += "<p>&quot;... I see.&quot; The fat one responds as the villagers lower their weapons, &quot;Then you are welcome here. I assume you arrived from the old barn, yes?&quot; You nod hesistantly. She smiles sadly. &quot;Then you are woefully unprepared for what lies ahead.&quot;  Without saying more, she waddles away, with the rest of the villagers in tow.</p>";
			text += "<p><i>Fuck.</i></p>";
			return true;
		}
		
		override public function onFailedRest():void 
		{
			text = "<p>You do not have enough money to rest here.</p>";
		}
		
		override public function onSuccessfulRest():void 
		{
			text = "<p>You toss the money required onto the innkeeper's countertop.  The fat innkeeper drops the key onto the counter, and you plod off to your room, ignoring the spiderwebs and roaches that scurry across the floors.  Every room sounds occupied, judging by the loud moans and grunting, but you manage to sleep on the bedbug-infested bed quite well, recovering all of your health and mana.</p>";
		}
		
		override public function onShopBuyMenu():String 
		{
			return super.onShopBuyMenu();
		}
		
		override public function onShopSellMenu():String 
		{
			return super.onShopSellMenu();
		}
		
		override public function onShopWelcome():String 
		{
			return super.onShopWelcome();
		}
	}

}