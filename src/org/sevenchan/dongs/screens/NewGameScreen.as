package org.sevenchan.dongs.screens 
{
	import flash.utils.ByteArray;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.*;
	/**
	 * ...
	 * @author N3X15
	 */
	public class NewGameScreen extends Screen
	{
		private var stage:int = -1;
		private var text:String = "";
		
		[Embed(source="txt/bsd-license.txt",mimeType="application/octet-stream")]
		private var License:Class;
		
		[Embed(source="txt/intro.txt",mimeType="application/octet-stream")]
		private var Introduction:Class;
		
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
			switch(stage) {
				case -1: // License				
					stage = 0;
					text = new License();
					this.clearButtons();
					this.setButton(NEXT_BUTTON, "Next");
					updateScreen();
					break;
				case 0: // Species selection
					this.stage = 1;
					this.clearButtons();
					setButton(0, "Human");
					setButton(1, "Bova");
					setButton(2, "Demon");
					text = "<h2>Species</h2><p>Select whatever the hell you want to be.  Note that this list is very incomplete.</p>";
					updateScreen();
					break;
				case 1: // Gender selection
					this.stage = 2;
					text = "<h2>Gender Selection</h2>";
					switch(id) {
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
							text += "<p>You are a Bova, a cow-girl who transforms others into Bovae via flatulence.</p>";
							text += "<p>Bovae can be Female or Hermophrodites (Franks, beans AND tacos).</p>";
							clearButtons();
							setButton(1, "Hermophrodite");
							setButton(2, "Female");
							break;
						case 2:
							main.player.setBaseType(new Bova());
							text += "<p>You have chosen to become a Demon.  Demons can infect other creatures with an STD that eventually changes them into demons, as well.</p>";
							text += "<p>Demons can be any gender except asexual.</p>";
							clearButtons();
							setButton(0, "Male");
							setButton(1, "Hermophrodite");
							setButton(2, "Female");
							break;
					}
					updateScreen();
					break;
				case 2: // Profile
					switch(id) {
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
					this.stage = 3;
					clearButtons();
					text = "<h2>Class Selection</h2>";
					text += "<p>Here, you choose your initial startup benefits.  These aren't classes in the traditional sense, they merely boost your initial stats.</p>";
					text += "<ul>";
					setButton(0, "Balanced");
					text += "<li>Balanced - You trained all of your skills.  (+1 STR, +1 SPD, +1 INT).</li>";
					setButton(1, "Brute");
					text += "<li>Brute - You excel in brute strength, and can benchpress a horse.  However, you're not too fast, and not too smart. (+3 STR)</li>";
					setButton(2, "Bookworm");
					text += "<li>Bookworm - You read a lot of scrolls as a kid, and paid attention in class. Strength, however, is not your forte. (+2 INT, +1 SPD)</li>";
					if(main.player.gender == Gender.MALE || main.player.gender == Gender.HERM) {
						text += "<li>Freak - You were cursed at birth with a third testicle, which gives you more volume and lust, but it reduced your muscle development, despite the extra testosterone. (+1 TESTICLE, +1 STR, +1 SPD)</li>";
						setButton(3, "Freak");
					}
					text += "</ul>";
					updateScreen();
					break;
				case 3:
					stage = 4;
					switch(id) {
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
					
					text = new Introduction();
					clearButtons();
					main.setupStatsPanel();
					setButton(NEXT_BUTTON, "Next");
					updateScreen();
					done = false;
					break;
				case 4:
					return true;
			}
			trace(id,stage,done);
			return done;
		}
		
		override public function getScreenText():String 
		{
			return text;
		}
	}

}