package org.sevenchan.dongs.screens.encounters
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.ActionNode;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.npc.Gargoyle;
	import org.sevenchan.dongs.creature.npc.NPC;
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.screens.Encounter;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class GargoyleEncounter extends Encounter
	{
		
		public static function push(subj:Gargoyle):void
		{
			AdventureController.screenQueue.write(new GargoyleEncounter(subj));
		}
		
		public var gargoyle:Gargoyle = new Gargoyle();
		
		public function GargoyleEncounter(subj:Gargoyle)
		{
			super(subj);
			gargoyle.load();
			currentItem.clearChildren();
			if (!main.player.getExplored("gargoyle"))
			{
				// TODO: Rewrite this.  Work on it.
				text = "";
text += "You set off in search of new horizons, setting off from camp in a completely new direction";
text += " than you've ever tried before. Away from the parts of Mareth you have thus far discov";
text += "ered, much of the world seems to be a barren wasteland devoid of life";
/* if Desert is discovered: "making even the desert seem healthy and full of life" */
text += "<p>. Your trip soon begins to seem unproductive, having found no new areas of Mareth nor any ";
text += "contact with its inhabitants; you sigh and turn back towards camp.</p>";
text += "When you do, however, you catch the faintest glimpse of... something... in the distance. S";
text += "quinting, you shield your eyes from the sun and try to discern the strange glint on th";
text += "e horizon, but it is simply too far away. Well, whatever it is, it certainly merits a ";
text += "check – it could be anything, perhaps a city,";
/* if Tel'Adre has been discovered: "or the ruins of one of Tel'Adre's more distant neighbors," */
text += "or some demon enclave that needs destroying. With a quick check of your";
/* weaponName */
text += "<p>, you begin the long trek toward the shimmer in the distance.</p>";
/* Next */
/* Advance time by 1 hour */
text += "<p>You finally close the distance between yourself and the strange structure, which begins t";
text += "o take shape ahead. Though half-buried under what must be years of built up sand and d";
text += "ebris, you can clearly make out high stone walls supported by vaulted arches, broken e";
text += "very so often by the shattered remains of stained-glass windows and a pair of utterly ";
text += "destroyed oaken doors nearly hidden behind a row of tall marble pillars, many of which";
text += " have long-since crumbled. High above the ground, you can see a pair of tall, slender ";
text += "towers reaching up the heavens, one of which has been nearly obliterated by some unima";
text += "ginably powerful impact, leaving it a stump compared to its twin. From the rooftops, s";
text += "trange shapes look down upon you – stone statues made in the image of demons, dragons,";
text += " and other monsters.</p>";
text += "<b>You have discovered The Cathedral</b>";
/* If Fen wants to make this a Place; otherwise it can be encountered in the future via the Explore –> Explore function. Whichever works better. */
text += "<p>You arrive at the grounds around the ruins, cordoned off by a waist-high wrought-iron fenc";
text += "e that surrounds the building and what once might have been a beautiful, pastoral gard";
text += "en, now rotting and wilted, its trees chopped down or burned and its bushes fragile ca";
text += "rcases one strong wind away from being tumbleweeds. A few dozen tombstones outline the";
text += " path to a gaping maw that was once the great wooden doors. Seeing no obvious signs of";
text += " danger, you make your way inside, stepping cautiously over the rubble and rotting deb";
text += "ris that litters the courtyard.</p>";
text += "<p>It’s quite dark inside, illuminated only by the thin shafts of light streaming in from the";
text += " shattered windows and sundered doors. You can make out a few dozen wooden pews, all e";
text += "ither thrown aside and rotting or long-since crushed, leading up to a stone altar and ";
text += "an effigy of a great green tree, now covered in graffiti and filth. Stairs beside the ";
text += "alter lead up to the towers, and down to what must be catacombs or dungeons deep under";
text += "ground.</p>";
text += "<p>However, what most catches your eye upon entering the sanctuary are the statues that line ";
text += "the walls, beautifully carved gray stone idols of creatures, animal-morphs, and nearer";
text += " to the altar, god-like beings, each set into its own little alcove. Most have, sadly,";
text += " been destroyed along with the cathedral, each wallowing in a pile of its own shattere";
text += "d pieces; some have had whole limbs or other extremities broken off and carried away b";
text += "y looters, leaving them mere shadows of their formers selves.</p>";
text += "All of them but one. In the farthest, darkest alcove you see a single statue that still se";
text += "ems whole. It is of a women – well, more like a succubus than a human woman. Though po";
text += "sed in a low, predatory crouch, she would stand nearly six feet tall, with hair sculpt";
text += "ed to fall playfully about her shoulders. A pair of bat-like wings protrude from her b";
text += "ack, curled back to expose the lush, smooth orbs of her breasts, easily double-Ds on a";
text += " human. A spiked, mace-like tail curls about her legs, which are attached to the pedes";
text += "tal upon which she is placed. As you stand marveling at the statue's beauty, you canno";
text += "t help but notice the slit of her pussy, nearly hidden beneath her. Oddly, it seems to";
text += " have been carved hollow so that you could easily stick a few fingers inside if you so";
text += " chose.";
/* If Libido => 40: "Maybe you could take this with you as a life-like sex toy?" */
text += "<p>However, your attention is soon drawn from her body to the pedestal upon which she stands.";
text += " A pair of solid gold chains extend from the pedestal to her wrists, binding the statu";
text += "e, and a plaque has been bolted on, a feature you cannot see upon any of the other sta";
text += "tues here. Leaning down, you blow a sizable amount of dust from the plaque, revealing ";
text += "the following short inscription:</p>";
text += "<p><i>&quot;Break my bonds to make me tame. &quot;</i></p>";
text += "<p>You suppose you could break the chains on the statue. But who knows what will happen if yo";
text += "u do?</p>";
/* Display [Break Chains] and [Don't Break] options */
text += "<p><b>Don't Break</b></p>";
text += "<p>Oh, no. Nope. Uh-uh. Not going to happen. You're not falling for that trick! No, sir. Nuh-";
text += "uh. As soon as you chop those chains, it'll probably just come to life and try to kill";
text += " you. Feeling rather smart, you turn on a heel and exit the cathedral – there's nothin";
text += "g else to see right now.</p>";
text += "If you change your mind, you can always come back. Statue's been here for decades, it can ";
text += "wait a while longer.";
/* Return player to Camp, advance time an hour */
text += "<p><b>Break Chains</b></p>";
/* Introduces two new values: [GarName], the gargoyle's name, given by the Champion, and Confidence, a value that has a base score of 0 [submissive/slave] rising to 100 [equal]. Negatives are possible. */
text += "You swing your";
/* weaponName */
text += "up over your head and slam it/them down upon the chains.";
/* if using your hands: "OW! Dammit, that hurt. What the hell were you thinking!? Still, looks like you got results... */
text += "<p>An ear-splitting <i>SCHING!</i> echoes through the cathedral as shards of gold go flying.";
text += " You recoil, shielding your face from the surprisingly explosive force of the chains' ";
text += "shattering. When the dust settles you cautiously lower your arms, giving you a good vi";
text += "ew of what lies – or rather, kneels – before you:</p>";
text += "<p>The gargoyle has stepped down from her pedestal, and now kneels as a supplicant before a k";
text += "ing, forehead near the ground and weight rested upon her stone knuckles even as her ma";
text += "ssive wingspan unfolds behind her and her mace-like tail swishes rapidly behind her. S";
text += "lowly, the gargoyle raises her head to gaze upon you, her now ruby-red eyes staring in";
text += "to yours. Her smooth, nippleless breasts heave and her once-stone hair falls forward i";
text += "n stands, fringing her smooth, angular face. Her thin, gray lips slowly curl into a sm";
text += "all, sultry smile as she says, just on the edge of hearing...</p>";
text += "<p>&quot;Master. My... Master. &quot;</p>";
text += "<p>You glance over your shoulder, but there's no one else here. She must be referring to you!";
text += "</p>";
text += "<p>&quot;What would you have of this one, Master?&quot; she asks, looking up at you expectantly.</p>";
text += "Still cautious, you ask her what she is, exactly";
/* clearly she's no ordinary statue! */
text += "<p>.</p>";
text += "<p>&quot;I am your humble servant, Master. Your tool. Your plaything. Your toy. Ask, and I shall o";
text += "bey. &quot; She seems to pause for a moment, and adds in an emotionless whisper, &quot;this one ";
text += "would be honored to pleasure the Master, if s/he desires. &quot;</p>";
text += "<p>That raised more questions than it answered. Taking things slow for now, you ask her name.";
text += "</p>";
text += "<p>&quot;I... I am... I simply am. What would Master call me?&quot;</p>";
/* Display a textbox, into which the player can type in a name. This new value will be called [GarName], henceforth. */
text += "";
/* Confidence +10 */
text += "&quot;";
/* GarName */
text += ",&quot; she purrs, &quot;";
/* GarName */
text += ",";
/* GarName */
text += "<p>. Master has interesting taste. &quot;</p>";
text += "<p>She continues to kneel before you expectantly. You suppose you could give her an order – p";
text += "erhaps something humorous, or perhaps something carnal – or maybe just talk to her, th";
text += "ough as yet she seems a bit... odd.</p>";
/* Display options [Funny Order], [Carnal Order]. and [Talk] */
text += "<p><b>Funny Order</b></p>";
text += "<p>If she's so intent on playing the servant, you suppose you can play along. Summoning up yo";
text += "ur most commanding voice, you snap, &quot;ROLL OVER!&quot;</p>";
text += "To her credit,";
/* GarName */
text += "hesitates only for a moment before dropping to the floor and rolling belly-up, limbs upra";
text += "ised like a puppy in training. Stifling a chuckle, you lean down and do just that, giv";
text += "ing her a quick belly rub. Her skin is cool to the touch, and impeccably smooth, as yo";
text += "u might expect from a marble statue. Seemingly pleased,";
/* GarName */
text += "<p>scrambles back to a low crouch before you, awaiting your next command.</p>";
text += "<p><b>Carnal Order</b></p>";
text += "Well, well.";
/* GarName */
text += "<p>seems willing to follow any order you give, no matter how carnal, and you could not help ";
text += "but notice her rather <i>arousing</i> attributes earlier. Smirking wickedly, you comma";
text += "nd your new gargoyle to finger herself.</p>";
text += "&quot;Master reminds me of the last master,&quot; she says quietly, almost coldly, but does not hesi";
text += "tate to flop onto her taut butt and spread her legs wide for you. Easily, she slips th";
text += "ree fingers into her slit, which stretches slightly to accommodate the insertion. Watc";
text += "hing you intently, she begins to rapidly piston her fingers in and out, masturbating t";
text += "o a rhythm near that of your";
/* if Corruption <40: flustered; else, excited */
text += "<p>heartbeat. The way she watches you, unblinking, as she fingers herself is rather unnervin";
text += "g, and you soon command her to stop. She does so immediately, though with what you thi";
text += "nk might have been a sigh, and assumes a low crouch to await your next command.</p>";
text += "<b>Talk";
/* First Time */
text += "<p></b></p>";
text += "You decide against giving";
/* GarName */
text += "";
/* an/another */
text += "<p>order. Instead, you right a nearby toppled pew and seat yourself across from the crouchin";
text += "g gargoyle, returning her intense stare with one of your own.</p>";
text += "<p>&quot;Why were you chained up?&quot; you finally ask, glancing at the shattered bonds on the ground.";
text += "</p>";
text += "<p>&quot;Master found a new toy and soon grew tired of me. Still, she did not want me stolen. &quot;</p>";
text += "<p>&quot;Your last master?&quot;</p>";
text += "<p>&quot;That is correct. &quot;</p>";
text += "<p>&quot;Who was... she?&quot;</p>";
text += "<p>&quot;She was... Master. &quot;</p>";
/* Silly mode */
text += "<p>: &quot;You know 'master' is masculine, right?&quot;</p>";
text += "<p>&quot;Indeed. Master was male, too. &quot;</p>";
text += "&quot;But you just... Nevermind. &quot;";
/* /silly mode */
text += "<p>&quot;Fine,&quot; you sigh. Apparently she doesn't want to tell you, and you don't feel like pressin";
text += "g the issue just yet. &quot;In that case, what happened here?&quot;</p>";
text += "Suddenly,";
/* GarName */
text += "<p>breaks the stare and looks away, as if in shame. &quot;The demons' doom that even now blights ";
text += "Mareth took its toll here, too. The people of a town no longer here believed they were";
text += " safe under Marae's roof. Protected. Their faith was... Misplaced. &quot;</p>";
text += "It seems the events that led to the cathedral's destruction weigh heavily on";
/* GarName */
text += "<p>'s heart. What do you do?</p>";
/* Display options: [Berate] and [Reassure] */
text += "<p><b>Berate</b></p>";
/* Confidence - 10 */
text += "A pillar of rage boils up inside you. You are";
/* CharName */
text += "<p>, Champion of Ingnam, you tell her, rising to your feet, fists clenched. Your duty is the ";
text += "same as hers was, to protect your home. And she failed. She let all those people down.";
text += " You tell her that she's worthless, disgusting, a failure.</p>";
/* GarName */
text += "<p>recoils, flinching from you in expectation of assault. Instead, you spit on the ground an";
text += "d start for the exit. You shout over your shoulder for her to stay here and wallow in ";
text += "her failure until you deign to use her.</p>";
text += "<p>You storm out of the cathedral with a knot of disdain in your gut. From behind you, you're";
text += " not quite sure, but perhaps you heard &quot;I couldn't leave here if I wanted to. &quot;</p>";
/* Player is returned to camp; advance time 1 hour */
text += "<p><b>Reassure</b></p>";
/* Confidence +10 */
text += "You can't help but feel sorry for the poor gargoyle. It isn't hard to figure out what happ";
text += "ened, and in truth, she reminds you a bit of yourself – and of the consequences if you";
text += " ever fail. You reach over and put a hand on her smooth, cold shoulder. As reassuringl";
text += "y as you can, you tell her that you are";
/* CharName */
text += "<p>, the Champion of Ingnam. Your duty isn't entirely dissimilar to what hers was, you say, a";
text += "nd while you hope you'll never know what she's gone through, you can certainly sympath";
text += "ize.</p>";
/* GarName */
text += "<p>looks up at you, her ruby-red eyes shining in the dim hit of light in the cathedral. You ";
text += "cup her cheek and give her a smile. &quot;Come on, now,&quot; you say, offering her a hand up. &quot;";
text += "Let's get out of here. &quot;</p>";
text += "<p>&quot;Master... I cannot. &quot; she says, again looking away from you. &quot;Please, do not ask that of ";
text += "me. I... I am still bound to this place. Please, Master. I shall never ask anything of";
text += " you again. Please. &quot;</p>";
text += "<p>Slowly, you nod, and ask her if she'll be alright here all by herself. She gives you a lit";
text += "tle smile and says, &quot;Of course, Master. Especially if... if you return. You will retur";
text += "n, Master? Won't you?&quot; She looks deeply into your eyes and huskily purrs, &quot;I can make ";
text += "it... pleasurable... if you do... &quot;</p>";
text += "You rustle";
/* GarName */
text += "<p>'s hair and assure her you will before you take your leave and return to camp.</p>";
/* Return to camp, advance time 1 hour */
text += "<i>";
/* Whenever the player returns to the Cathedral, play one of the following introductions, then the "Cathedral Interior" scenes. */
text += "<p></i></p>";
text += "<p><b>Player Returns to the Cathedral A</b></p>";
text += "You make your way back to the ruined Cathedral in the wastelands. You notice some of the d";
text += "ebris has been cleared away from the courtyard, and some of the windows have been boar";
text += "ded up.";
/* GarName */
text += "<p>'s obviously been working since you last left, trying to make the building more habitable.";
text += " With your path less obstructed than before, you enter.</p>";
text += "<p><b>Player Returns to the Cathedral B</b></p>";
text += "You spot the Cathedral in the distance, and see plumes of smoke rising. Alarmed, you ready";
text += " your";
/* weaponName */
text += "<p>and rush over. To your relief, however, you discover the burning objects are just a few d";
text += "ead imps that were looking for easy pillage, but found the Cathedral's newly-awoken pr";
text += "otector instead. Stepping around their charred corpses, you enter.</p>";
text += "<p><b>Player Returns to the Cathedral C</b></p>";
text += "<p>You wander into the Cathedral grounds, and are rather alarmed to see a pair of little gree";
text += "n goblin sluts poking around outside, trying to cart off some of the stone tombstones ";
text += "for their nefarious schemes. They see you approaching, however, and quickly flee – mor";
text += "e interested in salvage than fighting or fucking today. Chuckling to yourself, you ent";
text += "er.</p>";
text += "<p><b>Cathedral Interior – 06:00 –> 09:00 & 18:00 –> 21:00</b></p>";
text += "In the dim early morning / late evening light streaming in from the broken windows, you se";
text += "e";
/* GarName */
text += "poking around some of the rubble, slowly but surely making efforts to repair the damage d";
text += "one to the Cathedral. Seeing you, however, she immediately drops what she was doing an";
text += "d";
/* if Confidence <70: "kneels before you, head bowed low. " if Confidence 71 – 99: "bows low before you, a small smile on her stone lips. " if Confidence = 100: "with a sexy sway of her hips, approaches you and lays a small but tender kiss upon your cheek before bowing her head to you. */
text += "&quot;Master has returned,&quot;";
/* GarName */
text += "says";
/* if Confidence >50: "happily. " else "solemnly. " */
text += "<p>&quot;What would you have of me?&quot;</p>";
/* Display options: [Sex] [Rituals] [Talk] [Appearance] and [Leave]. If Confidence is 70+, also display the option for [Kinky Rituals] */
text += "<p><b>Cathedral Interior: 10:00 –> 17:00</b></p>";
text += "Within the ruins, you can see";
/* GarName */
text += "perched atop her pedestal in a low, predatory crouch, much as you found her. Waving a han";
text += "d in front of her eyes, you confirm she's in some sort of dormant mode. A simple touch";
text += " from her Master could revive her";
/* and if Lust >= 30: ", or you could use her to satisfy your own urges, not unlike a life-size sex toy" */
text += "<p>.</p>";
/* Display options: [Wake Her] [Use Her [if Lust >= 30]] [Appearance] and [Leave] */
text += "<p><b>Sex</b></p>";
text += "You approach";
/* GarName */
text += "and tell her you have some... pressure that needs relieving.";
/* if Confidence =< 69: "The gargoyle bows low before you, her face expressionless. "By your command, Master. How would you have me?" */
text += "";
/* if Confidence >= 70: "Her ruby-red eyes lock with yours and a sultry grin plays across her gray marble features. She slides an arm around your waist and presses her sizable, surprisingly soft breasts against your chest. "How would Master have me?" */
/* If Male, display options: [Vaginal] [Anal] [Titfuck] [Strap-on] [Leave] */
/* If Female, display options: [Tail Fuck] and [Ride Strap-on] [Leave] */
/* If Herm, display all above options */
/* If Genderless, display [Strap-on] [Leave] */
text += "<p><b>Anal</b></p>";
text += "You tell her to get on all fours as you shed your";
/* armorName */
text += ", unleashing your already-hardening";
/* cockDescript[0] */
text += "<p>. Nervously, the gargoyle does as you command, quickly finding a clear bit of floor and ge";
text += "tting on her hands and knees. You kneel down behind her, peeling her taut ass-cheeks a";
text += "part to reveal her tight slit and the marble ring of her tiny asshole. Grinning, you s";
text += "lather up your forefinger with your tongue, lubing it up as best you can before pressi";
text += "ng it to her backdoor.</p>";
/* GarName */
text += "makes a sharp little gasp as you push your finger into her. You slide into her with surpr";
text += "ising ease, reveling in how <i>cold</i> her interior is. She's like ice inside! You st";
text += "art thrusting your finger faster, trying to get her warmed up a little as your prepare";
text += " her anus.";
/* GarName */
text += "<p>squirms and moans softly as you finger-fuck her bum, slowly changing from moans of discom";
text += "fort to little gasps of pleasure.</p>";
text += "Deciding you've gotten her more than ready, you grasp your";
/* cockDescript[0] */
text += "<p>and push the head against her still-tight ass. Her mouth forms a sharp &quot;O&quot; of pleasure as";
text += " you grab her hips and push into her. Though you've lubed her up plenty, her passage i";
text += "s still incredibly tight, and so cool inside it takes a force of will to keep your coc";
text += "k from wilting. But all it takes is one look at hr face over her shoulder, eyes rolled";
text += " back in pleasure, to keep you thrusting in at full mast.</p>";
/* if PC's first cock is 50 inches or bigger; Silly Mode only: */
text += "Knowing full well the living statue doesn't have much in the way of anatomy, you continue ";
text += "to push more and more of monstrous manhood into";
/* GarName */
text += "'s asshole, watching with glee as her stomach begins to distend with the massive size of y";
text += "our prick. Then her chest bulges, making her gasp in pain and clutch at her breast; th";
text += "at doesn't stop you, though. With one mighty, massive thrust, you slam yourself up to ";
text += "the hilt in";
/* GarName */
text += "<p>'s ass, and watch with glee as the head bursts out of her mouth, squirting pre and drool a";
text += "ll over the floor. The poor gargoyle makes a muffled scream and starts flailing around";
text += " helplessly, trying to do <i>something</i> about the massive member now protruding fro";
text += "m her mouth.</p>";
text += "With gusto, you start hammering away at your living cock-sleeve, using her entire body as ";
text += "one great big ona-hole to take your gargantuan girth. Resigned to her fate,";
/* GarName */
text += "slumps forward and grasps the head of your";
/* cockDescript[0] */
text += "<p>, giving you a handy through her mouth as her innards milk the rest of your shaft.</p>";
text += "<p>The sensation of fucking straight through the gargoyle proves to be too much, however, and";
text += " you give yourself up to orgasm with one last, mighty thrust. You cry out as your cum ";
text += "jets through her body and out her mouth, blasting across the floor just in front of he";
text += "r and leaving huge globs splattered across her face and chest.</p>";
text += "<p>Now sated, you put your hands on her butt and push her off your giant cock, causing her to";
text += " go face-first into the sprawling pool of your cum on the floor. With a chuckle, you p";
text += "at the insensate gargoyle on the head and head back to camp.</p>";
/* if PC doesn't qualify for the above: */
text += "You spend a few minutes making short, slow thrusts into the gargoyle's ass, slowly working";
text += " your way further and further inside her until you bottom out";
/* if Balls: ", your balls slapping against her butt" */
text += "<p>. &quot;M-Master,&quot; she pants, chest heaving after the experience. You give her a playful push, ";
text += "leaving her face on the cold stone floor as you withdraw your cock to the tip from her";
text += " cold stone insides. She clenches up tight as you slam yourself back in, nearly making";
text += " you cum on the spot. Now you're the one moaning, and so decide to reward her with a s";
text += "harp slap on the ass. She makes a little squeak when you strike her, but she tightens ";
text += "up wonderfully, her anal passage trying to milk you as you withdraw. You give her anot";
text += "her swat as you push back in, and are treated to the same results. Grinning, you pick ";
text += "up your pace, alternating between pounding her tight asshole and slapping her taut but";
text += "t cheeks.</p>";
text += "Soon, she's moaning again, this time all in pleasure, utterly enthralled in the assault yo";
text += "u're laying onto her behind. Her spiked tail and wings spasm and twitch wildly around ";
text += "you, a sure sign of her having given over to the pleasure of your rough buttfucking. S";
text += "he's only able to keep up for a few minutes, however, before you feel her ass contract";
text += "ing hard upon your shaft, her muscles clamping down as her body prepares for a massive";
text += " anal orgasm. Pleased that your ministrations are close to bringing her to orgasm, you";
text += " let yourself go, and quickly feel the tell-tale rush of seed up your shaft. You hold ";
text += "out for just a moment more, until";
/* GarName */
text += "<p>cries out with pleasure, letting loose a scream that echoes to the rafters. You cum, too,";
text += " shooting your jism up her ass in thick spurts that only serve to provide you futher l";
text += "ubrication, letting you pound her hard until you've shot off every last bit of cum.</p>";
text += "Utterly sated, you gently push";
/* GarName */
text += "off your cock. She collapses on the floor, insensate, and soon is surrounded by a pool of";
text += " your spooge leaking from her ass. With a grin, you pat her on the head and collect yo";
text += "ur";
/* armorName */
text += "<p>before heading back to camp.</p>";
text += "<p><b>Vaginal</b></p>";
text += "You gently push";
/* GarName */
text += "onto her back and spread her long, marble legs, giving you a clear view of her tight litt";
text += "le pussy. You brush your hand along her thighs, making her gasp with the sensation as ";
text += "your knuckles run along her smooth, cool flesh. Your fingers come to her small clit, a";
text += "nd you caress her tiny pleasure buzzer, eliciting a tiny moan from the gargoyle. Grinn";
text += "ing, you give it another fleck;";
/* GarName */
text += "<p>squirms, trying to either enhance or end the sensation, you can't be sure. You start to f";
text += "inger her clitty harder, creating little circles around it as you slip another finger ";
text += "into her tight passage.</p>";
text += "You're rewarded for your efforts by";
/* GarName */
text += "bucking her hips into your hands, moaning, &quot;M-Master... Please... &quot; Not done teasing her ";
text += "yet, you put your other hand on her flat belly and start to crawl it up, tickling her ";
text += "as you make your way toward her sizable breasts. You glomp onto one of them, giving it";
text += " a rough squeeze as you drive your finger into her a little further than before. &quot;Mast";
text += "errrrr... &quot;";
/* GarName */
text += "<p>whines, reaching up to stroke your cheek. Deciding you've teased the poor girl enough, yo";
text += "ur prepare for the main course.</p>";
text += "You pull your";
/* cockDescript[0] */
text += "from your";
/* [armorName] */
text += ", letting it flop down atop her crotch. Embarrassed,";
/* GarName */
text += "<p>looks away as you rub the underside of your cock across her mons, spitting on it for a bi";
text += "t of extra lubricant. You lean back, lining the tip of your cockhead with the gargoyle";
text += "'s tight slit, and press forward. She lets out a sharp gasp as your cock presses again";
text += "st her, pushing it past her lips and finally slipping into her depths.</p>";
text += "Though her opening was painfully tight, her inner passage expands easily around your cock,";
text += " letting you slip in more and more of your dickmeat until you're buried";
/* if cock >= 50 inches long: "as far as she can take you. " else "up to the hilt inside her" */
text += "<p>. Now that you're so deep in the gargoyle, you can see her visibly trembling, panting with";
text += " pleasure. Leaning down, you cup her cheek and plant a kiss on her thin lips. She retu";
text += "rns it eagerly, letting your probing tongue in to play with hers. Mid-kiss, she wraps ";
text += "her arms and legs around you, holding you close against her heaving chest.</p>";
text += "You start to thrust against her, making short, fast strokes in and out of her cool passage";
text += ". Soon, you're both moaning with pleasure as you change the tempo, switching to long a";
text += "nd hard pumps that make the Cathedral echo with the sound of your hips slapping into";
/* GarName */
text += "<p>'s raised asscheeks. She can only hold on to you tighter, biting her lower lip, eyes close";
text += "d, as you start to well and truly pound her.</p>";
text += "To your dismay, you feel the tell-tale clenching in your gut, signaling your impending org";
text += "asm. You clutch at";
/* GarName */
text += "<p>'s shoulders as you slam into her one last time, as far as you'll go, and shoot out the fi";
text += "rst of your load. The sensation of your thick, hot jizz exploding into her sets the ga";
text += "rgoyle off as well: she rolls her head back and lets out a soft scream, crunching down";
text += " on your cock until you're afraid it's going to burst. You bury your face in her neck ";
text += "and let her milk your cock for all its worth, until your spooge threatens to overflow ";
text += "and pool on the ground.</p>";
text += "The two of you lay there for a while after, until your";
/* cockDescript[0] */
text += "has deflated and you've both stopped panting from exertion and pleasure. Giving her anoth";
text += "er kiss, you pull out of her cold depths – now significantly warmer thanks to your pas";
text += "sion – and stuff your dick back into your armor.";
/* If Confidence >=70: "Before you can stand, though, [GarName] hugs her arms tightly around you pulling you down on top of her and mashing your face between her soft tits. */
text += "&quot;Thank you, Master,&quot; she says, running a hand through your";
/* hairDescript */
text += "<p>. &quot;Thank was wonderful. &quot;</p>";
text += "<p>You give her a pat on the head and head on back to camp.</p>";
text += "<p><b>Tit-Fuck</b></p>";
text += "You situate yourself on a pew and spread your legs. You pat your thighs, telling";
/* GarName */
text += "to sit between your legs as you fish out your";
/* cockDescript[0] */
text += "<p>. She approaches, hesitantly placing herself on the floor between your legs as you recline";
text += " and stroke your shaft to full hardness. You let the gargoyle sit there, watching you ";
text += "wide-eyed as you continue to masturbate. Though you're only preparing for the main act";
text += ", you can't help but enjoy the sensation of such a basic sexual act, made all the more";
text += " pleasurable by the creature at your feet, her face barely an inch from your cock's he";
text += "ad as you stroke yourself.</p>";
text += "Once you're satisfied at your cock's rigid hardness, you tell";
/* GarName */
text += "to put those big, soft tits of hers to work. &quot;M-Master?&quot; she gasps, making a cute little ";
text += "&quot;o&quot; with her mouth just an inch from your shaft. You repeat the order, and giver her a";
text += " thump on the nose with your cock for emphasis. Shyly, she cups her D-cups and leans i";
text += "nto you, squeezing your";
/* cockDescript */
text += "<p>between them.</p>";
text += "With a little encouragement,";
/* GarName */
text += "<p>starts to rise and fall on her knees, dragging your shaft through her soft, cool mounds. ";
text += "With a pleasured sigh, you reach down and stroke her hair, petting the girl as she beg";
text += "ins to slowly but steadily titfuck you. Still mumbling encouragements, you sit back an";
text += "d let the pleasure run over you, reveling in the incredible softness of her sizable ch";
text += "est massaging your cock, making steady progress toward stroking the cum out of you.</p>";
text += "Suddenly, you feel an overwhelming wetness on your cock. You look down, expecting to see p";
text += "re flowing freely from you, but are instead greeted with the sight of";
/* GarName */
text += "sliding the tip of your cock into her mouth, starting to fellate you on top of the tittyf";
text += "uck. You give her a few more words of encouragement and press her head down further on";
text += "to your shaft, forcing her to take all that's left over from her breasts. Despite her ";
text += "marble nature, her mouth is moist and surprisingly warm, and her long tongue is quick ";
text += "to wrap around your";
/* cockDescript[0] */
text += "<p>, wringing it in time with her chest-thrusts.</p>";
text += "<p>Seeing no reason to hold back, you relax as much as possible and lose your mind in the ple";
text += "asure of dual stimulation. You soon find yourself gasping softly as she works her soft";
text += " tits around your cock and teases your now-dilating urethra with her tongue. You soon ";
text += "feel your guts churning and your dick stiffening even more – here it comes!</p>";
text += "You grab";
/* GarName */
text += "and push her down hard, slamming your cock down her throat as you cum. A human would sure";
text += "ly have choked with this maneuver – instead,";
/* GarName */
text += "<p>squirms and flails, but you can see and feel her swallow your cum as it pours into her mo";
text += "uth, her throat massaging your flaring head, milking it harder than any tit-job ever c";
text += "ould have. Once her face has been ground into your pubes, you buck your hips sharply, ";
text += "thrusting into her throat as the last of your jizz spurts out and down her gizzard.</p>";
text += "By the time you're done,";
/* GarName */
text += "'s face is an utter mess, with white lines trickling down her cheeks. You drag your";
/* cockDescript[0] */
text += "out of her with a wet POP, unleashing a dam of jizz that quickly leaks out of her agape m";
text += "outh to stain her breasts and belly. You chuckle at the sight";
/* IF CONFIDENCE >=70: ", and to your surprise, so does [GarName]" */
text += "<p>.</p>";
text += "<p>&quot;Was that... Pleasing, Master?&quot; she asks innocently.</p>";
text += "<p>You give her a little pat on the head and tell her it was more than pleasing. Gratified, t";
text += "he little gargoyle sets to slurping up your cum as your clean yourself up and head bac";
text += "k to camp.</p>";
text += "<p><b>Strap-On</b></p>";
/* Coding this one may be a *little* complex */
text += "Giving a quick look around the ruins, you tell";
/* GarName */
text += "<p>to go find something that can bring you two a little <i>closer</i>.</p>";
text += "&quot;Closer?&quot; she asks, confused. You roll your eyes and tell her to grab the holy rod sitting";
text += " on the altar and put it through a leather strap. She hesitates for a moment, but duti";
text += "fully does as you ask, returning a moment later with the smooth, silver cylinder and a";
text += " leather thong. With a bit of work, you've created a simple strap-on out of the holy r";
text += "od, and instruct";
/* GarName */
text += "<p>to put it on. Now she's getting it! The gargoyle slips into the leather, giving a cute li";
text += "ttle shiver as one end of the rod slips inside her. Before she has a chance to recompo";
text += "se herself, you grab her rod-cock in one hand and give her a gentle push with the othe";
text += "r.</p>";
text += "She lays down with you atop her, straddling her waist as you stroke her rod, rewarded with";
text += " sharp pleasure-gasps from the statue-girl. You're hardly stimulating her pussy with t";
text += "hese actions – she must be able to feel <i>through</i> the rod, as if it were a real c";
text += "ock. Amused, you start to jerk the rod off, sliding it through your clenched fist with";
text += " slow, measured strokes.";
/* GarName */
text += "<p>squirms under the pleasurable attention, and is soon groping her big breasts and bucking ";
text += "her hips into your fists, shoving more of her rod-cock into your hand with each of you";
text += "r jerks.</p>";
text += "&quot;Well, someone's enjoying herself,&quot; you tease, and immediately";
/* GarName */
text += "freezes, her mouth agape with embarrassment. With a little laugh, you give her a pat on t";
text += "he thigh and start to strip out of your";
/* armorName */
text += ". But you can't just leave";
/* GarName */
text += "<p>without SOME stimulation:</p>";
/* If Human Legs/Feet [ie, needs toes], as new paragraph */
text += ": &quot;you reveal your leg first, moving slowly and sensually, giving her a tantalizing look a";
text += "t your nethers before hiding them again. With a wide grin, you creep your foot up to h";
text += "er thighs and gently run your heel along her smooth, tender flesh. You come to the bas";
text += "e of her rod, standing stark straight in the air like a flag-pole. As you strip, you g";
text += "rasp her cock between your big and second toe, sliding them up the smooth shaft to the";
text += " tip.";
/* GarName */
text += "moans, rolling her head back as you start to foot-fuck her cock, slowly putting more and ";
text += "more pressure on the steel member until its pressed against her belly. Your heel takes";
text += " over, running quickly along the underside of her cock as you finally rid yourself of ";
text += "your";
/* armorName */
text += "<p>.</p>";
/* Else, continued from above paragraph: */
text += "You giver her a good show, putting on a brief striptease for the gargoyle. You strip your";
text += "";
/* armorName */
text += "<p>slowly, sensually, showing only the barest hints of your privates until the last moment, ";
text += "when the last piece of your clothing falls to the floor.</p>";
/* From Both, if has Vagina: */
text += "";
/* GarName */
text += "is panting with lust by the time you're done teasing and stripping for her. Now nude, you";
text += " drop back to your knees over her holy rod-cock, straddling her hips and lining her up";
text += " with your";
/* vaginaDescript */
text += "<p>. You lower yourself until the tip of the rod is pressing against your lower lips – you're";
text += " pleasantly surprised by the warm tingling sensation that quickly spreads out around t";
text += "he point of contact, and your cunny responds immediately by letting loose a little tri";
text += "ckle of moisture that beads down on the gargoyle's shaft.</p>";
text += "Without further ado, you drop down on the strap-on, lowering yourself onto the tingling me";
text += "tal rod until your groin is pressed against";
/* GarName */
text += "'s. She, all the while, is biting her lower lip and whimpering with pleasure as your";
/* vaginaDescript */
text += "swallows her length. Once you've taken all she has to offer, you begin grinding your hips";
text += " against her, rocking back and forth atop the gargoyle. To your surprise,";
/* GarName */
text += "grabs you, squeezing her long fingers into your";
/* hipsDescript */
text += "<p>and pulling you up, almost off her rod. You decide to go with it; you grab her tits for s";
text += "upport and start to bounce on her cock.</p>";
text += "Soon, you're both moaning with pleasure, bucking and thrusting your hips to meet each othe";
text += "r as you continue to ride";
/* GarName */
text += "'s strap-on. However, you can feel the clenching sensation of a coming orgasm building in ";
text += "your gut, and if the strained panting of your partner is any indication, she isn't far";
text += " behind. You start bouncing faster, increasing to a wild pace as your cunt contracts o";
text += "n the metal rod inside it, trying to milk the fake cock as waves of pleasure roll over";
text += " you. You don't let up throughout the orgasm, quite literally riding it out until";
/* GarName */
text += "lets out a high-pitched shriek and grabs your back, smashing your face into her tits and ";
text += "holding you tight as she, too cums. Suddenly she's the one pounding you, thrusting her";
text += " hips into your";
/* vaginaDescript */
text += "<p>.</p>";
text += "By the time she's done, both your hips and thighs are spattered with your sweat and girlcu";
text += "m. Still panting from the ordeal, you slowly drag yourself off of";
/* GarName */
text += "'s cock and roll onto your back, exhausted. By the time you've recovered enough to stumble";
text += " to your feet,";
/* GarName */
text += "<p>is fast asleep beside you, snoring cutely, her metal cock still standing straight up in t";
text += "he air. You give her a gentle pat on the thigh and get dressed, leaving the gargoyle s";
text += "noozing peacefully as you head back to camp.</p>";
/* ELSE, PC has no vagina: */
text += "";
/* GarName */
text += "is panting with lust by the time you're done teasing and stripping for her. Now nude, you";
text += " drop back to your knees over her holy rod-cock, straddling her hips and lining her up";
text += " with your";
/* assholeDescript */
text += ". You lower yourself until the tip of the rod is pressing against your clenched backdoor –";
text += " and you're pleasantly surprised by the warm tingling sensation that quickly spreads o";
text += "ut around the point of contact. Your anus responds immediately by utterly relaxing, le";
text += "tting just the tip of";
/* GarName */
text += "<p>'s strap-on slide inside you. .</p>";
text += "Without further ado, you drop down on the strap-on, lowering yourself onto the tingling me";
text += "tal rod until your ass is pressed against";
/* GarName */
text += "'s thighs. She, all the while, is biting her lower lip and whimpering with pleasure as you";
text += "r ass swallows her length. Once you've taken all she has to offer, you begin grinding ";
text += "your hips against her, rocking back and forth atop the gargoyle. To your surprise,";
/* GarName */
text += "grabs you, squeezing her long fingers into your";
/* hipsDescript */
text += "<p>and pulling you up, almost off her rod. You decide to go with it; you grab her tits for s";
text += "upport and start to bounce on her cock.</p>";
text += "Soon, you're both moaning with pleasure, bucking and thrusting your hips to meet each othe";
text += "r as you continue to ride";
/* GarName */
text += "'s strap-on. However, you can feel the clenching sensation of a coming anal orgasm buildin";
text += "g in your gut, and if the strained panting of your partner is any indication, she isn'";
text += "t far behind. You start bouncing faster, increasing to a wild pace as your hole contra";
text += "cts on the metal rod inside it, instinctively trying to force out the intruder, but on";
text += "ly serving to let waves of pleasure roll over you. You don't let up throughout the org";
text += "asm, quite literally riding it out until";
/* GarName */
text += "lets out a high-pitched shriek and grabs your back, smashing your face into her tits and ";
text += "holding you tight as she, too cums. Suddenly she's the one pounding you, thrusting her";
text += " hips into your";
/* assholeDescript */
text += "<p>until you've both cum, hard, clutching each other as orgasmic pleasure slams through you.";
text += "</p>";
text += "Still panting from the ordeal, you slowly drag yourself off of";
/* GarName */
text += "'s cock and roll onto your back, exhausted. By the time you've recovered enough to stumble";
text += " to your feet,";
/* GarName */
text += "<p>is fast asleep beside you, snoring cutely, her metal cock still standing straight up in t";
text += "he air. You give her a gentle pat on the thigh and get dressed, leaving the gargoyle s";
text += "noozing peacefully as you head back to camp.</p>";
text += "<p><b>Tail Fuck</b></p>";
text += "Without warning, you grab";
/* GarName */
text += "'s thick, spiked tail and give it a playful yank. She lets out a surprised &quot;EEP,&quot; but sett";
text += "les down after you tell her to cop a squat and stiffen it up. Obediently, she assumes ";
text += "a low crouch and stiffens her tail into a &quot;U&quot; shape between her legs, its tip pointed ";
text += "straight up between your belly and her face. You ruffle her hair and strip out of your";
text += "";
/* armorName */
text += "<p>, soon standing nude before the gargoyle. At a command from you, the brutal stone spikes p";
text += "rotruding from her tail's tip retract, leaving the appendage a smooth, cool surface.</p>";
text += "<p>With a little balancing help from a nearby pew, you balance yourself over the narrow tip o";
text += "f her tail and slowly lower yourself down upon it. The tip slips through your lower li";
text += "ps easily, its stone cold surface sending a chill up your spine as you slide down the ";
text += "gargoyle's shaft. You shudder as you finally bottom out on her tail, taking it until y";
text += "our cunt is almost painfully stretched by her ever-thickening tail and you can feel th";
text += "e tip pressing against the entrance to your womb.</p>";
text += "Now firmly inside your depths,";
/* GarName */
text += "begins to wiggle her tail inside you, slithering a few inches in and out of your";
/* vaginaDescript */
text += ". Encouraging her, you grasp her shoulders for support and push your cunt a little closer ";
text += "to her face. Taking the hint, she snakes out her long tongue and gives your clitty a l";
text += "ittle flick, eliciting an immediate gasp of pleasure from you. She's soon engaging in ";
text += "a double-assault on you, suckling on your";
/* clitDescript */
text += "one moment, and ramming her tail into your";
/* vaginaDescript */
text += "<p>the next.</p>";
text += "Just as you feel your body begin to tense up in preparation for orgasm, the gargoyle slips";
text += " her hands around your waist. You're about to ask what she's doing when you feel a fin";
text += "ger pressing up against your";
/* assholeDescript */
text += "<p>. With her oral ministrations, it's hard to relax your sphincter to allow her entrance, bu";
text += "t when she does finally get in, the feeling of her cold, smooth finger traveling up yo";
text += "ur rectal passage is incredible.</p>";
text += "Before you can get used to the anal intruder, your eyes have rolled back in your head with";
text += " pleasure. Girlcum spurts from your cunt, splattering";
/* GarName */
text += "<p>'s face with your juices as you cum. Your holes squeeze down on her appendages, trapping t";
text += "hem inside you as your ride out the orgasm, bouncing on her rigid, rapidly-moistening ";
text += "tail until your body settles down.</p>";
text += "When you've finished, you carefully extricate yourself from the gargoyle’s tail and, a bit";
text += " bow-legged, gather up your";
/* armorName */
text += ". By the time you're dressed,";
/* GarName */
text += "<p>'s cleaned herself off and is eagerly awaiting some token of your approval.</p>";
text += "&quot;Was Master satisfied?&quot; she asks";
/* if Confidence >70: "with just a hint of a smile" */
text += "<p>.</p>";
text += "<p>You rub her head and tell her that oh, yes you were. You leave her with a gratified smile ";
text += "on her thin lips.</p>";
text += "<p><b>Use Her – Male/Herm</b></p>";
text += "You approach the motionless statue with a lustful look in your eye. Quickly, you strip out";
text += " of your";
/* armorName */
text += "<p>and circle around the frozen girl. With some effort, you're able to lift her heavy, spike";
text += "d tail out of the way, revealing the tight cunt hidden between her legs. You drop to y";
text += "our knees behind the gargoyle and bury your face in her crack, slurping at her vag, ge";
text += "tting it nice and moist in preparation for your cock.</p>";
text += "To your surprise, the gargoyle does not even respond to your tongue as you slide it inside";
text += " her. She's completely motionless – even the walls of her love canal are still as you ";
text += "spread your saliva around inside her. After a few minutes of preparation, you grab you";
text += "r";
/* cockDescript[0] */
text += "<p>and slide on home. Despite her natural tightness, it's relatively easy going thanks to th";
text += "e liberal lubrication you applied moments ago, and soon you're buried up to the hilt i";
text += "nside the gargoyle. You give a few quick thrusts into her tight, smooth hole that quic";
text += "kly build up to a fast, hard fucking.</p>";
text += "But you aren't quite satisfied just pounding an insensate hole. Know that you have the pow";
text += "er to &quot;revive&quot;";
/* GarName */
text += "through touch, you decide to put this to rather devious use. You reach around her body an";
text += "d grab one of her breasts, giving it a few hard squeezes until you hear the faintest g";
text += "asp from the little gargoyle. You release it immediately. Your hand switches down to h";
text += "er taut ass and gives it a loud swat. You repeat the action twice, and finally feel he";
text += "r cunt contract – just a bit – around your shaft. You switch your attentions down to h";
text += "er thighs, gently running your hands along both expanses of gray skin beneath your thr";
text += "usting";
/* cockDescript[0] */
text += "<p>. You feel her shudder, ever so slightly, but just as she's on the verge of reviving, you ";
text += "pull back your hands.</p>";
text += "You return to thrusting into her, going fast and furious as your pleasure climbs steadily ";
text += "towards climax. Only when you're bursting over the threshold of orgasm to you lay your";
text += " hands on";
/* GarName */
text += "again, grabbing her ass and giving one last massive thrust into her, shoving your";
/* cockDescript[0] */
text += "<p>in to the hilt. You cum inside her just as she awakens, moaning lustily into her ear as s";
text += "punk drizzles out around your member.</p>";
text += "&quot;M-Master?&quot;";
/* GarName */
text += "gasps, giving a full-body shudder as you slowly pull out from inside her. Your cum drools";
text += " out of he snatch and pools beneath her. Playfully, you jam your fingers up between he";
text += "r legs, damming your sperm inside her. To your glee, this simple act sends";
/* GarName */
text += "<p>right over the edge: convulsing, she collapses on the floor with a heavy THUNK!.</p>";
text += "<p>You give the gargoyle a little pat on the head for a job well done before heading on out.</p>";
text += "<b>Use Her";
/* Female */
text += "<p></b></p>";
text += "You casually strip out of your";
/* armorName */
text += "<p>and start to tease your cunt as you circle around the crouching gargoyle. You lament her ";
text += "lack of male genitalia, but that will by no means stop you from sating your lust on th";
text += "e gargoyle. You grab her tail, itself only just flexible enough to reposition thanks t";
text += "o her rigor-mortis-like state, and bend its tip to face straight up.</p>";
text += "<p>With a harsh squeeze, the heavy stone spikes on the tip of her tail retract, leaving her t";
text += "ail as unnaturally smooth as the rest of her. You adjust her tail to just the right he";
text += "ight for you, and slide down onto her. It's easy going, thanks to her tail's sculpted ";
text += "smoothness, and soon you're bottomed out deep enough to feel the pointed tip trying to";
text += " force its way into your womb. You moan lewdly as you buck your hips on her appendage,";
text += " starting to ride it like a big, fat cock.</p>";
text += "Completely insensate,";
/* GarName */
text += "<p>remains in her low crouch ahead of you, not so much as breathing. Still, she stretches yo";
text += "u nice and wide as your bounce on her tail, spearing yourself over and over again on h";
text += "er smooth appendage. By way of reward, you reach forward and slip a few fingers into h";
text += "er cool, tight cunny. She can't respond as such, but you're confident she can still fe";
text += "el you sliding your fingers inside her, pushing in for each bounce you make atop her m";
text += "eaty tail.</p>";
text += "You're pleased to note that the gargoyle's tail is now dark and wet thanks to the liberal ";
text += "streams of lubricant pouring from your";
/* vaginaDescript */
text += ". Now you're practically sliding on";
/* [GarName] */
text += "'s tail, riding toward inevitable orgasm. You cum at the apex of a bounce, slamming yourse";
text += "lf down hard upon";
/* GarName */
text += "<p>'s tail until her tip breaches the entrance to your womb. You scream in ecstasy, squirting";
text += " your girl-cum freely onto the gargoyle's tail, back, and legs until you're completely";
text += " and utterly spent.</p>";
text += "Contented, you spend a few minutes recovering before slowly dressing back up into your";
/* armorName */
text += ". You head on out, making sure to give";
/* GarName */
text += "<p>a little pat on the head on your way out.</p>";
text += "<b>Ritual";
/* First Time */
text += "<p></b></p>";
text += "You note that the sanctuary's altar has been cleared of rubble, and a number of candles ha";
text += "ve been lit upon it. Resting atop the flat stone surface is a simple iron bowl filled ";
text += "with what appears to be water. Curious, you ask";
/* GarName */
text += "<p>what she's been up to.</p>";
text += "&quot;Long before Master came, I watched over the parishioners and their faith. They performed ";
text += "strange sacraments and rituals to purify the body and dispel evils.";
/* if Confidence <50: "Forgive my impertinence, but" */
text += "<p>I thought perhaps Master might some day have need of these rites, and prepared them for y";
text += "ou. I know a ritual to purify the body, another to purify the mind, and a third that b";
text += "anishes evil creatures and spirits, though I warn you: cleansing the body can best be ";
text += "done through pain, and banishment may be as... invasive... as the possession itself. D";
text += "oes Master have need of these?&quot;</p>";
/* Display Options: [Body] [Mind] [Banish [only with Exgartuan or Worms]] and [Leave] */
text += "<b>Ritual";
/* Any after First */
text += "<p></b></p>";
text += "You walk to the church's alter, shortly followed by";
/* GarName */
text += "<p>. You ask her if she's still able to perform the church's Rituals, to which she replies &quot;O";
text += "f course, Master. Do you have need of one?&quot;</p>";
/* Display Options: [Body] [Mind] [Banish [only with Exgartuan or Worms]] and [Leave] */
text += "<p><b>Body</b></p>";
/* PC decreases Libido and Sensitivity. Suffers 20% Max HP damage, to a minimum of 1 pt. remaining */
text += "You tell";
/* GarName */
text += "that you could stand to reverse some of the corruption that has affected your body. With ";
text += "an solemn nod, she takes you to a side alcove near the altar and instructs you to spre";
text += "ad your arms and legs. Hesitantly, you do so, and from the floor and ceiling";
/* GarName */
text += "<p>produces leather straps with rough looped straps. Before you can react, she binds your ar";
text += "ms and legs, spreading you eagle against the cold stone wall.</p>";
text += "&quot;With pain comes purity,&quot;";
/* GarName */
text += "<p>says, so quietly you can barely hear her. &quot;Prepare yourself, Master,&quot; she adds, and your ";
text += "heart nearly skips a beat when you hear the crack of a whip behind you. Oh, shit, this";
text += " is going to hu--CRACK! You see stars as white-hot pain arcs through your body, making";
text += " you scream into the wall. You can feel the burning streak left across your back by th";
text += "e bullwhip, throbbing mercilessly in the moments before CRACK! She hits you again, thr";
text += "owing you forward against your bonds with the force of the blow.</p>";
text += "Over your ragged, pained breathing, you can just hear";
/* GarName */
text += "<p>chanting: &quot;With pain comes purity CRACK! With agony comes enlightenment CRACK! Through to";
text += "rment comes Holiness&quot;</p>";
text += "CRACK! The last crack of the whip leaves your groaning, breathless, sagging in your bonds.";
text += " Somehow, though, you do feel... Cleaner? Like a weight was just lifted from your hear";
text += "t. And you know you're going to be thicker-skinned after that! Quietly, reservedly,";
/* GarName */
text += "<p>releases you from your bonds, and you stagger into her waiting arms. She helps you over t";
text += "o the altar and lays you down, letting you rest after your ordeal. She stands over you";
text += ", watching you pant and gasp. You suppose you could get some vengeance for her brutali";
text += "ty – or you could be kind. What do you do?</p>";
/* Display options: [Nothing] [Revenge] and [Cuddle] */
text += "<p><b>Nothing</b></p>";
text += "You simply lie still and try to recover from";
/* GarName */
text += "<p>'s &quot;gentle ministrations. &quot; After a few minutes, you've caught your breath and, gathering ";
text += "your possessions, make your way out of the Cathedral without another word. Damn, you'r";
text += "e sore.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Revenge</b></p>";
/* Confidence -5 */
text += "Seeing";
/* GarName */
text += "just standing over you, gloating, causes you to sneer and lash out. You strike her dead-c";
text += "enter in the chest, throwing her back against the tree-idol at the church's head. She ";
text += "slumps to the floor, looking meekly away from you. While she's stunned, you gather you";
text += "r";
/* armorName */
text += "<p>and stagger out of the Cathedral.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Cuddle</b></p>";
/* Confidence +5 */
text += "Despite the pain she's caused you, you know";
/* GarName */
text += "<p>did it at your command – and hell, it could only have helped you. Before she can react, y";
text += "ou reach up and pull the gray gargoyle down into a kiss, pressing firmly against her s";
text += "oft, cold lips. She makes a cute little gasp, but soon relaxes into your hold, allowin";
text += "g you to shift her weight so that she's nearly lying atop you. You sigh contentedly an";
text += "d wrap your gargoyle in a tight hug, holding her close for the few minutes it takes yo";
text += "u to recover. When you're feeling up to it, you rustle her hair and thank her for her.";
text += ".. gentle ministrations. If she could blush, you're sure she would be as she looks upo";
text += "n you with gleaming fiery eyes. You gather your belongings and exit the Cathedral.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>&quot;Mind&quot;</b></p>";
/* PC Decreases Corruption and Lust, increases Intelligence */
text += "You tell";
/* GarName */
text += "that you've been plagued with dirty thoughts, and would like to undo some of the corrupti";
text += "on that's spread to your mind.";
/* GarName */
text += "<p>nods respectfully and tells you to kneel before the altar. You do so, assuming a low, sup";
text += "plicating stance before the tree-idol at the Cathedral's head as the gargoyle picks up";
text += " the bowl of water and raises it on high.</p>";
text += "&quot;Blessed is s/he who seeks purity,&quot; she says, closing her eyes and bowing her head, &quot;Bless";
text += "ed is s/he who seeks wisdom; and blessed is s/he who lusts after holiness and virtue b";
text += "efore pleasures of the flesh. &quot;";
/* If Marae has been purified: "Maybe your eyes deceive you, but for an instant you could swear you see a pillar of light descending from on high, touching the small bowl as [GarName] finishes the invocation. " else: "[GarName] brings the invocation to a quiet close, and rests the bowl back upon the altar. " */
text += "<p>&quot;Drink of this, Master,&quot; she says, offering you the bowl, &quot;and be healed of mind. &quot;</p>";
text += "You do so, taking a long drought of the holy water. By the time you've set the bowl down, ";
text += "you feel light-headed, as if a fog has receded from your mind. You gasp happily, able ";
text += "to think more clearly than you have in days. You thank";
/* GarName */
text += "<p>, give her a pat on the head, and head back to camp with a skip in your step.</p>";
text += "<p><b>Banishment</b></p>";
/* PC is cleared of Worms and/or Exgartuan */
text += "Talking about";
/* GarName */
text += "'s rituals, you explain that you seem to have picked up a/some hitchhikers";
/* s */
text += "in your travels, and would like to rid yourself of them. She tells you to strip and brace";
text += " yourself against the altar; &quot;Unfortunately, as you have been invaded, so too is this ";
text += "a very... invasive ritual. &quot; You nod your assent – you really want to get these/this b";
text += "astard";
/* s */
text += "<p>out of your system.</p>";
text += "From beneath the altar,";
/* GarName */
text += "withdraws what looks like a perfectly cylindrical dildo, covered with dozens of dark, dim";
text += "ly-glowing blue runes. Slowly, she makes her way around you and kneels behind your";
/* buttDescript */
text += "<p>. &quot;Take a deep breath, Master, and relax yourself. It will be better this way. &quot;</p>";
text += "You try your best to relax yourself, though as soon as you make any headway, you feel an i";
text += "ntense, invasive pressure against your";
/* assholeDescript */
text += "<p>. You take a deep breath, grit your teeth, and force yourself to relax. The smooth holy ro";
text += "d slips in, forcing its way inexorably into your anus. You feel a burning sensation be";
text += "gin to spread throughout your body, creeping outward from your asshole like little ten";
text += "drils of fire.</p>";
text += "&quot;Do not worry, Master,&quot;";
/* GarName */
text += "says";
/* with Confidence >=50: "soothingly, using her free hand to stroke your thighs. " */
text += "<p>&quot;The pain is necessary. Everything will be alright. &quot;</p>";
text += "Still, you can't help but hiss in agony as the holy burn spreads through you, seeping into";
text += " your vulnerable gentials and sensitive";
/* breastDescript[0] */
text += ".";
/* with Worms: "Gratifyingly, however, you can feel the infestation within you squirming and writhing, desperately seeking escape. " with Exgartuan: "Booming from within you, you hear the demon's voice: "Hey! What the shit is this!? What're you doing? Fucking stop you ingrate!" */
text += "Suddenly, the holy rod jammed up your";
/* assholeDescript */
text += "makes a loud hissing sound, and withdraws. Panting, you collapse to the ground, gripping ";
text += "your gut. It's over, and you feel... Alone. The creature/s within you have been absorb";
text += "ed and purged by the rod, which";
/* GarName */
text += "<p>proceeds to chuck out a window. Hopefully she has more, in case you ever get infested/pos";
text += "sessed again.</p>";
text += "Still panting and gasping from your ordeal, you notice";
/* GarName */
text += "<p>looming over you, smiling. You could be a dick for all that pain she caused you, or thank";
text += " her for helping you.</p>";
/* Display options: [Nothing] [Revenge] and [Cuddle] */
text += "<p><b>Nothing</b></p>";
text += "You simply lie still and try to recover from";
/* GarName */
text += "<p>'s &quot;gentle ministrations. &quot; After a few minutes, you've caught your breath and, gathering ";
text += "your possessions, make your way out of the Cathedral without another word. Damn, you'r";
text += "e sore.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Revenge</b></p>";
/* Confidence -5 */
text += "Seeing";
/* GarName */
text += "just standing over you, gloating, causes you to sneer and lash out. You strike her dead-c";
text += "enter in the chest, throwing her back against the tree-idol at the church's head. She ";
text += "slumps to the floor, looking meekly away from you. While she's stunned, you gather you";
text += "r";
/* armorName */
text += "<p>and stagger out of the Cathedral.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Cuddle</b></p>";
/* Confidence +5 */
text += "Despite the pain she's caused you, you know";
/* GarName */
text += "<p>did it at your command – and hell, it could only have helped you. Before she can react, y";
text += "ou reach up and pull the gray gargoyle down into your lap, hugging her around the wais";
text += "t and putting a quick kiss into the nape of her neck. Giggling, she wraps her tail aro";
text += "und you, giving you a gentle squeeze as she nuzzles into your chest. You stay like tha";
text += "t for a few minutes, cuddling the cute gargoyle, but eventually you know you need to c";
text += "heck on things back at camp. When you're feeling up to it, you rustle her hair and tha";
text += "nk her for her... gentle ministrations. If she could blush, you're sure she would be a";
text += "s she looks upon you with gleaming fiery eyes. You gather your belongings and exit the";
text += " Cathedral.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<b>Kinky Rituals";
/* First Time */
text += "<p></b></p>";
/* While Confidence 70+ */
text += "You broach the subject of rituals to your gargoyle and are met with a surprisingly coy smi";
text += "le from her. You ask her what's on her mind, to which";
/* GarName */
text += "<p>chuckles and says, &quot;I've been thinking, Master. If you so desire, it may be possible to..";
text += ". enhance... the rituals that I've been using. &quot;</p>";
text += "<p>You ask her exactly what she has in mind.</p>";
text += "<p>&quot;The last Master was obsessed with pleasures of the flesh, and when she learned I was able";
text += " to perform spiritual rituals, designed corrupted versions of them to fit her tastes. ";
text += "If you'll allow it, I believe I can strike a middle-ground – making the rituals more p";
text += "leasurable to us both, without the corrupting influence. Would master be interested in";
text += " attempting one with me?&quot;</p>";
/* Display Options: [Body] [Mind] [Banish [only with Exgartuan or Worms]] and [Leave] */
text += "<b>Kinky Rituals";
/* Any after First */
text += "<p></b></p>";
/* While Confidence 70+ */
text += "You walk to the church's alter, shortly followed by";
/* GarName */
text += "<p>. You tell her you need one of her holy rituals, but that you'd prefer to have some fun as";
text += " well. Grinning, she says, &quot;It would be my pleasure, my Master. What shall we do?&quot;</p>";
/* Display Options: [Body] [Mind] [Banish [only with Exgartuan or Worms]] and [Leave] */
text += "<p><b>Body</b></p>";
/* Confidence +2 */
/* PC decreases Libido and Sensitivity. Suffers 20% Max HP damage, to a minimum of 1 pt. remaining */
text += "You tell";
/* GarName */
text += "<p>that you could stand to reverse some of the corruption that has affected your body. With ";
text += "an eager nod, she strips you down, takes you to a side alcove near the altar and instr";
text += "ucts you to spread your arms and legs. Putting your trust in your little gargoyle, you";
text += " do so, allowing her to bind you spread-eagle with long leather straps.</p>";
text += "You watch over your shoulder as she retrieves a small riding crop from her altar and, givi";
text += "ng it an experimental crack in her palm, saunters back over to you. Still grinning, sh";
text += "e presses herself up against your bare back, cupping your";
/* breastDescript */
text += "in her cold stone hands. Your";
/* nippleDescript */
text += "<p>go rock hard from her cold touch, and you shudder as she gently nips your earType and dra";
text += "gs the length of the crop along your thighs.</p>";
text += "&quot;You've been a very naughty boy/girl, to have a body so warped,&quot; she says, again running t";
text += "he crop along your incredibly sensitive inner thighs, making you tremble with the sens";
text += "ation. You're acutely aware of her large, soft breasts pressing into your sweat-slick ";
text += "back. Huskily,";
/* GarName */
text += "<p>whispers, &quot;Don't worry, Master. I'll take good care of you... &quot; CRACK! She lays on with t";
text += "he crop, a short, stinging stoke across your thigh. You gasp, as much in pleasure as i";
text += "n pain, still reveling in the sensation of her embrace.</p>";
text += "As if reading your thoughts, she releases you and steps back, giving herself room for anot";
text += "her CRACK! She leaves a mark on your back this time, and you gasp at the sting of her ";
text += "crop. But not a second later, she's up against you, her long, cool tongue running acro";
text += "ss the red streak she's left upon you. She leans back and makes a tsk sound, patting y";
text += "our";
/* buttDescript */
text += "<p>. &quot;With pain comes purity,&quot; she whispers, rising to nestle her chin in your neck. &quot;With ag";
text += "ony comes enlightenment. CRACK! She gives you a swat right on the ass, making you gasp";
text += " – before you can close your mouth, she locks you in a deep kiss, easily slipping her ";
text += "long, slender tongue into your mouth.</p>";
text += "She plays easily within you, running her cool appendage over your own tongue, letting it s";
text += "lide across your teeth and cheeks as she slides a hand down to your";
/* if Male/Herm: [cockDescript[0]]; if Female: [vaginaDescript[]]; if Genderless: "barren crotch" */
text += ". She breaks the kiss and steps back, laying on one last time – CRACK! with the crop, stin";
text += "ging you again with an intense mix of pain and pleasure. Gasping and panting from stim";
text += "ulation, you nearly collapse when";
/* GarName */
text += "<p>unbinds you, though she's quick to catch you before you fall.</p>";
text += "She guides you over to the altar and helps you lie atop it to rest. Once you're comfortabl";
text += "y situated,";
/* GarName */
text += "slips up beside you, resting her cheek on between your";
/* breastDescript */
text += "<p>. Already, you feel more thick-skinned and less lusty, and so give an appreciative grin to";
text += " your cute little gargoyle. In response, she nuzzles against you and wraps her bat-lik";
text += "e wings protectively around the two of you.</p>";
text += "You spend a few minutes cuddling with";
/* GarName */
text += "<p>, but sadly, you know you can't leave your camp unattended for too long. Giving her a pat ";
text += "on the head and a kiss on the brow, you gather up your clothes and head on back to cam";
text += "p.</p>";
text += "<p><b>Mind</b></p>";
/* Confidence +2 */
/* PC Decreases Corruption and Lust, increases Intelligence */
text += "You tell";
/* GarName */
text += "that you've been plagued with dirty thoughts, and would like to undo some of the corrupti";
text += "on that's spread to your mind. With a deep nod conveying both a respect for your choic";
text += "e an an eagerness to engage in the ritual,";
/* GarName */
text += "<p>tells you to kneel before the altar. You do so, assuming a low, supplicating stance befor";
text += "e the tree-idol at the Cathedral's head as the gargoyle clears off the altar save for ";
text += "the humble bowl of water.</p>";
/* GarName */
text += "lifts herself to perch atop the alter with a single beat of her wings, coming to rest cro";
text += "ss-legged before you. Grinning a sexy grin, she picks up the small waterbasin and lift";
text += "s up up to her lips, taking a small drink of it. &quot;Blessed is s/he who seeks the pure,&quot;";
text += " she begins to chant, lowering the bowl from her thin lips. As she does so, she slowly";
text += " raises her left leg, resting her toes upon your chin. Locking eyes with you,";
/* GarName */
text += "<p>lowers the basin to her thigh and begins to pour, letting the water trickle sensually dow";
text += "n her stone-smooth leg. &quot;Blessed is s/he who seeks wisdom,&quot; she purrs as you instincti";
text += "vely open your mouth, allowing the holy water to trickle in from her foot.</p>";
/* GarName */
text += "<p>quickly slips her small toes into your mouth, letting you suckle the holy water from them";
text += " like an infant. She lets you remain like that for nearly a minute, nursing from the r";
text += "ivulets that come your way, before pulling her leg back and taking your head with it. ";
text += "She leans backwards as you approach, balancing upon her bat-like wings as she finishes";
text += " the chant: &quot;And blessed is s/he who lusts after holiness and virtue before pleasures ";
text += "of the flesh. &quot; She pours from the basin once again, releasing the holy water directly";
text += " onto the large, shapely mounds of her breasts. The water runs down her chest and bell";
text += "y, creating a tiny waterfall over the nub of her clitoris to which she guides you.</p>";
text += "You do as she so obviously wishes, and spread her legs to get a good look at her now-soppi";
text += "ng wet slit. Her vagina seems small, but an experimental touch proves it to be quite m";
text += "alleable – and your single touch causes";
/* GarName */
text += "<p>to arch her back,gasping with the sudden pleasure. Smiling at the adorable, enraptured lo";
text += "ok on her face, you start lapping with a vengeance, grasping her thighs and burying yo";
text += "ur face between her legs. You flick your tongue into her smooth, cool slit, lapping up";
text += " a few drops of water with each flick of your dexterous tongue, and eliciting a gasp o";
text += "r moan each time.</p>";
text += "Soon,";
/* GarName */
text += "is clutching at her breasts and quickly fingering her cherry-nub clit as you lick her out";
text += ", trying her best to keep an even rhythm with you, even as the waterfall comes to an e";
text += "nd and you begin to feel light-headed, as if a fog has lifted from your mind. By way o";
text += "f thanks, you redouble your efforts to pleasure her, ramming your tongue into her dept";
text += "hs and fucking her mercilessly. Quickly, she begins to tense, stopping her own actions";
text += " to grasp at your";
/* hairDescript */
text += "<p>and shove your face further into her crotch, locking her legs and tail around your back a";
text += "s she approaches orgasm.</p>";
text += "Screaming,";
/* GarName */
text += "<p>arches her back and thrusts out her bat-wings to their full expanse, clamping down on you";
text += "r tongue as she cums. You slow your pace, giving her a last few licks as she pants and";
text += " gasps and moans, slowly coming down from an orgasmic high. She collapses backwards, c";
text += "lutching her chest and staring into the rafters. Chuckling, you stand and give her a p";
text += "leased pat on the inner thigh, letting her know she did a good job for you. You leave ";
text += "her smiling atop the altar, slowly getting her breath under control.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Banish</b></p>";
/* Confidence +2 */
/* PC is cleared of Worms and/or Exgartuan */
text += "You explain to";
/* GarName */
text += "that you seem to have picked up some/a hitchhiker";
/* s */
text += "in your travels, and you're tired of";
/* it/them */
text += ". She gives you an understanding nod and tells you to strip. As you do so, she dips beneat";
text += "h the altar, reappearing with what a silver, blue-rune covered rod nestled into what l";
text += "ooks like a leather thong.";
/* GarName */
text += "<p>slips the thong on, letting a slight gasp escape her lips as the inner end of the rod ent";
text += "ers her.</p>";
text += "She gives the shaft of the strap-on a few experimental strokes and, satisfied, says, &quot;I've";
text += " turned down the power of the runes, so it will not hurt you so much. Though it will t";
text += "ake longer than normal. I suggest you lubricate it, Master. &quot; Smiling, she sits hersel";
text += "f atop the alter and presents her silver &quot;cock&quot; to you. You kneel and slip your face b";
text += "etween her spread legs, giving the rod a quick lick. Its incredibly smooth and quite c";
text += "old, much like its wearer, but your tongue comes away with a warm tingle spreading thr";
text += "ough it – not pain, but more like numbness. You take the rod into your mouth, running ";
text += "your tongue across its length and thrusting your face against it, blowing it like a co";
text += "ck while getting it sopping wet with your saliva. You've only been at it for a minute ";
text += "when you notice";
/* GarName */
text += "<p>is bucking her hips slightly and moaning quietly, obviously getting more than a little en";
text += "joyment from the sensation. Perhaps she can feel through it, like a real dick? Grinnin";
text += "g, you redouble your efforts to suck her off.</p>";
text += "&quot;Enough, Master,&quot; she gasps, pushing you back. Breathing heavily, she takes you by the han";
text += "d and gets you to brace yourself against the altar. Your entire mouth is numb, now, ti";
text += "ngling from the strange sensation given off by the holy rod-cock.";
/* GarName */
text += "slips behind you, putting a cool, soft hand on your";
/* hipDescript */
text += "as she lines up for penetration. You grip down hard on the edge of the altar, and try you";
text += "r best to relax your sphincter as you begin to feel a tingling pressure against your b";
text += "ack door.";
/* If PC has high Anal Wetness/Buttslut perk: "She slips in easy, sliding her tingling holy rod into your until her hips are pressed against your [buttDescript]" else: "She slowly but surely coaxes the holy rod into your asshole, making long and slow thrusts into you until she finally bottoms out. " */
text += "With her rod firmly inside you,";
/* GarName */
text += "put her hands on your";
/* hipDescript */
text += "for leverage and begins to pull out again, leaving a hot, intense tingling sensation in y";
text += "our rectum. She thrusts in, this time much more quickly than you were expecting, makin";
text += "g you gasp and moan as her hips slam into yours.";
/* If PC has Worms: "You can feel her cock ram against your prostate, and shudder as the writhing mass of worms begin to panic as her cock pushes against them, obviously causing the creatures great pain. " */
text += "";
/* GarName */
text += "begins to fuck you in earnest, hammering your";
/* assholeDescript */
text += "with the strap-on until you're both panting and gasping, nearly overwhelmed by sensation.";
text += "";
/* If PC has Exgartuan: "You can hear the demonic voice of Exgartuan inside your mind, yelling and cursing as he is rapidly drained from your body and sealed into the holy rod within you. " */
/* If PC has a cock: "[GarName] suddenly releases your hips and, pressing her soft breasts into your sweat-slicked back, grabs your [cockDescript[0]] in her cold hand. . You let out a little gasp as she begins to jerk you off, rapidly pistoning your cock as she continues to pound your ass. Between the dual stimulation, you feel a pressure begin to swell up inside your abused prostate, a tell-tale sign of orgasm. She gives you a last few thrusts before you cum, splattering the altar with thick ropes of cum as you both yell in ecstasy. " */
/* Else: "[GarName] reaches the peak of her speed, utterly reaming you as [the worms are / Exgartuan is] sucked from your body. Suddenly, she leans in and presses her lips to yours, thrusting her tongue against yours, letting you feel her begin to convulse and shake with release. Cupping her cheek, you return the kiss with gusto, willing yourself toward an anal orgasm. Within moments, the incredible tingling and the rapid ass-fucking combine toward your own climax, and you squeeze down hard upon the rod inside you as you cum, shaking and shuddering in the gargoyle's grasp. " */
text += "Suddenly, the holy rod jammed up your";
/* assholeDescript */
text += "makes a loud hissing sound, and withdraws. Panting, you collapse to the ground, gripping ";
text += "your gut. It's over, and though a part of you feels suddenly very empty, it's soon for";
text += "gotten as";
/* GarName */
text += "<p>slips down beside you, having already tossed the holy rod out the window. The creature/s ";
text += "within you have been absorbed and purged by the rod; and you can't help but hope she h";
text += "as more... just in case.</p>";
text += "Still panting and gasping from your ordeal, you slip an arm around";
/* GarName */
text += "<p>'s shoulders, bringing her into a tight embrace. Smiling cutely, she nuzzles her cheek aga";
text += "inst your chest, and winds her large bat-wings around the two of you, wrapping you tog";
text += "ether. You give her a long, tender kiss on the brow, and let her remain like that for ";
text += "a good long while, basking in each others' presence.</p>";
text += "Eventually, though, you know you need to get back to camp. You try to tell";
/* GarName */
text += "<p>, but to your surprise, she's fast asleep, snoring softly. With a grin, you untangle yours";
text += "elf from her embrace and find something to cover her with before giving her another ki";
text += "ss and making your way home.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Talk</b></p>";
text += "You take a seat on one of the sanctuary's pews, motioning for";
/* GarName */
text += "to join you.";
/* If Confidence <50: "She meekly approaches her Master and kneels before you, head bowed submissively. " if Confidence = 51-69: "She nearly skips to follow you, assuming her low crouch at your feet and looking up at your expectantly. " if Confidence = 70-100: "Happily, she takes a seat beside you and slips an arm around your shoulders, locking you in companionable closeness. " */
text += "<p>You tell her you'd like to talk for a few minutes, which immediately causes her eyes to b";
text += "righten excitedly. &quot;Master honors me... What would you like to talk about?&quot;</p>";
/* Display Options: [History] [Cathedral] [GarName] [Leave] */
/* Whenever the player selects a topic, play one of the following dialogue scenes then return the PC to the main interaction menu and increase Confidence by +2, unless noted otherwise. Once a scene has been played, it will not play again. Once all three in a topic are played, it closes. */
text += "<p><b>History A</b></p>";
text += "You ask";
/* GarName */
text += "<p>what she can tell you about the history of Mareth. She shrugs lightly. &quot;I can't tell you ";
text += "much, Master. I've spent my entire life on these grounds. Most of what I know was doct";
text += "rine taught by the church. Is that acceptable?&quot;</p>";
text += "<p>You tell her that, sure, you'd like to hear it. &quot;The church-folk believe – believed – that";
text += " the goddess Marae created intelligent life here many generations ago, long before the";
text += " demons came. She was the highest goddess amongst many, an embodiment of the natural w";
text += "orld. She brought forth the animal-morphs who created this cathedral in her honor. Usi";
text += "ng magical knowledge, the priests of this church sought to mirror Marae's power, creat";
text += "ing creatures such as myself. Eventually, though, the demons came, I know not from whe";
text += "re, and began to spread their corruption. The priests... Tried to resist... t-to ward ";
text += "against... I'm sorry, Master,&quot; she says, sniffling. You notice that she's turned away ";
text += "from you, trying to hide her shame. &quot;I don't want to think about this anymore. Please,";
text += "&quot; she begs. The memory of her failure to protect the people of the church still weighs";
text += " heavily upon her. You suppose you could berate her for her emotionality, or try and c";
text += "omfort her.</p>";
/* Display Options: [Berate] and [Comfort] */
text += "<p><b>Berate</b></p>";
/* Confidence -5 */
text += "You give";
/* GarName */
text += "<p>a none-to-gentle swat on the head, and tell her off for presuming to refuse you informati";
text += "on. The harshness of your voice only causes her to sob openly, however, and recoil awa";
text += "y from you before you can hit her. You sigh with frustration, and storm out of the cat";
text += "hedral before you have to listen to a moment more of your servant's cries.</p>";
/* Return PC to camp, advance time 1 hour. */
text += "<p><b>Comfort</b></p>";
/* Confidence +3 */
text += "You sigh and reach over to";
/* GarName */
text += ";";
/* if Confidence <50: "she recoils, but" */
text += "you cup her cheek, and turn her to face you. If she could produce tears, you're sure they";
text += "'d be streaming down her cheeks. You give her your most reassuring smile and lean in t";
text += "o give her a quick kiss on the brow. She gasps, but before you know it has leapt into ";
text += "your lap and has buried her face into your chest, holding onto you as if for dear life";
text += ". You put your arms around her and hold her close while she cries, spending the next f";
text += "ew minutes either whispering reassurances to her or stroking her back and hair. Eventu";
text += "ally, she calms down. Ever so shyly,";
/* GarName */
text += "<p>returns the kiss you'd given her. &quot;I'm sorry, Master,&quot; she whispers, curling up beside yo";
text += "u. &quot;I should have been strong enough to protect my people. I know that. That it's my f";
text += "ault they've all been dragged off to some unholy carnal pit. I just... &quot; You stop her ";
text += "before she can go on and tell her that no, it wasn't her fault. She couldn't have done";
text += " anything to stop it. She tries to give you a brave smile and says, &quot;I know. Can we...";
text += " Talk about something else, Master?&quot;</p>";
/* Return PC to the Talk menu */
text += "<p><b>History B</b></p>";
text += "You ask";
/* GarName */
text += "to tell you a little bit about the demons coming to Mareth";
/* if Confidence >=70: "if she's up to it. " */
text += "Hesitantly, she nods her assent, though she says, &quot;I'm sorry, Master, but I must warn you";
text += ": I was greatly abused by the demons. They are responsible for everything that is wron";
text += "g with my world";
/* if Confidence >70: ", and I despise them with every fiber of my being. " */
text += "<p>I may not be the most fair nor most balanced source of information. &quot;</p>";
text += "<p>You tell her that's fine. She steels herself, then begins to speak: &quot;The demons arrived de";
text += "cades ago. I can't remember how long, exactly; I spent most of that time chained and d";
text += "ormant until you found me, and time blurred. When they arrived, it was like a tidal wa";
text += "ve of corruption... They swept down from the mountains and stormed through the fields.";
text += " They took the world by surprise, capturing. . capturing much of it in short order. Th";
text += "ere was little the people could do to stop them. Some people fled, some people died, m";
text += "any more were captured and turned into-into sex toys o-or worse... &quot; she trails off, s";
text += "haking visibly. The memory must be horrible for her. &quot;I'm sorry, Master. It's just... ";
text += "Those corrupt monsters came here near the end of the first year. We'd held off so long";
text += "... But it wasn't enough. &quot; She falls silent, looking shamefully away. You suppose tha";
text += "t's all you'll get out of her for now.</p>";
text += "<p><b>History C</b></p>";
/* If PC has neither Marble nor Izma as a follower */
text += "You ask";
/* GarName */
text += "<p>to tell you a little bit about the world of Mareth. Giving it a few moments of quiet thou";
text += "ght, she answers: &quot;I do not have any experience outside of the church grounds, Master,";
text += " but I remember the words of the last Master, and the parishioners before her. There a";
text += "re... The world has a vast expanse of plains and woodlands, broken up by a great mount";
text += "ain range. There is a lake not far from here, if I recall... &quot; she goes on to tell you";
text += " able some of the more common Marethian monsters, though she's short on details except";
text += " about those that regularly bother the church – imps and goblins, mostly. You thank he";
text += "r for the talk and turn toward another subject...</p>";
/* If PC has Marble as a follower */
text += "You ask";
/* GarName */
text += "<p>to tell you a little bit about the world of Mareth. Giving it a few moments of quiet thou";
text += "ght, she answers: &quot;I do not have any experience outside of the church grounds, Master,";
text += " but I remember the words of the last Master, and the parishioners before her. I belie";
text += "ve there is a lake not far from here. Beyond that, the world has a vast expanse of pla";
text += "ins and woodlands, broken up by a great mountain range – strange monsters live there, ";
text += "but worst of all are savage bull-like beasts called Minotaurs. And the cow-girls... La";
text += "cta-Bovines, I think they're called, who're just as nasty. &quot;</p>";
text += "You cut";
/* GarName */
text += "<p>off right there, and explain that one of those 'savage beasts' is your lover, Marble, who";
text += "'s really quite sweet. The gargoyle makes a horrified gasp and covers her mouth. &quot;I'm ";
text += "so sorry, Master! I didn't know... All I'd heard were stories, years ago. I didn't mea";
text += "n... But... I-I didn't know Master had a girlfriend,&quot; she whines pitifully. Obviously,";
text += " knowing that she's not your only lady-friend has upset the poor thing.</p>";
text += "Well. What do you say to that: that you're not exclusive with Marble, or that";
/* GarName */
text += "<p>doesn't count, being a statue and all?</p>";
/* Display Options: [Not Exclusive] [Doesn't Count] */
text += "<p><b>Not Exclusive</b></p>";
text += "You run a hand through";
/* GarName */
text += "<p>'s hair and reassure her that being with Marble won't affect the way you interact with her";
text += " – you're more than able to be fond of many girls at once. This doesn't seem to entire";
text += "ly please her, but neither does she throw a tantrum, so you suppose that's good enough";
text += ".</p>";
text += "<p><b>Doesn't Count</b></p>";
/* Confidence -5 */
text += "<p>You scoff and tell her not to worry – it's not like you're cheating on Marble by being aro";
text += "und her, after all. She's just a statue – a toy, really. Her head sinks low, and the l";
text += "ittle gargoyle lets out a shudder that might just have been a sob. You shake your head";
text += " and change the subject.</p>";
/* Return PC to [GarName]'s main menu */
/* If PC has Izma as a follower */
text += "You ask";
/* GarName */
text += "to tell you a little bit about the world of Mareth. Giving it a few moments of quiet thou";
text += "ght, she answers: &quot;I do not have any experience outside of the church grounds, Master,";
text += " but I remember the words of the last Master, and the parishioners before her. There a";
text += "re... The world has a vast expanse of plains and woodlands, broken up by a great mount";
text += "ain range. There is a lake not far from here, if I recall; a race of very dangerous sh";
text += "ark-folk live there. &quot; With a chuckle, you tell";
/* GarName */
text += "<p>that you're more than well aware of that; indeed, you consider one such creature to be yo";
text += "ur mate, your beta. She makes a slight gasp, and gushes out an apology. &quot;I'm so sorry,";
text += " Master! I hadn't realized... I thought... &quot; she falls silent for a moment, then says ";
text += "shyly, &quot;I wasn't aware Master had a girlfriend. &quot; Obviously, knowing that she's not yo";
text += "ur only lady-friend has upset the poor thing.</p>";
text += "<p>Well. What do you say to that: that you're not exclusive with Izma, or that she doesn't co";
text += "unt, being a statue and all?</p>";
/* Display Options: [Not Exclusive] [Doesn't Count] */
text += "<p><b>Not Exclusive</b></p>";
text += "You run a hand through";
/* GarName */
text += "<p>'s hair and reassure her that being with Izma won't affect the way you interact with her –";
text += " you're more than able to be fond of many girls at once. This doesn't seem to entirely";
text += " please her, but neither does she throw a tantrum, so you suppose that's good enough.</p>";
text += "<p><b>Doesn't Count</b></p>";
/* Confidence -5 */
text += "<p>You scoff and tell her not to worry – it's not like you're cheating on Izma by being aroun";
text += "d her, after all. She's just a statue – a toy, really. Her head sinks low, and the lit";
text += "tle gargoyle lets out a shudder that might just have been a sob. You shake your head a";
text += "nd change the subject.</p>";
/* Return PC to [GarName]'s main menu */
/* PC has both Marble and Izma as followers */
text += "You ask";
/* GarName */
text += "<p>to tell you a little bit about the world of Mareth. Giving it a few moments of quiet thou";
text += "ght, she answers: &quot;I do not have any experience outside of the church grounds, Master,";
text += " but I remember the words of the last Master, and the parishioners before her. There a";
text += "re... The world has a vast expanse of plains and woodlands, broken up by a mountain ra";
text += "nge and lake. Those last two are populated by savage beasts, minotaurs, cow-girls, ane";
text += "mone, and shark-people, both of whom will rend your flesh or rape you half to death. &quot;";
text += "</p>";
text += "Whoa, there. You stop";
/* GarName */
text += "and explain to her that some of your lovers – mates, even – are just such beasts. You tel";
text += "l her a little bit about Izma and Marble, enforcing the fact that they're both not onl";
text += "y quite friendly, but sweet as well. They're just regular people";
/* if Confidence >50: "just like her" */
text += ". If she could, you're sure";
/* GarName */
text += "<p>would be blushing bright crimson as you educate her on a little inter-special tolerance a";
text += "nd understanding. Chastened, she nods her comprehension when you're finished and, afte";
text += "r a long pause, asks, &quot;I-If Master really has many... girlfriends... does... No, it's ";
text += "silly, of course not... &quot;</p>";
text += "<p>Giving her a pat on the head, you encourage her to speak her mind. Meekly she whimpers, &quot;I";
text += "f master has many girlfriends... What am I?&quot;</p>";
text += "<p>Oh shit. Here we go. You suppose you could dodge the bullet, or you could tell her what yo";
text += "u really think: is she just a slave you wandered into owning, or do you think somethin";
text += "g more of her?</p>";
/* Display Options: [Dodge] [Slave] [Girlfriend] */
text += "<p><b>Dodge</b></p>";
/* Confidence -5 */
text += "You make a shitty joke and laugh awkwardly, trying to avoid the topic altogether.";
/* GarName */
text += "<p>makes a pitiful little sniffle, but takes the hint and falls silent, allowing you to chan";
text += "ge the subject.</p>";
/* Return PC to Talk menu */
text += "<p><b>Slave</b></p>";
/* Confidence -15 */
text += "<p>Well, really, what is she but a slave? She's just a toy when you want sexual release, a se";
text += "rvant to perform rituals at your demand, and a bit of eye-candy besides. She's not eve";
text += "n a real person – not really. You tell her that, quite bluntly. She makes no response,";
text += " verbally at least, but she does give off a sob-like shudder and curl up into a little";
text += " ball where she sits, hiding her face from you.</p>";
text += "<p>Since you've temporarily broken the gargoyle, you mosey on back to camp.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Girlfriend</b></p>";
/* Confidence +15 */
text += "You smile at";
/* GarName */
text += "and tussle her hair. Warmly, you tell her that, if she wants, she can be your girlfriend ";
text += "too. Polyamory is just your thing, you suppose. With a happy gasp, the little gargoyle";
text += " leaps into your lap and wraps her arms around you, hugging you so tight you almost ca";
text += "n't breathe. She gives you a flurry of little kisses all along the neck and cheek befo";
text += "re planting a long, deep one on your lips. You kiss her back, soon laughing amicably a";
text += "s you return her embrace. Once she's calmed down,";
/* GarName */
text += "<p>settles into your lap, resting her cheek against your chest and wrapping her tail and win";
text += "gs lovingly around you. You give her a little peck on the forehead and nuzzle your chi";
text += "n into her hair, content to stay like this forever.</p>";
text += "Yet, you're soon surprised when";
/* GarName */
text += "<p>withdraws slightly from you, though her arms are still hooked about your neck. &quot;Master...";
text += " If you want me to be your girlfriend, then... We should – if you want, Master, of cou";
text += "rse – maybe... Master, will you make love to me?&quot; she blurts, suddenly taken aback by ";
text += "her own forwardness.</p>";
/* Male Display Options: [Vaginal] [Leave] */
/* All Other Display Options: [Strap-on] [Leave] */
/* Use normal sex scenes for above options, as well as Leave options. */
text += "<p><b>Cathedral A</b></p>";
text += "You ask";
/* GarName */
text += "<p>to tell you a little about the Cathedral around you. She visibly brightens at the idea. &quot;";
text += "This is the greatest structure for miles around,&quot; she claims proudly, motioning toward";
text += " the vaulted ceiling and the remaining stained glass windows. &quot;Well, it isn't much to ";
text += "look at now, Master, but it was magnificent. People came from all around to pray here.";
text += " It was wonderful... &quot; she trails off, looking misty-eyed into the distance, rememberi";
text += "ng.</p>";
text += "&quot;Master?&quot; she asks, looking you in the eye. &quot;I... I want to rebuild the Cathedral. I know ";
text += "there... There's no one to return to it, but... I don't know. It feels like repairing ";
text += "the damage that's been done would be a victory. Just a little tiny one, but still a vi";
text += "ctory. &quot;";
/* GarName */
text += "<p>makes a sudden little gasp and says, &quot;I-If that's alright with you, Master?&quot;</p>";
text += "<p>You could tell her it's pointless or encourage her.</p>";
/* Display Options: [Pointless] [Encourage] */
text += "<p><b>Pointless</b></p>";
/* Confidence -2 */
text += "<p>You roll your eyes and try to explain how foolish that is. It's a building in the middle o";
text += "f nowhere; the demons sure as hell don't care about it, especially when there are no p";
text += "eople around to corrupt or enslave. You command her not to waste her time repairing th";
text += "e building any more than is necessary to make it bearable for you when you're there; a";
text += "nything more than that is effort wasted.</p>";
text += "<p>&quot;I... Of course, Master. H-How silly of me. &quot;</p>";
text += "<p>You nod, and change the subject.</p>";
/* Return PC to Talk menu */
text += "<p><b>Encourage</b></p>";
/* Confidence +2 */
text += "You give";
/* GarName */
text += "<p>a pat on the head tell her it's a wonderful idea. She makes a happy squeak and immediatel";
text += "y flutters over to a pile of debris and starts cleaning it up. Before you know it, the";
text += " little gargoyle's on a roll, whistling a jaunty tune as she starts repairing some of ";
text += "the more obvious damage. Seeing her so engrossed, you can't help but smile. You wander";
text += " over and start to give her a hand.</p>";
text += "Within the hour, the two of you have made a sizable dent in the debris of the Cathedral, a";
text += "nd";
/* GarName */
text += "<p>has even managed to hang one of the candelabras back up in the rafters. Exhausted, you sa";
text += "y goodbye to the happy little gargoyle and head on back to camp.</p>";
/* Return PC to camp, advance time 1 hour, +10 fatigue. */
text += "<p><b>Cathedral B</b></p>";
text += "You ask";
/* GarName */
text += "<p>to tell you a little bit more about the religion that called the Cathedral its home. Happ";
text += "ily, this seems to be an engaging topic for the little gargoyle, who eagerly explains:";
text += " &quot;They worshiped a pantheon of gods – the beings that inhabited this world before the ";
text += "animal-morphs were raised up, and long before the demons came. Marae was the chief god";
text += "dess,&quot; she says, nodding to the tree-shaped icon at the head of the sanctuary. &quot;She ta";
text += "ught the people rituals and magics to better their lives, rituals to purify their mind";
text += "s and bodies, and even bestowed upon them a power that is infinitely beyond me: the po";
text += "wer to create life. These gods were creators, raising up the animals of the world to i";
text += "ntelligence, mirroring that of the humans. For that, they were worshiped and... In som";
text += "e cases, imitated. &quot;</p>";
text += "<p>You ask her if she means herself, and she nods. &quot;The high priests of the church created me";
text += " and many others to be their protectors. We were carved of stone and animated by magic";
text += " powerful magic. We were the perfect servants and guardians... And now I'm the only on";
text += "e left. &quot;</p>";
text += "<p>She falls into a deep, melancholy silence. You soon try to change the subject.</p>";
text += "<p><b>Cathedral C</b></p>";
text += "As you sit down with";
/* GarName */
text += "<p>to talk, you remember her words when you first met indicating that she could not – or wou";
text += "ld not – leave the Cathedral, even if you asked her to. You ask her about that.</p>";
text += "&quot;Master,&quot;";
/* GarName */
text += "says, now looking you straight in the eye, &quot;the Cathedral is my home, the only home I've ";
text += "ever known. Even if I could leave, I would not want to";
/* if Confidence >69: "unless it were to be with you, that is" */
text += "<p>. But I am bound to this place, Master. I could not leave even if I wanted to. My makers w";
text += "ere wary of their creation, and chose to bind me here; they thought that if I ever reb";
text += "elled, I would not do much harm if contained within the Cathedral. &quot;</p>";
text += "<p>You ask her if any of the other gargoyles ever rebelled. This causes her to look away quic";
text += "kly, hiding her face. &quot;Yes,&quot; she whispers. &quot;One. When the demons came, a single gargoy";
text += "le saw his chance to escape his fetters and threw open the doors when all the parish w";
text += "as gathered within taking shelter from the attack. They were helpless to resist the de";
text += "mons, no matter how hard the rest of us fought to protect them... . &quot;</p>";
text += "<p>&quot;And,&quot; she whimpers, &quot;I was helpless, too. This holy place became a carnal pit. We were ra";
text += "ped and raped and raped again until even the demons were sated. Then they dragged the ";
text += "villagers away and destroyed the gargoyles. &quot;</p>";
text += "<p>All but her, you're quick to point out. &quot;All but me,&quot; she echoes. &quot;One of the demons took ";
text += "a liking to me, and wanted to keep me as a pet. I suppose I was lucky; the bonds the p";
text += "riests put upon me saved me from being dragged off and abused until the end of days...";
text += " By him, at least. And without them, I never would have met you,&quot; she adds sweetly, on";
text += "ce again looking up at you expectantly. You can see the sadness in her eyes, but also ";
text += "hope.</p>";
text += "<p>You could comfort the little gargoyle, or you could remind her what her of the ramificatio";
text += "ns of her failure.</p>";
/* Display Options: [Comfort] and [Berate] */
text += "<p><b>Comfort</b></p>";
/* Comfort +10 */
text += "You pick";
/* GarName */
text += "<p>up ad wrap her in a tight hug, telling her that's everything's going to be alright and th";
text += "at you're here for her. She makes a happy, girlish squeal and hugs you back, quickly w";
text += "rapping her legs around your waist and planting a kiss on your cheek. You sit back dow";
text += "n, resting her on your lap, and ruffle her hair. She grins and hugs you tighter until ";
text += "you're almost struggling to breathe.</p>";
text += "<p>&quot;Thank you, Master,&quot; she whispers into your ear, giving it a little kiss. &quot;I'll always be ";
text += "here for you, too. I swear it. &quot;</p>";
text += "<p>You spend a few more minutes with your little gargoyle, patting her head and hugging on he";
text += "r. But, eventually, you know it's time to head back to camp. You say your goodbyes and";
text += " head for the door.</p>";
text += "To your surprise,";
/* GarName */
text += "follows you, running to catch up with you. She takes your hand in hers and wraps one of h";
text += "er wings around you as you walk, holding you close as you make your way out the doors ";
text += "and onto the grounds. Soon, though, you see";
/* GarName */
text += "<p>slowing and grimacing – approaching the edge of her boundary. The two of you stop at the ";
text += "wrought-iron fence surrounding the Cathedral, and face each other.</p>";
text += "<p>You realize this is the first time you've ever seen her outside the sanctuary, and proudly";
text += " give her a kiss on the lips at the gate. When you part, she shyly tells you to take c";
text += "are on the way back, and that she'll be here waiting for you when you return.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<p><b>Berate</b></p>";
/* Confidence -10 */
text += "Right. Because becoming a living footstool for you was TOTALLY worth everyone she ever kne";
text += "w being raped out of their minds. You give";
/* GarName */
text += "<p>a hard swat and remind her exactly how moronic she's being. She recoils, shying away from";
text += " you as you stand up and head for the door. Over your shoulder, you tell her you're gl";
text += "ad she's bound here – that way she can't fuck up and get you killed, too.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<b>";
/* GarName */
text += "<p>A</b></p>";
/* Confidence +3 */
text += "Curious about your gargoyle, you ask";
/* GarName */
text += "<p>to tell you a little bit about her life before you arrived. She makes a nervous chuckle a";
text += "t the request, and shyly says, &quot;Master is too kind... I am no one special... &quot;</p>";
text += "You urge her on, adding that you can make it a command if you have to. She fidgets awkward";
text += "ly for a moment, but finally says, &quot;If Master insists. I was sculpted in a village not";
text += " far from here. The high priest ordered me and a dozen others from the finest sculptor";
text += " in the land. We were perfect, in a way. Each of us was unique, complete, made to be a";
text += "s human as you";
/* are/once were */
text += "<p>, Master, and more. We were to be their guardians, protectors – their perfect servants.</p>";
text += "<p>When the demons came... I survived, the others didn't. I was here alone for a while after ";
text += "that. Then, perhaps ten years ago, the last Master came. She came here seeking shelter";
text += " from a great horde of demons; what she found was me, all alone. &quot;</p>";
text += "You ask her to tell you a little about the &quot;last Master. &quot; Hesitantly, she agrees: &quot;Master";
text += " came here seeking refuge. Bound as I was, I could not help but to protect the Cathedr";
text += "al – and her – from the imps that pursued her. She was a sorceress of some skill, howe";
text += "ver, and when I told her of my bonds, she manipulated the magics that control me so th";
text += "at I was forced to serve her. Those same magics are why I am bound to serve you, Maste";
text += "r";
/* if Confidence >69: ", though even were I not compelled to, I would still serve you" she says with a playful wink" */
text += "<p>.</p>";
text += "&quot;When the last Master found me, I was not myself, however. The coming of the demons was st";
text += "ill vivid in my mind; the scars of their abuse weigh heavily upon me even now, yet the";
text += "y were crippling when she bound me. I suppose it could have been worse – I could have ";
text += "been taken by a demon or a true sadist, but my time with her nearly destroyed my mind.";
text += "";
/* If Confidence =<69: "After what she did to me, I cannot enjoy sex; just the thought of it makes me shudder. " else "After what she did to me, I never thought I'd enjoy sex again. " With a loving smile, [GarName] takes your hand in hers and brushes it against her cheek. "But for you, Master, I think I could make an exception. " */
text += "You can't help but ask... What is is that her last Master did that was so awful, that made";
text += " her fear you when you first met her, and now makes her terrified of the most intimate";
text += " of contact.";
/* If Confidence =<69: "I'm sorry, Master, I can't... It hurts too much to think about it. " else "Sorry, Master. I just... Don't want to talk about it right now. Ask me again some time. " */
text += "<p>You consider pressing the issue, but remember that you've been away from camp a bit too lo";
text += "ng. You resolve to ask her next time, and take your leave of the gargoyle.</p>";
/* Return PC to camp, advance time 1 hour */
text += "<b>";
/* GarName */
text += "<p>B</b></p>";
/* Confidence +3 */
text += "Settling in for what could be a long talk, you ask";
/* GarName */
text += "<p>if she's finally ready to tell you about her last Master. She sighs heavily, but with a b";
text += "it of encouragement, she begins to speak: &quot;Master was... an unusual specimen, I should";
text += " think. She was so very beautiful, so very gentle,&quot; the gargoyle says, almost wistfull";
text += "y.</p>";
text += "<p>But her voice changes, hardening into a cold whisper, &quot;And so very cruel. To her, I was a ";
text += "living toy, nothing more than a way to sate her lusts when she desired. And she was sa";
text += "distic, using some sort of shock magic on me if I so much as hesitated at her commands";
text += ". I came to dread her every word, especially her demands for pleasure – she got off on";
text += " pain, I think, and thoroughly enjoyed inflicting it on me. &quot;</p>";
text += "<p>You gently shift the conversation as she trails off, asking her for, say, her master's nam";
text += "e, or appearance. &quot;Ah. Master was a woman, perhaps a hair beneath six feet tall. She w";
text += "as beautiful, in a dark sort of way. It was as if she always had a kind of storm-cloud";
text += " around her. I remember... I remember she had the softest skin. Thick, golden hair tha";
text += "t was so smooth, so... &quot;</p>";
text += "<p>Confused, you have to ask if she's still talking about the same person. &quot;Oh. Yes, I suppos";
text += "e I am. I'm sorry, Master. I just... Looking back, I get confused. I remember the pain";
text += " so well, but there was so much pleasure, too. I hated her, with every fiber of my bei";
text += "ng. But I loved her too. I don't miss her, and I don't dwell on the years I was her to";
text += "y, but some part of me did love her, I think. Yet I do not regret her leaving. &quot;</p>";
text += "You don't need to prompt";
/* GarName */
text += "<p>this time. &quot;She left, perhaps ten years ago. One day I was following orders to Master's p";
text += "leasure, and the next I was bound to my pedestal, wearing the chains that Master broke";
text += " to set me free. &quot;</p>";
text += "<p>While she still hasn't answered the whole of your question, you nod and move on.</p>";
text += "<b>";
/* GarName */
text += "<p>C</b></p>";
/* Confidence +3 */
text += "You ask";
/* GarName */
text += "<p>if she's finally ready to talk to you about what happened to her previous Master, and wha";
text += "t happened to her since. Hesitantly, she agrees to your request. &quot;Master was a dark so";
text += "rceress, gifted with the skill of manipulating the bodies of others, though it caused ";
text += "them incredible pain. I think... Perhaps her fascination with me came from my immutabi";
text += "lity, that she couldn't change my body to her whims through her magic. So she sought t";
text += "o change my mind, breaking my will and shaping me to her desires. &quot; With a rueful smil";
text += "e, she adds, &quot;You could say that she made me the creature I am today. &quot;</p>";
text += "<p>She continues, &quot;After Master had lived here two, maybe there years – all the while experim";
text += "enting and manipulating the monsters that came near – we were eventually visited by a ";
text += "demon. Not an imp or minor monster, but a true demon of great power. An omnibus who fa";
text += "ncied herself a master of magic, who'd heard of Master's skill through the mangled imp";
text += "s that managed to crawl away after Master had had her fun. He challenged her to a duel";
text += " for her magic and her body. Fueled by hubris, she accepted. &quot;</p>";
/* GarName */
text += "<p>pauses in her story, sniffling and wiping the back of her hand across her eye, even thoug";
text += "h she can produce no tears. &quot;I knew what would happen. I tried to tell her. I'd seen w";
text += "hat demons can do, experienced their cruelty firsthand. But I'm not even a person; my ";
text += "opinions don't matter. We both knew that. She even chained me, left me, so that I woul";
text += "d not interfere. And so out she went, all arrogance and bravado.</p>";
text += "<p>&quot;She never stood a chance. Master was obliterated, utterly and completely beaten. The last";
text += " I saw of her, she was being dragged away by the hair, kicking and screaming, begging ";
text += "for my help. But I could do nothing. I was helpless, I was powerless. As always. &quot;</p>";
text += "<p>She falls silent, heaving a heavy, hopeless sigh. You could reassure her that she isn't a ";
text += "helpless non-person, or perhaps you'd be better served by berating her about her emoti";
text += "onal weakness?</p>";
/* Display Options: [Comfort] [Berate] */
text += "<p><b>Comfort</b></p>";
/* Confidence +15 */
text += "You pull";
/* GarName */
text += "<p>onto your lap and run your hand through her hair. You tell her that she's wrong – dead wr";
text += "ong. She is a person, and she is not helpless. She's anything but.</p>";
text += "<p>The little gargoyle curls up on your lap and gives you a shy little smile. &quot;Thank you, Mas";
text += "ter. I-I-I... &quot; she stutters off, visibly trembling. &quot;I wish you were right, Master. I";
text += " really do. But, I'm not. I'm not a person, and I don't have free will. It's a nice dr";
text += "eam, but... &quot;</p>";
text += "<p>You cut her off right there. You COMMAND her to stop thinking like that, telling her that ";
text += "you've never met anyone more human than she it. She does have free will – and someday,";
text += " perhaps she can get it back. But until then, you promise that you would never give he";
text += "r an order that she didn't want to go through with, and that you would never abandon h";
text += "er like her last Master did.</p>";
text += "She smiles weakly, and rests her head on your chest. &quot;As you command, Master,&quot; she says, a";
text += "nd falls silent. You sit there for a long while, stroking the gargoyle's soft hair and";
text += " hoping you have made an impression on her. But, eventually, you know you have to part";
text += ". You give";
/* GarName */
text += "<p>a little kiss on the forehead and tell her to do whatever she wants while you're gone.</p>";
text += "<p>&quot;Wha—Whatever I w-want?&quot; she stammers, confused. You affirm yourself, but she is slow in r";
text += "esponding. &quot;I just... I only want to be with Master. I... Master, please don't go! Jus";
text += "t, just for a little while. Please? That's what I want, more than anything.</p>";
text += "Sighing, you pat";
/* GarName */
text += "<p>on the head and tell her you'd be happy to stay for a while longer. Beaming, she asks you";
text += " what you'd like to do.</p>";
/* Return to normal interaction menu */
text += "<p><b>Berate</b></p>";
/* Confidence -10 */
text += "You laugh, and tell";
/* GarName */
text += "<p>exactly what you think about her – that for a talking lump of rock, she's too damn talkat";
text += "ive and way the hell too emotional about everything. She sits there, very quietly, lis";
text += "tening to your every word. She even nods, from time to time, agreeing with you! You're";
text += " not sure if that makes you angrier or not.</p>";
text += "<p>When you're done explaining exactly what the fuck is wrong with her, you lean back and ask";
text += " her what she's going to do about it.</p>";
text += "<p>&quot;Be less emotional, Master,&quot; she says, as evenly as she can. &quot;I won't dwell on the past an";
text += "ymore, Master. I live only to serve you, of course. What else could I do? Please, Mast";
text += "er, give me any command you desire. I await them eagerly, without hesitation, my Maste";
text += "r. &quot;</p>";
text += "<p>Nodding appreciatively, you think of what to tell her to do.</p>";
/* Return to normal interaction menu */
text += "<p><b>Appearance</b></p>";
/* GarName */
text += "<p>is a gray marble statue that, though magics you can't quite grasp, has been animated.</p>";
text += "She stands roughly six feet tall, with a slender, girly frame. She wears no clothes, seemi";
text += "ngly possessing no modesty at all, and uses her brutally spiked tail as a weapon. She ";
text += "has a cute, somewhat angular face that is very feminine. Her skin and hair are a light";
text += " shade of gray, though she has solid, ruby-red eyes which";
/* if Confidence < 70: "glow timidly, reflect a submissive and servile nature in the little gargoyle. " if Confidence >= 70: "have a cool fire in them, showing her steadily-growing confidence and warmth toward you. " */
text += "Her skin is cold and smooth to the touch, a consequence of her marble material, yet she i";
text += "s quite soft, almost squishy.";
/* GarName */
text += "has a pair of cute little horns upon her brow, and has bat-like wings sprouting from her ";
text += "back which give a gentle flap every few seconds, an unconscious gesture on her part as";
text += " you stare at her. She has a long, spiked tail that curls";
/* if Confidence < 70: "timidly" else "playfully" */
text += "<p>about her thighs. She has two normal human legs sculpted to end in normal human feet.</p>";
text += "<p>She has a pair of big, pleasingly soft D-cup breasts. They are without nipples.</p>";
text += "<p>She has a small yet easily stretched pussy between her legs, with a . 2 inch clitoris.</p>";
text += "<p>She has a tight asshole between her soft butt cheeks, right where it belongs.</p>";
		}
		
		override public function onStartupScreen():void 
		{
			gargoyle.load();
			text = "The Gargoyle currently has " + gargoyle.breasts.length + " titties.";
		}
		override public function onLeaving():void 
		{
			gargoyle.save();
		}
		
	}
}