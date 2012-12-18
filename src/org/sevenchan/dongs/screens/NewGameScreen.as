package org.sevenchan.dongs.screens
{
	import flash.utils.ByteArray;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.creature.Bova;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class NewGameScreen extends Screen
	{
		private var stage:int = -1;
		private var text:String = "";
		
		[Embed(source="txt/bsd-license.txt",mimeType="application/octet-stream")]
		private var License:Class;
		
		[Embed(source="txt/humanintro.html",mimeType="application/octet-stream")]
		private var HumanIntroduction:Class;
		[Embed(source="txt/bovaintro.html",mimeType="application/octet-stream")]
		private var BovaIntroduction:Class;
		[Embed(source="txt/demonintro.html",mimeType="application/octet-stream")]
		private var DemonIntroduction:Class;
		
		public function NewGameScreen()
		{
			this.appearanceButton = false;
			this.debugMenuButton = true;
			this.exportGameButton = false;
			this.loadOrSaveButton = false;
			this.newGameButton = false;
			this.importGameButton = true;
			
			this.clearButtons();
			this.setButton(NEXT_BUTTON, "Next");
		}
		
		override public function processButtonPress(id:int):Boolean
		{
			var done:Boolean = false;
			var validationError:String = "";
			switch (stage)
			{
				case-1: // License				
					stage = 0;
					text = new License();
					this.clearButtons();
					this.setButton(NEXT_BUTTON, "Next");
					updateScreen();
					break;
				case 0: // Species selection
					this.clearButtons();
					setButton(0, "Human");
					setButton(1, "Bova");
					setButton(2, "Demon");
					main.showTextInput(true, 167.75+12, 56.75+115);
					main.player.baseType.ownName = main.getTextBoxContents();
					if (main.player.baseType.ownName.length > 0) {
						this.stage = 1;
						main.showTextInput(false, 0, 0);
						validationError = "";
						processButtonPress(id);
						return false;
					}else{
						validationError = "Your name must be more than one character long."
					}
					text = "<h2>What are you?</h2>";
					text += "<p>First, what is your name?</p><p><br/><br/></p>";
					if (validationError.length > 0)
						text += "<p style='color:red;font-weight:bold;'>" + validationError + "</p>";
					text += "<p>Next, what are you?</p>";
					text += "<p><b>Human:</b> You were born human. If you’re playing this, you probably know what a human looks like.</p>"; // Added commas, reworded a bit - Harb
					text += "<p><b>Bova:</b> You were born as a Bova, more widely known as a cow-girl.  Bovae are cow-morphs with predominantly human features save for hoofs, larger than usual breasts and milk output (assuming they're female, of course), floppy cow ears, and a black and white tail.</p>"; // s/bovine/bova/
					text += "<p><b>Demon:</b> You were born a demon, with an unusual skin color compared to humans and bovae as well as a high libido, leaving you more easily aroused. However, you are quite capable of “exciting” your lovers and foes.</p>"; // Grammatical fixes
					
					updateScreen();
					break;
				case 1: // Gender selection
					this.clearButtons();
					text = "<h2>Gender Selection</h2>";
					stage = 2;
					switch (id)
					{
						case 0: 
							main.player.setBaseType(new Human());
							text += "<p>As a simple human, you can either be male or female as you start out.</p>";
							text += "<ul><li><b>Male</b> - You gain a dick and a couple of balls.</li><li><b>Female</b> - A vagina and randomly-sized boobs.</li></ul>";
							text += "<p>Humans also get randomly colored skin, hair, and eyes.</p>";
							clearButtons();
							setButton(0, "Male");
							setButton(2, "Female");
							break;
						case 1: 
							main.player.setBaseType(new Bova());
							text += "<p>You are a Bova, a race of cow-girls that was once enslaved by man.  Throwing off their shackles, they formed their own nation after a bloody war.</p>";
							text += "<p>Bovae can be Male or Female.</p>";
							text += "<p>Males (bulls) are very strong, yet not very smart.</p>";
							text += "<p>Females are more cunning, yet they need their bulls for protection.</p>";
							clearButtons();
							setButton(0, "Male");
							setButton(2, "Female");
							break;
						case 2: 
							main.player.setBaseType(new Demon());
							text += "<p>You have chosen to become a Demon.  Demons can infect other creatures with an STD that eventually changes them into demons, as well.</p>";
							text += "<p>Demons can be any gender except asexual.</p>";
							clearButtons();
							setButton(0, "Male");
							setButton(1, "Hermaphrodite");
							setButton(2, "Female");
							break;
					}
					updateScreen();
					break;
				case 2: // Skin color
					stage = 3;
					switch (id)
					{
						case 0: 
							main.player.gender = Gender.MALE;
							break;
						case 1: 
							main.player.gender = Gender.HERM;
							break;
						case 2: 
							main.player.gender = Gender.FEMALE;
							break;
					}
					main.player.initialGenderSetup();
					text = "<h2>Skin color</h2>";
					text += "<p>What color is your skin?</p>";
					var isDemon:Boolean = main.player.getTypeName() == "demon";
					clearButtons();
					if (!isDemon)
					{
						setButton(0, "White");
						setButton(1, "Brown");
						setButton(2, "Black");
						setButton(3, "Tan");
						setButton(4, "Albino");
					}
					else
					{
						// idfk
						setButton(0, "RedishBrown");
						setButton(1, "Violet");
						setButton(2, "Dark Red");
					}
					updateScreen();
					break;
				case 3: // Hair type
					stage = 4;
					isDemon = main.player.getTypeName() == "demon";
					if (!isDemon)
					{
						switch (id)
						{
							case 0: 
								main.player.skin.color = "white";
								break;
							case 1: 
								main.player.skin.color = "brown";
								break;
							case 2: 
								main.player.skin.color = "black";
								break;
							case 3: 
								main.player.skin.color = "tan";
								break;
							case 4: 
								main.player.skin.color = "albino";
								break;
						}
					}
					else
					{
						switch (id)
						{
							case 0: 
								main.player.skin.color = "reddish brown";
								break;
							case 1: 
								main.player.skin.color = "violet";
								break;
							case 2: 
								main.player.skin.color = "dark red";
								break;
						}
					}
					text = "<h2>Hair Style</h2>";
					text += "<p>What kind of hair do you want, assuming you want any at all?</p>";
					setButton(0, "Plain");
					setButton(1, "Bob cut");
					setButton(2, "Wild&Proud");
					setButton(3, "Ponytail");
					setButton(4, "Bald");
					setButton(5, "Shaven");
					updateScreen();
					break;
				case 4: 
					this.stage = 5;
					main.player.hair = new Hair();
					switch (id)
					{
						case 0: // Plain
							main.player.hair.style = "plain";
							break;
						case 1: // Bob cut
							main.player.hair.style = "bob-cut";
							break;
						case 2: // Wild and proud
							main.player.hair.style = "wild";
							break;
						case 3: // Ponytail
							main.player.hair.style = "ponytail";
							break;
						case 4: // Bald
							main.player.hair.style = "bald";
							break;
						case 5: // Shaven
							main.player.hair.style = "close-shaven";
							break;
					}
					clearButtons();
					if (main.player.hair.isBald())
					{
						text = "<h2>Hair Color</h2><p>You don't have hair, so you get to skip this section!</p>";;
						setButton(NEXT_BUTTON, "Next");
					} else {
						text = "<h2>Hair Color</h2>";
						text += "<p>What color hair do you have?</p>";
						setButton(0, "Brown");
						setButton(1, "Blonde");
						setButton(2, "Black");
						setButton(3, "Red");
						setButton(4, "Gray");
					}
					updateScreen();
					break;
				case 5:
					switch(id)
					{
						case 0: //Brown
							main.player.hair.color = "brown";
							break;
						case 1: //Blonde
							main.player.hair.color = "blonde";
							break;
						case 2: //Black
							main.player.hair.color = "black";
							break;
						case 3: //Red
							main.player.hair.color = "red";
							break;
						case 4: //Gray
							main.player.hair.color = "gray";
							break;
					}
					stage = 6;
					clearButtons();
					text = "<h2>Class Selection</h2>";
					text += "<p>Here, you choose your initial startup benefits and weapons.</p>";
					text += "<ul>";
					setButton(0, "Avg. Joe");
					text += "<li>Avg. Joe - Just go in with the clothes on your back. (1 STR, 1 INT, 1 SPD)</li>";
					setButton(1, "Soldier");
					text += "<li>Soldier - You spent more time on swordplay than books. This lets you dive right into the combat. (+3 STR, Cheap Sword, Leather Armor)</li>";
					setButton(2, "Bookworm");
					text += "<li>Bookworm - You read a lot of scrolls as a kid, and paid attention in class. Strength, however, is not your forte. (+3 INT, Glasses, Daemonology Book)</li>";
					text += "</ul>";
					updateScreen();
					break;
				case 6: 
					stage = 7;
					main.player.strength = 5;
					main.player.speed = 5;
					main.player.intellect = 5;
					
					switch (id)
				{
					case 0: 
						main.player.strength += 1;
						main.player.speed += 1;
						main.player.intellect += 1;
						break;
					case 1: 
						main.player.strength += 3;
						break;
					case 2: 
						main.player.intellect += 2;
						main.player.speed += 1;
						break;
					case 3: 
						main.player.balls.push(main.player.balls[0]);
						main.player.strength += 1;
						main.player.speed += 1;
						break;
				}
					main.player.clothing.push(ItemRegistry.BROWN_TUNIC, ItemRegistry.GRAY_PANTS);
					if(main.player.baseType is Human)
						text = new HumanIntroduction();
					if (main.player.baseType is Bova)
						text = new BovaIntroduction();
					if (main.player.baseType is Demon)
						text = new DemonIntroduction();
					clearButtons();
					main.setupStatsPanel();
					setButton(NEXT_BUTTON, "Next");
					updateScreen();
					done = false;
					break;
				case 7: 
					return true;
			}
			trace(id, stage, done);
			return done;
		}
		
		override public function getScreenText():String
		{
			return text;
		}
	}

}