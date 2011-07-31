package org.sevenchan.dongs 
{
	
	/**
	 * ...
	 * @author N3X15
	 */
	public interface INode 
	{
		
		function get name():String;
		function get description():String;
		function get parent():INode;
		function get children():Vector.<INode>;
		function pushChild(child:INode):void;
		function get content():String;
		function set content(val:String):void;
	}
	
}