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
				SQUIGGLE: new Shop("SQUIGGLE","You're not entirely sure;  All you can see are two carved vertical squiggles.  For all you know, they might be two S's.",this, 0.40, [
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
			(shops.SQUIGGLE as Shop).discoveredDescription = "A basic potion shop.";
			(shops.PARTS as BodyShop).discoveredDescription = "A small Body Shop.";
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
		
		override public function onRevelation():Boolean 
		{
			text = <![CDATA[
			<p>
	You decide it's probably high time to get off your butt and start exploring the world.  After all, you do have 
	your own world to save.  To that end, you peek outside from the ruins of the old barn you currently inhabit, 
	shielding your eyes from the massive sun looming in the sky.  During your visual sweep, you find a faint outline 
	of a road half-buried in the drifting sands.  Tattered signs shimmer and twist in the wind off in the distance.
</p>
<p>
	Having decided your route, you fill a waterskin from the creaky handpump, still amazed that a device so old 
	could put out such clean water.  Having filled it, you heft your backpack and set out into the world without even a 
	nod to the merchant.  Then again, it is doubtful he would have seen you, being highly involved in excavating 
	sand from his nostrils in a corner of the barn.
</p>
<p>
	You later decide that you should have brought far more than a single waterskin, while rounding the fifth sand 
	dune that hour.  You're exhausted from carrying your supplies, and the dry heat from the sun dehydrates you quickly. 
	You pass by a sign, but are so thirsty and dazed that you don't read it. Even if you did, it is so damaged 
	from the constant sandblasting from the desert that it is completely illegible. 
</p>
<p>
	Suddenly, you notice a well in front of you - painfully, with your shin - and immediately set to work hauling the 
	bucket up, foregoing the winch in your haste.  You can barely see it as it rises from the dark depths of the well, 
	and it rebounds off the sandstone sides of the well as you hurriedly pull it up, spilling water.  You take that as 
	your cue to be more careful, and you finally are able to grasp it and bring it to your lips, practically pouring the 
	slimy water down your gullet and probably spilling half of it down your front in your haste.  You gasp in releif and 
	open your eyes.
</p>
<p>
	At which point you notice the crowd of particularly unhappy demons surrounding you, weilding everything from swords to mops.
</p>
<p>
	<i>Well, you've gotten yourself into a fine mess today,</i> you tell yourself, standing up cautiously and eyeing the dozen or 
	so demons around you.  There's something odd about these demons, though;  It's like they're nervous instead of the usual 
	blind rage you've seen of their kin in Aldoria.  Some of them shift from foot to foot like they're preparing to run. 
	Before you can consider your chances further, however, a rotund demoness waddles forward, gripping a broom in her 
	thick hands like a sword.  You turn to her, ignoring the sweat staining her thin top, and manage to ask "Uh, can I he-" before she cuts 
	you off with a diagonal slice from a chubby hand.
</p>
<p>
	"Enough!"  She bellows, and pauses, either waiting for you to respond or waiting for the earthquakes of flab to quiet down 
	while she eyes you like a bear coming to defend her cubs.  In retrospect, probably the latter, as when you open your mouth 
	to reply, she painfully jams the end of the broomstick into your chest, while yelling, "I ASK THE QUESTIONS, AND YOU ANSWER THEM. 
	KEEP YOUR MOUTH SHUT." 	She prods your chest on each of the last 3 words for emphasis.
</p>
<p>
	Off-balance and an inch away from falling backwards down the well, you nod in silent compliance, mouth pressed into a thin line.
</p>
<p>
	Regathering herself (which is quite a task) and grumbling, she continues. "We know you're here to prey on us for our 
	<i>Dear Benefactor</i>."  She mocks the name, complete with fat airquotes. "Now we need to decide what to do with 
	you."  She stirs her chin with a hand in thought, and then pauses when she notices your darkening expression.  "What?" 
	She asks.
</p>
<p>
	"You wouldn't happen to mean the guy leading the armies that are destroying my home, would you?"  You ask, eyes as dark 
	and hard as slate. You wrench the broom away from her. "Because if you're implying I'm <i>helping</i> that sick son of 
	a bitch, you're going to need to apologize before I do something drastic."
</p>
<p>
	Her hands come up in a defensive gesture, but she relaxes.  She sighs, and nods as the pieces come together. "No, I do 
	see I've made a mistake.  I am sorry."  She pauses, shaking her head in exasperation. "Press gangs have come through here 
	about once a week trying to get us to join in on the invasion.  I thought you might be involved.  Then again..."  She smiles, 
	revealing a gleaming set of sharp teeth. "... You don't look like you'd meet the strength requirements." 
</p>
<p>
	You give her a blank look.  "Wait, so not every demon is trying to rape and pillage everything?" You scratch your head, 
	releasing a small cloud of sand onto the ground. "I thought that was-"
</p>
<p>
	A groan. "What every demon does."  She finishes.  "Yeah, yeah, I know the story.  Fact is, we actually like it here. 
	All the stuff we need is right here, and up til the armies started rolling through here, bringing up trouble, we had 
	no intention of ever leaving."  She places her hands on her hips, and they sink in. "In fact, many of us still want 
	to stay. We've got friends, families, and businesses here.  Why piss you humans off for no reason? 
</p>
<p>
	You pause, waiting for the punchline.  "... So why are you?"
</p>
<p>
	She shrugs.  "No one seems to know why."  She stirs her chin again ponderously.  "However, there's a widespread hunch: 
	There's a disease going around that makes us go mad, especially for sex.  Some of us are immune, while others run around raping 
	everything in sight." Another shrug. "I don't know all the details, of course, but the general consensus is that 
	the corrupted ones won't rape each other;  They'll only go after fresh meat.  So, what happens when they run low of fresh meat?"
</p>
<p>
	It doesn't take long for the implications to sink in. <i>So that's where they were taking everyone they captured...</i> A chill 
	races down your spine.
</p>
<p>
	The demoness shrugs, and picks up her broom while you're still processing her words.  "Anyway, hope that helps.  I've gotta get 
	back to work though, so drop by if you need anything."  She waddles off, followed by the rest of the village, but pauses 
	halfway to her stoop to bellow over her shoulder.  "Oh, and before I forget:  Welcome to Banala."
</p>
]]>.toString();
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
	}

}