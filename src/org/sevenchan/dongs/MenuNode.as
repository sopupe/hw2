package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.screens.Encounter;
	/**
	 * ...
	 * @author ...
	 */
	public class MenuNode implements INode
	{
		private var _parent:INode=null;
		private var _children:Vector.<INode> = new Vector.<INode>();
		private var _name:String;
		private var _desc:String;
		private var _content:String = "[?]";
		private var conditionalCallback:Function = null;
		public function MenuNode(parent:INode,name:String,desc:String, conditionalCallback:Function=null) 
		{
			this._name = name;
			this._desc = desc;
			this._parent = parent;
			this.conditionalCallback = conditionalCallback;
		}
		
		public function get name():String {
			return _name;
		}
		public function get description():String {
			return _desc;
		}
		public function get children():Vector.<INode> {
			return _children;
		}
		public function get content():String {
			return _content;
		}
		public function set content(value:String):void {
			_content=value;
		}
		public function get parent():INode {
			return _parent;
		}
		
		public function canSwitchTo(ply:Creature, otherCreature:Creature, context:Encounter):Boolean {
			if(conditionalCallback==null)
				return true;
			else
				return conditionalCallback.call(context, ply, otherCreature, this);
		}
		
		public function pushChild(c:INode):void {
			_children.push(c);
		}
		
		public function pushMenu(name:String, desc:String, conditionalCallback:Function=null):MenuNode {
			var n:MenuNode = new MenuNode(this, name, desc, conditionalCallback);
			pushChild(n);
			return n;
		}
		
		public function pushAction(name:String, cost:int, desc:String, callback:Function, arg:*=null):ActionNode {
			var n:ActionNode = new ActionNode(this, name, cost, desc, callback,arg);
			pushChild(n);
			return n;
		}
		
		public function clearChildren():void {
			children.splice(0, children.length);
		}
	}

}