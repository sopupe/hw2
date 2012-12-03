package org.sevenchan
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import mx.core.UIComponent;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.enchantment.events.CombatStartEvent;
	import org.sevenchan.dongs.enchantment.events.ScreenChangedEvent;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.ui.*;
	/**
	 * ...
	 * @author Harbinger
	 */
	[Frame(factoryClass="Preloader",backgroundColor=0x666666,frames=10)]
	[SWF(width=800,height=600,frameRate=60,backgroundColor="#666666")]
	
	public class AdventureController extends Sprite
	{
		private var app:Main;
		private const default_bg_color:uint = 0x333333;
		private var currentBGColor:uint = default_bg_color;
		public var bodyPartsDialog:org.sevenchan.dongs.frmBodyPartsPool = new org.sevenchan.dongs.frmBodyPartsPool;
		private var bgshape:Sprite;
		
		private var currentScreen:Screen;
		private var combatScreen:Screen;
		private var btnNewGame:SexButton;
		private var btnLoadSaveGame:SexButton;
		private var btnExportGame:SexButton;
		private var btnImportGame:SexButton;
		private var btnDebugMenu:SexButton;
		private var btnAppearance:SexButton;
		private var btnAction:Array;
		
		private var pnlMain:SexPanel;
		private var pnlStats:SexPanel;
		
		private var statXP:Statistic;
		private var statStrength:Statistic;
		private var statSpeed:Statistic;
		private var statIntellect:Statistic;
		private var statSensitivity:Statistic;
		private var statLust:Statistic;
		
		private var statMana:Statistic;
		public var statHP:Statistic;
		private var statGold:TextField;
		
		private var statsAreSetUp:Boolean = false;
		
		public var player:Player;
		
		public static var screenQueue:Queue = new Queue();
		
		public function AdventureController(appl:Main):void
		{
			super();
			this.app = appl;
			player = new Player(this);
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public static function init(app:Main):void
		{
			var ui:UIComponent = new UIComponent();
			ui.addChild(new AdventureController(app));
			app.addChild(ui);
		}
		
		private function init(e:Event = null):void
		{
			Town.setup();
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			initBG();
			
			var toprow:Number = 600 - 549;
			
			var y:Number = 16;
			//stage.opaqueBackground = 0x666666;
			
			var txtHeader:TextField = new TextField();
			var tf:TextFormat = new TextFormat();
			tf.color = 0xffffff;
			tf.font = "_sans";
			txtHeader.htmlText = "ADVENTURE OF THE SEVEN LEAVES <b>RELEASE 28</b>";
			txtHeader.setTextFormat(tf);
			txtHeader.autoSize = "left";
			addChild(txtHeader);
			txtHeader.x = 2;
			txtHeader.y = 2;
			
			// Top row of buttons
			btnNewGame = addButton("New Game", 100, y, toprow);
			y += 129.2;
			btnNewGame.addEventListener(MouseEvent.CLICK, onNewGame);
			btnLoadSaveGame = addButton("Load Game", 100, y, toprow);
			y += 129.2;
			btnLoadSaveGame.addEventListener(MouseEvent.CLICK, onLoadOrSave);
			btnImportGame = addButton("Import Game", 100, y, toprow);
			y += 129.2;
			btnImportGame.addEventListener(MouseEvent.CLICK, onImport);
			btnExportGame = addButton("Export Game", 100, y, toprow);
			y += 129.2;
			btnExportGame.addEventListener(MouseEvent.CLICK, onExport);
			btnDebugMenu = addButton("Debug Menu", 100, y, toprow);
			y += 129.2;
			btnDebugMenu.addEventListener(MouseEvent.CLICK, onDebugMenu);
			btnAppearance = addButton("Appearance", 100, y, toprow);
			btnAppearance.addEventListener(MouseEvent.CLICK, onAppearance);
			
			//Panels
			pnlMain = addPanel("", 464.5, 618.5, 167.75, 56.75);
			pnlStats = addPanel("", 464.5, 144.9, 15.75, 56.75);
			
			// Second row of buttons
			btnAction = new Array();
			for (var i:int = 0; i < 12; i++)
			{
				var btn:SexButton = addButton((i + 1).toString(), 100, 16 + ((i % 6) * 129.2), 561 + (Math.round(i / 12) * 32));
				btnAction[i] = btn;
				btn.addEventListener(MouseEvent.CLICK, onActionClick);
			}
			
			setScreen(new StartupScreen());
		}
		
		public function onDebugMenu(lolno:MouseEvent):void
		{
			setScreen(new DebugScreen());
		}
		
		public function showBodyPartSelector(show:Boolean):void
		{
			app.showBodyParts(show);
			visible = !show;
			updateScreen(currentScreen);
		}
		
		public function showCreatureViewer(show:Boolean):void
		{
			app.showCreatureViewer(show);
			visible = !show;
			updateScreen(currentScreen);
		}
		
		public function setCheatMode(val:Boolean):void
		{
			statHP.showCheatButtons(val);
			statXP.showCheatButtons(val);
			statIntellect.showCheatButtons(val);
			statLust.showCheatButtons(val);
			statMana.showCheatButtons(val);
			statSensitivity.showCheatButtons(val);
			statSpeed.showCheatButtons(val);
			statStrength.showCheatButtons(val);
		}
		
		private function onAppearance(e:MouseEvent):void
		{
			setScreen(new AppearanceScreen());
		}
		
		private function onNewGame(e:MouseEvent):void
		{
			player = new Player(this);
			player.setMain(this);
			app.bodyparts.init(player);
			app.creatures.init(player);
			setScreen(new NewGameScreen());
		}
		
		private function onImport(e:MouseEvent):void
		{
			player = new Player(this);
			player.setMain(this);
			player.load(-1);
		}
		
		private function onExport(e:MouseEvent):void
		{
			player.save(-1);
		}
		
		private function onLoadOrSave(e:MouseEvent):void
		{
			if (!currentScreen.loadOrSaveButton)
			{
				setScreen(new LoadSaveScreen(true));
			}
			else
			{
				setScreen(new LoadSaveScreen(false));
			}
		}
		
		public function onPlayerLoaded():void
		{
			setupStatsPanel();
			setScreen(player.currentTown);
		}
		
		public function addToStatsPanel(stat:Statistic):void
		{
			pnlStats.addToStack(stat);
			pnlStats.arrangeStack();
		}
		
		public function remFromStatsPanel(stat:Statistic):void
		{
			pnlStats.delFromStack(stat);
			pnlStats.arrangeStack();
		}
		
		public function setupStatsPanel():void
		{
			pnlStats.stackMode(); // Remove textField.
			pnlStats.addToStack(new StackHeader("STATS"));
			statXP = new Statistic("Experience", "How far you are from levelling up", true, setXP);
			pnlStats.addToStack(statXP);
			statStrength = new Statistic("Strength", "How much power your attacks will have.", false, setStrength);
			pnlStats.addToStack(statStrength);
			statSpeed = new Statistic("Speed", "How fast you are; Affects dodging and catching opponents.", false, null);
			pnlStats.addToStack(statSpeed);
			statIntellect = new Statistic("Intellect", "Perceptiveness.  Allows you to sense impending danger and figure out puzzles easier.", false, null);
			pnlStats.addToStack(statIntellect);
			statSensitivity = new Statistic("Sensitivity", "The more sensitive you are, the faster your lust rises.  However, lack of sensation means you cannot masturbate.", false, null);
			pnlStats.addToStack(statSensitivity);
			statLust = new Statistic("Lust", "How horny you are right now.", false, null);
			pnlStats.addToStack(statLust);
			
			pnlStats.addToStack(new StackHeader("COMBAT"));
			statHP = new Statistic("HP", "Health left.", false, null);
			pnlStats.addToStack(statHP);
			statMana = new Statistic("Mana", "Magic stuff", false, null);
			pnlStats.addToStack(statMana);
			
			pnlStats.addToStack(new StackHeader("GOLD"));
			statGold = new TextField();
			pnlStats.addToStack(statGold);
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.color = 0x000000;
			tf.align = TextFormatAlign.CENTER;
			statGold.setTextFormat(tf);
			statGold.defaultTextFormat = tf;
			
			pnlStats.arrangeStack();
			statsAreSetUp = true;
			
			refreshStats();
		}
		
		private function setGold(value:int):void
		{
			player.gold = value;
		}
		
		private function setHP(value:int):void
		{
			player.HP = value;
		}
		
		private function setIntellect(value:int):void
		{
			player.intellect = value;
		}
		
		private function setLust(value:int):void
		{
			player.lust = value;
		}
		
		private function setMana(value:int):void
		{
			player.mana = value;
		}
		
		private function setSensitivity(value:int):void
		{
			player.sensitivity = value;
		}
		
		private function setSpeed(value:int):void
		{
			player.speed = value;
		}
		
		private function setStrength(value:int):void
		{
			player.strength = value;
		}
		
		private function setXP(value:int):void
		{
			player.XP = value;
		}
		
		private function setScreen(screen:Screen):void
		{
			//trace("setscreen ",screen);
			if (screen == null)
			{
				if (player != null)
				{
					if (combatScreen == null)
						screen = player.currentTown;
					else
						screen = combatScreen;
				}
				else
					screen = new StartupScreen();
			}
			if (screen == null)
				screen = new StartupScreen();
			currentScreen = screen;
			currentScreen.setMain(this);
			currentScreen.processButtonPress(-1);
		}
		
		private function onActionClick(e:MouseEvent):void
		{
			var clicked:SexButton = e.target as SexButton;
			for (var i:int = 0; i < 12; i++)
			{
				if (clicked == btnAction[i])
				{
					var done:Boolean = currentScreen.processButtonPress(i);
					//trace(currentScreen,done);
					if (done)
					{
						setScreen(AdventureController.screenQueue.read());
					}
					return;
				}
			}
		}
		
		public function updateScreen(screen:Screen):void
		{
			pnlMain.visible = visible;
			pnlStats.visible = visible;
			var btns:Array = screen.getButtons();
			for (var i:int = 0; i < 12; i++)
			{
				var btn:SexButton = (btnAction[i] as SexButton);
				btn.visible = (btns[i] != "") && visible;
				btn.setText(btns[i]);
			}
			this.btnAppearance.visible = screen.appearanceButton && visible;
			this.btnDebugMenu.visible = screen.debugMenuButton && visible && player != null;
			this.btnExportGame.visible = screen.exportGameButton && visible;
			this.btnLoadSaveGame.setText((screen.loadOrSaveButton) ? "Save Game" : "Load Game");
			this.btnLoadSaveGame.visible = visible && screen.showLoadOrSaveButton;
			this.btnNewGame.visible = screen.newGameButton && visible;
			this.btnImportGame.visible = screen.importGameButton && visible;
			
			this.pnlMain.text = screen.getScreenText();
			if (player != null)
			{
				player.notifyEnchantments(new ScreenChangedEvent());
				player.addLust(screen.lustCost);
			}
		}
		
		public function refreshStats():void
		{
			if (player.level == 0)
			{
				player.levelUp(true);
			}
			if (!statsAreSetUp)
				return;
			statXP.setMaxAndValue(player.maxXP, player.XP, false);
			statStrength.setMaxAndValue(100, player.strength, false);
			statSpeed.setMaxAndValue(100, player.speed, false);
			statIntellect.setMaxAndValue(100, player.intellect, false);
			statSensitivity.setMaxAndValue(100, player.sensitivity, false);
			statLust.setMaxAndValue(100, player.lust, false);
			
			statHP.setMaxAndValue(player.maxHP, player.HP, false);
			statMana.setMaxAndValue(100, player.mana, false);
			statGold.text = player.gold + "";
		}
		
		private function addButton(label:String, size:Number, x:Number, y:Number):SexButton
		{
			var btn:SexButton = new SexButton(size, label);
			stage.addChild(btn);
			btn.x = x;
			btn.y = y - btn.height;
			return btn;
		}
		
		private function addPanel(text:String, h:Number, w:Number, x:Number, y:Number):SexPanel
		{
			var btn:SexPanel = new SexPanel(text);
			stage.addChild(btn);
			btn.x = x;
			btn.y = y;
			btn.draw(h, w);
			return btn;
		}
		
		public function onResize(h:Number, w:Number, measuredHeight:Number, measuredWidth:Number):void
		{
			var originalPanelHeightPCT:Number = 464.5 / 600;
			//pnlStats = addPanel("", 464.5, 144.9, 15.75, 56.75);
			//pnlMain = addPanel("", 464.5, 618.5, 167.75, 56.75);
			
			pnlStats.height = pnlMain.height = (464.5 / 600) * h;
			pnlStats.width = (144.9 / 800) * w;
			pnlStats.x = (15.75 / 800) * w;
			pnlStats.y = (56.75 / 600) * h;
			
			pnlMain.width = (618.5 / 800) * w;
			pnlMain.x = (167.75 / 800) * w;
			pnlMain.y = (56.75 / 600) * h;
			
			// Buttons
			
			var xOffset:Number = (16 / 800) * w;
			var yOffset:Number = (531 / 600) * h; //(561 / 600) * h;
			var bHeightPadding:Number = (32 / 600) * h;
			var bWidthPadding:Number = (129.2 / 800) * w;
			var bHeight:Number = (30 / 600) * h;
			var bWidth:Number = (100 / 800) * w;
			for (var i:int = 0; i < 12; i++)
			{
				//var btn:SexButton = addButton((i + 1).toString(), 100, 16 + ((i % 6) * 129.2), 561 + (Math.round(i / 12) * 32));
				btnAction[i].height = bHeight;
				btnAction[i].width = bWidth;
				btnAction[i].x = xOffset + ((i % 6) * bWidthPadding);
				btnAction[i].y = yOffset + (Math.round(i / 12) * bHeightPadding);
			}
			
			// Top row of buttons
			xOffset = (129.2 / 800) * w;
			var toprow:Number = (21 / 600) * h; // 51 - 21 = 30
			var x:Number = (16 / 800) * w;
			btnNewGame.width = bWidth;
			btnNewGame.height = bHeight;
			btnNewGame.y = toprow;
			btnNewGame.x = x;
			x += xOffset;
			
			btnLoadSaveGame.width = bWidth;
			btnLoadSaveGame.height = bHeight;
			btnLoadSaveGame.y = toprow;
			btnLoadSaveGame.x = x;
			x += xOffset;
			
			btnImportGame.width = bWidth;
			btnImportGame.height = bHeight;
			btnImportGame.y = toprow;
			btnImportGame.x = x;
			x += xOffset;
			
			btnExportGame.width = bWidth;
			btnExportGame.height = bHeight;
			btnExportGame.y = toprow;
			btnExportGame.x = x;
			x += xOffset;
			
			btnDebugMenu.width = bWidth;
			btnDebugMenu.height = bHeight;
			btnDebugMenu.y = toprow;
			btnDebugMenu.x = x;
			x += xOffset;
			
			btnAppearance.width = bWidth;
			btnAppearance.height = bHeight;
			btnAppearance.y = toprow;
			btnAppearance.x = x;
		}
		
		private function initBG():void
		{
			bgshape = new Sprite();
			bgshape.graphics.clear();
			bgshape.graphics.beginFill(currentBGColor);
			bgshape.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			addChildAt(bgshape, 0);
			stage.addEventListener(Event.RESIZE, resizeBGWithStage);
		}
		
		private function redrawBG():void
		{
			bgshape.graphics.beginFill(currentBGColor);
			bgshape.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		}
		
		private function resizeBGWithStage(e:Event):void
		{
			try
			{
				bgshape.width = stage.stageWidth;
				bgshape.height = stage.stageHeight;
			}
			catch (e:*)
			{
			}
		}
		
		public function showInventory(item:Item = null):void
		{
			setScreen(new InventoryScreen(item));
		}
		
		public function startRape(oldScreen:Screen, combatant:Creature, playerInitiated:Boolean = false):void
		{
			if (!(oldScreen is CombatScreen))
			{
				if (!combatant.staticStats)
				{
					combatant._level = Math.max(1, player.level + MathUtils.rand(-2, 2));
					combatant._strength = Math.max(1, player.strength + MathUtils.rand(-2, 2));
				}
				combatant.HP = combatant.maxHP;
				combatant.mana = combatant.maxMana;
				
				combatant.notifyEnchantments(new CombatStartEvent(player));
				player.notifyEnchantments(new CombatStartEvent(combatant));
			}
			if (combatant.tryRape(player))
			{
				combatScreen = new Rape(combatant);
				setScreen(combatScreen);
				currentBGColor = 0x330000;
				redrawBG();
				updateScreen(combatScreen);
			}
			else
			{
				if (!(oldScreen is CombatScreen))
				{
					startCombat(oldScreen, combatant, false);
				}
			}
		}
		
		public function startCombat(oldScreen:Screen, combatant:Creature, playerInitiated:Boolean = false):void
		{
			if (!combatant.staticStats)
			{
				if (player.level < 5)
				{
					combatant._level = Math.max(1, player.level + MathUtils.rand(-2, 0));
					combatant._strength = Math.max(1, player.strength + MathUtils.rand(-2, 0));
				}
				else
				{
					combatant._level = Math.max(1, player.level + MathUtils.rand(-2, 2));
					combatant._strength = Math.max(1, player.strength + MathUtils.rand(-2, 2));
				}
			}
			combatant.HP = combatant.maxHP;
			combatant.mana = combatant.maxMana;
			
			combatant.notifyEnchantments(new CombatStartEvent(player));
			player.notifyEnchantments(new CombatStartEvent(combatant));
			combatScreen = new CombatScreen(oldScreen, combatant, playerInitiated);
			setScreen(combatScreen);
			currentBGColor = 0x330000;
			redrawBG();
		}
		
		public function endCombat(oldScreen:Screen):void
		{
			combatScreen = null;
			currentBGColor = default_bg_color;
			redrawBG();
		}
		
		public function setTown(t:Town):void
		{
			player.currentTown = t;
		}
	}

}