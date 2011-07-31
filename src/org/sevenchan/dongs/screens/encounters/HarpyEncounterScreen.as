package org.sevenchan.dongs.screens.encounters
{
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.creature.Harpy;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.screens.InfoScreen;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.towns.WildsHorusSpine;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class HarpyEncounterScreen extends Screen
	{
		private var text:String = "";
		private var state:String = "main";
		
		public static function push():void
		{
			AdventureController.screenQueue.write(new HarpyEncounterScreen());
		}
		
		public function HarpyEncounterScreen()
		{
			lustCost = 3;
		}
		
		override public function processButtonPress(id:int):Boolean
		{
			clearButtons();
			switch (id)
			{
				case-1: 
					onStartupScreen();
					updateScreen();
					return false;
					break;
				case 0: 
					if (!main.player.getExplored("harpycabin"))
					{
						main.player.setExplored("harpycabin");
						onQuestStart();
					}
					else
					{
						text = "<p>She shrieks with glee, splitting your tortured eardrums, and then lifts you into the sky.</p>";
						main.setTown(Town.knownTowns.harpycabin);
					}
					return true;
				case 1: 
					onFuck();
					return true;
				case 2: 
					main.startCombat(null, new Harpy(false), true);
					return true;
				case 3: 
					return true;
			}
			return false;
		}
		
		override public function getScreenText():String
		{
			return text;
		}
		
		public function addHarpyCabin():void
		{
			if (main.player.getExplored("harpycabin"))
			{
				main.player.setExplored("harpycabin");
			}
			if ((Town.knownTowns.horus as WildsHorusSpine).connectedTowns["harpycabin"] == null)
			{
				(Town.knownTowns.horus as WildsHorusSpine).connectedTowns.push("harpycabin");
			}
		}
		
		public function onFuck():void
		{
			addHarpyCabin();
			if (!main.player.getExplored("seenharpy"))
			{
				text = "<p><i>Fuck annoying but cute birdwoman, or go after deadly ";
				text += "airborne demons with 9-inch claws?</i> You go after the only reasonable option, ";
				text += "and drop your torn trousers.</p> ";
				text += "<p>She beams again, then hops into the air and suddenly grabs ";
				text += "your shoulders, taking you with her.&nbsp; Your wang flaps in the wind uncomfortably, ";
				text += "and you look back, wishing you hadn't left your pants.&nbsp; On the way ";
				text += "to her nest, you have to clear your ears several times to adjust for air ";
				text += "pressure while listening to her babble on about herself in her shrill voice.</p> ";
				text += "<p>You expected her nest to be a collection of sticks arranged ";
				text += "in a bowl pattern, but it's actually a domed cabin with a hole in the ";
				text += "roof for getting in and out, windows overlooking the mountains, and a small ";
				text += "stove.&nbsp; It looked comfortable and, more important to your frozen mind, ";
				text += "warm.&nbsp; You feel like your dick will drop off and shatter on the rocks ";
				text += "below.</p> ";
				text += "<p>Inside, after ensuring you're warm and not ";
				text += "frostbitten, she guides you to a section with a large bed.&nbsp; There, you ";
				text += "make love to her.&nbsp; After the feathers settle, she flies you back down to ";
				text += "your pants and departs, dipping a wing in thanks.</p> ";
				text += "<p><i>Thank Christ that's over</i>.&nbsp; You pull out ";
				text += "your earplugs you made with some white berries you stole from her kitchen and ";
				text += "get on your way.</p>";
			}
			else
			{
				text = "<p>&quot;Yes.  I brought you my dick.&quot; You quip, this time keeping your ";
				text += "pants on.  She blushes, giggles, and swoops you away to her nest.</p>";
				main.setTown(Town.knownTowns.harpycabin);
			}
			InfoScreen.push(text);
			text = "";
		}
		
		public function onQuestStart():void
		{
			addHarpyCabin();
			text = "<p>You consider your options, and decide that she may be a ";
			text += "useful ally, but you don't want to know how loudly she screams during ";
			text += "sex. &quot;I'll get the eggs.&quot;&nbsp; You assure her, edging away. </p> ";
			text += "<p>She beams, white teeth gleaming in the sun;&nbsp; She ";
			text += "happily hops on her strange birdlegs. You feel like you're in a crappy ";
			text += "horror play, like the ones your idiot cousin used to produce. &quot;Thank you ";
			text += "so much!&quot;&nbsp; She takes to the skies and flies back to her nest. </p> ";
			text += "<p>You breathe a sigh of relief, and get the hell away from the ";
			text += "area.</p>";
			InfoScreen.push(text);
			text = "";
		}
		
		public function onStartupScreen():void
		{
			if (!main.player.getExplored("seenharpy"))
			{
				main.player.setExplored("seenharpy");
				//[Get Eggs][Fuck][Run Away]
				setButton(0, "Eggs");
				setButton(1, "Fuck");
				setButton(2, "Fight");
				setButton(3, "Run");
				text = "<p>You hear large wings beating the air above you, and look up ";
				text += "to see a beautiful woman with large, brown feathered wings and short brown hair ";
				text += "looking down at you from about 10 meters away.&nbsp; You squint against the ";
				text += "bright sunlight (and downwash from her great wings), and notice that her long ";
				text += "birdlike legs are not poised to grab you.&nbsp; She also appears to not want to ";
				text += "kill you.&nbsp; Relieved, but wary, you make room for her on the ledge to hear what ";
				text += "she has to say.&nbsp; Her giddy, stupid smile doesn't make you feel any ";
				text += "better.</p> ";
				text += "<p>&quot;Hi!&quot; She screeches, Leaning close to you and ";
				text += "cocking her human head, much like... Well, a bird. </p> ";
				text += "<p>&quot;... Hello.&quot; You respond in a clipped voice, ";
				text += "back firmly pressed against the cliff behind you so hard you feel like you're ";
				text += "sinking into it.&nbsp; <i>Jesus, how can a voice be so grating?!</i></p> ";
				text += "<p>&quot;Are you new here? I haven't seen you before.&quot; ";
				text += "She beams, head cocking in the opposite direction, her eyes studying you like a ";
				text += "scientist evaluating a potato.&nbsp; She blinks, and then giggles. &quot;I ";
				text += "guess I should introduce myself, since you look about ready to fling yourself ";
				text += "off that cliff.&quot;&nbsp; You nod quickly, indicating that she should hurry ";
				text += "up before your ears can't take any more of her idiocy.&nbsp; She doesn't ";
				text += "disappoint. &quot;I'm a harpy, which is like, a bird-woman... Thing.&quot;&nbsp; ";
				text += "She pauses, briefly considering the choice of words, before continuing in her ";
				text += "high-pitched, happy voice. &quot;You're walking underneath my peak so I ";
				text += "thought I'd drop by and say hi or something.&quot;&nbsp; She suddenly ";
				text += "changes to a sadder voice. &quot;There aren't a whole lot of us ";
				text += "left;&nbsp; The new demon Lord turned a lot of us into dark harpies and they're ";
				text += "really mean and don't like to talk.&quot;&nbsp; She brightens. &quot;But ";
				text += "I'm glad you're letting me talk to you!&quot;</p> ";
				text += "<p>You take a moment to absorb the information and extract your ";
				text += "fingers from your ears. &quot;Okay.&quot;&nbsp; You notice that she's ";
				text += "blocking your path from where she's standing.&nbsp; &quot;Uh.&nbsp; Can ";
				text += "I help you with anything?&quot;&nbsp; <i>Hopefully without listening to you ";
				text += "talk</i>, you silently add. </p> ";
				text += "<p>She thinks for a moment, pinching her chin with her human ";
				text += "fingers. &quot;Uhm.... Oh!&quot; She comes out of thinking mode like an ";
				text += "old truck shifting gears. &quot;Yeah, if you bring me dark harpy eggs, I can ";
				text += "raise them to be normal harpies. Or...&quot; She blushes, fidgeting. &quot;It... ";
				text += "IS harpy mating season, you know...&quot;</p> ";
			}
			else
			{
				setButton(0, "Eggs");
				setButton(1, "Dick");
				setButton(2, "Fist");
				setButton(3, "RUN AWAY");
				text = "<p>Grunting with exertion, you finally manage to pull yourself onto a ledge.  Feeling like you've run a marathon after scaling a cliff face, you rest peacefully.</p>";
				text += "<p>Up until you hear familiar wingbeats and open your eyes to see a harpy standing over you with a big, stupid grin.</p>";
				text += "<p><i>God DAMNIT.</i></p>";
				text += "<p>Your attempts to strangle her with your mind fail, so you pull yourself into a sitting position. You yawn at her, stretching, still wanting to punch her so hard that her head spins, but keeping yourself under control (for the time being).</p>";
				text += "<p>She scratches at the thin layer of dirt accumulated on the ledge idly, but eyes you with anxiety.  &quot;So... Do you have anything for me?&quot;  The smile widens nervously, and she blushes.</p>";
			}
		}
	
	}

}