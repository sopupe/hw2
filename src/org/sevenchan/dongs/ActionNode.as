package org.sevenchan.dongs 
{
	import org.sevenchan.dongs.screens.Encounter;
	/**
	 * Calls a function instead of spewing a bunch of text and giving you a menu.
	 * @author ...
	 */
	public class ActionNode implements INode
	{
		private var _parent:INode=null;
		private var _children:Vector.<INode> = new Vector.<INode>();
		private var _name:String;
		private var _desc:String;
		private var _cost:int;
		public var callback:Function;
		private var _content:String = "[?]";
		public function ActionNode(parent:INode,name:String,cost:int,desc:String,callback:Function) 
		{
			this._name = name;
			this._desc = desc;
			this._parent = parent;
			this.callback = callback;
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
		public function get parent():INode {
			return _parent;
		}
		public function set content(value:String):void {
			_content=value;
		}
		
		public function pushChild(c:INode):void {
			_children.push(c);
		}
		
		public function invoke(context:Encounter,ply:Creature):Boolean {
			return callback.call(context, ply, this);
		}
		
		public function hasEnoughMoney(ply:Creature):Boolean {
			return ply.gold >= _cost;
		}
	}
}