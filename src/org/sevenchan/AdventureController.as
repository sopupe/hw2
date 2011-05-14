package org.sevenchan
{
	import com.adobe.utils.IntUtil;
	import flash.display.*;
	import flash.events.*;
	import flash.sampler.NewObjectSample;
	import flash.text.*;
	import spark.components.Application;
	import mx.core.UIComponent;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.enchantment.events.CombatStartEvent;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.Town;
	import org.sevenchan.dongs.ui.*;
	import org.sevenchan.dongs.screens.*;
	/**
	 * ...
	 * @author N3X15
	 */
	[Frame(factoryClass = "Preloader", backgroundColor = 0x666666, frames = 10)]
	[SWF(width = 800, height = 600, frameRate = 60 , backgroundColor = "#666666")]
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
		private var btnSelectPerk:SexButton;
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
		
		public var player:Player;
		
		public static var screenQueue:Queue = new Queue();
		
		public function AdventureController(appl:Main):void 
		{
			super();
			this.app = appl;
			player = new Player(this);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public static function init(app:Main):void {
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
			txtHeader.htmlText = "ADVENTURE OF THE SEVEN LEAVES <b>TEST BUILD</b>"; 
			txtHeader.setTextFormat(tf);
			txtHeader.autoSize = "left";
			addChild(txtHeader);
			txtHeader.x = 2;
			txtHeader.y = 2;
			
			// Top row of buttons
			btnNewGame 		= addButton("New Game", 	100, y, toprow); y += 129.2; btnNewGame.addEventListener(MouseEvent.CLICK, onNewGame);
			btnLoadSaveGame	= addButton("Load Game",	100, y, toprow); y += 129.2; btnLoadSaveGame.addEventListener(MouseEvent.CLICK, onLoadOrSave);
			btnSelectPerk 	= addButton("Select Perk",	100, y, toprow); y += 129.2; //btnNewGame.addEventListener(MouseEvent.CLICK, onSelectPerk);
			btnExportGame 	= addButton("Export Game",	100, y, toprow); y += 129.2; //btnNewGame.addEventListener(MouseEvent.CLICK, onExport);
			btnDebugMenu 	= addButton("Debug Menu",	100, y, toprow); y += 129.2; btnDebugMenu.addEventListener(MouseEvent.CLICK, onDebugMenu);
			btnAppearance 	= addButton("Appearance",	100, y, toprow); 			 btnAppearance.addEventListener(MouseEvent.CLICK, onAppearance);
			
			//Panels
			pnlMain = addPanel("", 464.5, 618.5, 167.75, 56.75);
			
			pnlStats = addPanel("", 464.5, 144.9, 15.75, 56.75);
			
			// Second row of buttons
			btnAction = new Array();
			for (var i:int = 0; i < 12;i++) {
				var btn:SexButton	= addButton((i + 1).toString(), 	100, 16 + ((i % 6) * 129.2), 561 + (Math.round(i / 12) * 32));
				btnAction[i] = btn;
				btn.addEventListener(MouseEvent.CLICK, onActionClick);
			}
			
			setScreen(new StartupScreen());
		}
		
		public function onDebugMenu(lolno:MouseEvent):void {
			setScreen(new DebugScreen());
		}
		
		public function showBodyPartSelector(show:Boolean):void {
				app.showBodyParts(show);
				visible = !show;
				updateScreen(currentScreen);
		}
		
		public function setCheatMode(val:Boolean):void {
			statHP.showCheatButtons(val);
			statXP.showCheatButtons(val);
			statIntellect.showCheatButtons(val);
			statLust.showCheatButtons(val);
			statMana.showCheatButtons(val);
			statSensitivity.showCheatButtons(val);
			statSpeed.showCheatButtons(val);
			statStrength.showCheatButtons(val);
		}
		
		private function onAppearance(e:MouseEvent):void {
			setScreen(new AppearanceScreen());
		}
		
		private function onNewGame(e:MouseEvent):void {
			player = new Player(this);
			player.setMain(this);
			app.bodyparts.init(player);
			setScreen(new NewGameScreen());
		}
		
		private function onLoadOrSave(e:MouseEvent):void {
			if (!currentScreen.loadOrSaveButton) {
				player = new Player(this);
				player.setMain(this);
				player.load();
			} else {
				player.save();
			}
		}
		
		public function onPlayerLoaded():void {
			setupStatsPanel();
			setScreen(player.currentTown);
		}
		
		public function addToStatsPanel(stat:Statistic):void {
			pnlStats.addToStack(stat);
			pnlStats.arrangeStack();
		}
		
		public function remFromStatsPanel(stat:Statistic):void {
			pnlStats.delFromStack(stat);
			pnlStats.arrangeStack();
		}
		
		public function setupStatsPanel():void {
			pnlStats.stackMode(); // Remove textField.
			pnlStats.addToStack(new StackHeader("STATS"));
			statXP = new Statistic("Experience", "How far you are from levelling up",true,setXP);
			pnlStats.addToStack(statXP);
			statStrength = new Statistic("Strength", "How much power your attacks will have.",false,setStrength);
			pnlStats.addToStack(statStrength);
			statSpeed = new Statistic("Speed", "How fast you are; Affects dodging and catching opponents.",false,null);
			pnlStats.addToStack(statSpeed);
			statIntellect = new Statistic("Intellect", "Perceptiveness.  Allows you to sense impending danger and figure out puzzles easier.", false, null);
			pnlStats.addToStack(statIntellect);
			statSensitivity = new Statistic("Sensitivity", "The more sensitive you are, the faster your lust rises.  However, lack of sensation means you cannot masturbate.",false,null);
			pnlStats.addToStack(statSensitivity);
			statLust = new Statistic("Lust", "How horny you are right now.",false,null);
			pnlStats.addToStack(statLust);
		
			pnlStats.addToStack(new StackHeader("COMBAT"));
			statHP = new Statistic("HP", "Health left.",false,null);
			pnlStats.addToStack(statHP);
			statMana = new Statistic("Mana", "Magic stuff",false,null);
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
			
			refreshStats();
		}
		
		private function setGold(value:int):void { player.gold = value; }
		private function setHP(value:int):void { player.HP = value; }
		private function setIntellect(value:int):void { player.intellect = value; }
		private function setLust(value:int):void { player.lust = value; }
		private function setMana(value:int):void { player.mana = value; }
		private function setSensitivity(value:int):void { player.sensitivity = value; }
		private function setSpeed(value:int):void { player.speed = value; }
		private function setStrength(value:int):void { player.strength = value; }
		private function setXP(value:int):void { player.XP = value; }
		
		private function setScreen(screen:Screen):void {
			//trace("setscreen ",screen);
			if (screen == null)
			{
				if (player != null) {
					if(combatScreen==null)
						screen = player.currentTown;
					else
						screen = combatScreen;
				}
				else 
					screen = new StartupScreen();
			}
			currentScreen = screen;
			currentScreen.setMain(this);
			currentScreen.processButtonPress( -1);
		}
		
		private function onActionClick(e:MouseEvent):void {
			var clicked:SexButton = e.target as SexButton;
			for (var i:int = 0; i < 12; i++) {
				if (clicked == btnAction[i]) {
					var done:Boolean = currentScreen.processButtonPress(i);
					//trace(currentScreen,done);
					if (done) {
						setScreen(AdventureController.screenQueue.read());
					}
					return;
				}
			}
		}
		
		public function updateScreen(screen:Screen):void {
			pnlMain.visible = visible;
			pnlStats.visible = visible;
			var btns:Array = screen.getButtons();
			for (var i:int = 0; i < 12; i++) {
				var btn:SexButton = (btnAction[i] as SexButton);
				btn.visible = (btns[i] != "") && visible;
				btn.setText(btns[i]);
			}
			this.btnAppearance.visible = screen.appearanceButton && visible;
			this.btnDebugMenu.visible = screen.debugMenuButton && visible && player!=null;
			this.btnExportGame.visible = screen.exportGameButton && visible;
			this.btnLoadSaveGame.setText((screen.loadOrSaveButton)?"Save Game":"Load Game");
			btnLoadSaveGame.visible = visible;
			this.btnNewGame.visible = screen.newGameButton&& visible;
			this.btnSelectPerk.visible = screen.selectPerkButton&& visible;
			
			this.pnlMain.text = screen.getScreenText();
		}
		
		public function refreshStats():void {
			if (player.level == 0) {
				player.levelUp(true);
			}
			statXP.setMaxAndValue(player.maxXP, player.XP, false);
			statStrength.setMaxAndValue(100, player.strength, false);
			statSpeed.setMaxAndValue(100, player.speed, false);
			statIntellect.setMaxAndValue(100, player.intellect, false);
			statSensitivity.setMaxAndValue(100, player.sensitivity, false);
			statLust.setMaxAndValue(100, player.lust, false);
			
			statHP.setMaxAndValue(player.maxHP, player.HP, false);
			statMana.setMaxAndValue(100, player.mana, false);
			statGold.text = player.gold+"";
		}
		
		private function addButton(label:String, size:Number, x:Number, y:Number):SexButton {
			var btn:SexButton = new SexButton(size, label);
			stage.addChild(btn);
			btn.x = x;
			btn.y = y - btn.height;
			return btn;
		}
		
		private function addPanel(text:String,h:Number, w:Number, x:Number, y:Number):SexPanel {
			var btn:SexPanel = new SexPanel(text);
			stage.addChild(btn);
			btn.x = x;
			btn.y = y;
			btn.draw(h,w);
			return btn;
		}

		private function initBG():void
		{
			bgshape = new Sprite();
			bgshape.graphics.clear();
			bgshape.graphics.beginFill(currentBGColor);
			bgshape.graphics.drawRect(0,0,stage.stageWidth, stage.stageHeight);
			addChildAt(bgshape, 0);
			stage.addEventListener(Event.RESIZE, resizeBGWithStage);
		}
		private function resizeBGWithStage(e:Event):void
		{
			try {
				bgshape.width = stage.stageWidth;
				bgshape.height = stage.stageHeight;
			} catch(e:*){}
		}

		public function showInventory(item:Item=null):void {
			setScreen(new InventoryScreen(item));
		}

		public function startCombat(oldScreen:Screen, combatant:Creature, playerInitiated:Boolean = false):void {
			//inCombat = true;
			combatant.notifyEnchantments(new CombatStartEvent(player));
			player.notifyEnchantments(new CombatStartEvent(combatant));
			combatScreen = new CombatScreen(oldScreen, combatant, playerInitiated);
			setScreen(combatScreen);
			currentBGColor = 0x330000;
			initBG();
		}

		public function endCombat(oldScreen:Screen):void {
			//inCombat = false;
			combatScreen = null;
			//setScreen(AdventureController.screenQueue.read());
			currentBGColor = default_bg_color;
			initBG();
		}
		
		public function setTown(t:Town):void {
			player.currentTown = t;
		}
	}

}