package org.sevenchan.dongs.screens 
{
	import org.sevenchan.dongs.MenuNode;
	import org.sevenchan.dongs.Screen;
	import org.sevenchan.dongs.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Encounter extends Screen 
	{
		protected var subject:Creature;
		protected var text:String = "";
		protected var abort:Boolean = false;
		public var currentItem:INode = new MenuNode(null, "", "");
		
		public function Encounter(target:Creature) {
			subject = target;
			if(target != null) {
				currentItem.children.push(new ActionNode(currentItem, "Rape", 0, target.gender.doReplace("Try to rape %POS%."), performRape,null));
				currentItem.children.push(new ActionNode(currentItem, "Fight", 0, target.gender.doReplace("Try to fight %POS%."), fight,null));
			}
		}
		public function onStartupScreen():void { }
		public function onLeaving():void { }
		override public function processButtonPress(id:int):Boolean
		{
			clearButtons();
			if (abort) {
				return true;
			}
			switch (id)
			{
				case-1: 
					onStartupScreen();
					appendMenu();
					updateScreen();
					return false;
					break;
				case 0: 
					if (currentItem.parent == null) {
						onLeaving();
						return true;
					} else {
						currentItem = currentItem.parent;
						text = currentItem.content;
						appendMenu();
						updateScreen();
						return false;
					}
					break;
				default:
					var nci:INode = currentItem.children[id-1];
					var ret:Boolean = false;
					if (nci is ActionNode) {
						ret = (ActionNode(nci)).invoke(this, this.main.player);
					} else {
						if((MenuNode(nci)).canSwitchTo(main.player,subject,this)) {
							currentItem = nci;
						}
					}
					if(!abort)
						text = nci.content;
					if (!ret && !abort) {
						appendMenu();
					}
					updateScreen();
					return ret;
			}
			return false;
		}
		
		public function abortEncounter(text:String):void {
			abort = true;
			this.text = text;
			clearButtons();
			setButton(NEXT_BUTTON, "OK");
			main.endCombat(null);
		}
		
		public function appendMenu():void {
			text += "<ul>";
			if(currentItem.canGoBack)
				setButton(0, "BACK");
			for (var i:int = 0; i < currentItem.children.length; i++) {
				var nci:INode = currentItem.children[i];
				var showButton:Boolean = true;
				if (nci is ActionNode) {
					if (!(ActionNode(nci)).hasEnoughMoney(main.player))
						showButton=false;
				}
				text += "<li>";
				if (showButton)
				{
					text += "<b>";
					text += nci.name;
					setButton(i + 1, nci.name);
				} else {
					text += "<i>";
					text += nci.name;
					text += "</i><b>";
				}
				if (nci is ActionNode && (nci as ActionNode).cost!=-1)
					text += " (" + (nci as ActionNode).cost.toString() + "G)";
					
				text += "</b> - ";
				text += nci.description;
				text += "</li>";
			}
			text += "</ul>";
		}
		
		
		override public function getScreenText():String
		{
			return text;
		}
		
		public function performRape(ply:Creature,node:ActionNode):Boolean {
			main.startRape(null,this.subject,true);
			return true;	
		}
		
		public function fight(ply:Creature,node:ActionNode):Boolean {
			main.startCombat(null, this.subject, true);
			return true;	
		}
	}
}