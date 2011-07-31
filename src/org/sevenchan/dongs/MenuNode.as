package org.sevenchan.dongs 
{
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
		public function MenuNode(parent:INode,name:String,desc:String) 
		{
			this._name = name;
			this._desc = desc;
			this._parent = parent;
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
		
		public function pushChild(c:INode):void {
			_children.push(c);
		}
	}

}