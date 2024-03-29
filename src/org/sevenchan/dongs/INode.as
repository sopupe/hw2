package org.sevenchan.dongs 
{
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public interface INode 
	{	
		function get name():String;
		function get description():String;
		function get parent():INode;
		function get children():Vector.<INode>;
		function pushChild(child:INode):void;
		function clearChildren():void;
		function pushMenu(name:String, desc:String, conditionalCallback:Function = null):MenuNode;
		function pushAction(name:String, cost:int, desc:String, callback:Function, arg:*=null):ActionNode;
		function get content():String;
		function set content(val:String):void;
		function get canGoBack():Boolean;
		function set canGoBack(value:Boolean):void;
	}
	
}