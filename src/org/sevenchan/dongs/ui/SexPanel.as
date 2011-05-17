package org.sevenchan.dongs.ui 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import mx.controls.VScrollBar;
	import flash.events.MouseEvent;
	import flash.geom.*;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import mx.core.Application;
	//import classes.Scroller.Scroller;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class SexPanel extends MovieClip 
	{
		public var bgColorTop:uint = 0x999999;
		public var bgColorMain:uint = 0xcccccc;
		public var fgColor:uint = 0x000000;
		private var textControl:TextField = new TextField();
		private const padding:Number = 4;
		public const alphaNormal:Number = 0.90;
		public const alphaHover:Number = 0.75;
		private var stackedControls:Array = new Array();
		private var scrollUp:TinyButton = new TinyButton("˄");
		private var scrollDown:TinyButton = new TinyButton("˅");
		private var bounds:Rectangle;
		private var bgpanel:Sprite = new Sprite();
		
		public function SexPanel(text:String) 
		{
			this.textControl.htmlText = text;
			this.textControl.textColor = fgColor;
			
			//this.alpha = alphaNormal;
			
			addChild(bgpanel);
			addChild(textControl);
			
			var style:StyleSheet = new StyleSheet();
			style.parseCSS("" +
			"h2 { font-size:24;font-weight:bold;padding-bottom:32px;font-family:'Georgia','Times New Roman',_serif;}"+
			"p,li { font-family:'Georgia','Times New Roman',_serif;font-size:14;margin-bottom:1em; }" +
			"a {color:#0000ff;text-decoration:underline;}");
			textControl.styleSheet = style;
			this.textControl.multiline = true;
			this.textControl.wordWrap = true;
			textControl.alpha = 0.9;
			this.alpha = 0.9;
			
			addChild(scrollUp);
			addChild(scrollDown);
			
			scrollUp.addEventListener(MouseEvent.CLICK, this.upScroll);
			scrollDown.addEventListener(MouseEvent.CLICK, this.downScroll);
			textControl.addEventListener(MouseEvent.MOUSE_WHEEL, this.wheelScroll);
		}
		
		public function get text():String {
			return textControl.htmlText;
		}
		public function set text(value:String):void {
			textControl.text = "";
			textControl.htmlText = value
				.replace(/<\/p>/g, "</p><br />")
				.replace(/<\/h2>/g,"</h2><br />")
				.replace(/<\/ul>/g,"</ul><br />")
				.replace(/(\r?)\n/g,"")
				.replace(/\t/g,"");
			textControl.alpha = 1;
			updateScrollers();
		}
		
		public function updateScrollers():void {
			scrollUp.visible = (textControl.scrollV > 1);
			scrollDown.visible = (textControl.scrollV < textControl.maxScrollV);
		}
		
		public function stackMode():void {
			removeChild(textControl);
		}
		
		public function addToStack(_do:DisplayObject):void {
			addChild(_do);
			stackedControls.push(_do);
			//arrangeStack();
		}
		
		public function delFromStack(_do:DisplayObject):void {
			removeChild(_do);
			delete stackedControls[stackedControls.indexOf(_do)];
			//arrangeStack();
		}
		
		public function arrangeStack():void {
			var bottom:Number = 0;
			for (var i:int = 0; i < stackedControls.length; i++) {
				var o:DisplayObject = stackedControls[i];
				o.x = (this.width/2)-(o.width/2);
				o.y = bottom;
				bottom += o.height + padding;
				//o.width = width;
			}
		}
		
		public function draw(h:Number, w:Number):void {
			graphics.clear();
			doGradFilled(0, 0, h, w);
			textControl.height = h - (padding * 2);
			
			textControl.width = w-(padding * 2);
			textControl.x = (w / 2) - (textControl.width / 2);
			textControl.y = (h / 2) - (textControl.height / 2)
			
			
			scrollUp.x = scrollDown.x = width - scrollUp.width;
			
			scrollUp.y = 3;
			scrollDown.y = height - scrollDown.width;
			updateScrollers();
		}
		
		private function upScroll(event:MouseEvent):void
		{
			trace(textControl.scrollV);
			textControl.scrollV -= 1;
			updateScrollers();
		}
		
		private function wheelScroll(e:MouseEvent):void {
			updateScrollers();
		}
		
		private function downScroll(event:MouseEvent):void
		{
			trace(textControl.scrollV);
			textControl.scrollV += 1;
			updateScrollers();
		}
		
		public function doGradFilled(x:Number, y:Number, h:Number, w:Number):void {
			
			bgpanel.graphics.clear();
			var fillType:String = "linear";
			var colors:Array = [bgColorTop, bgColorMain];
			var alphas:Array = [1, 1];
			var ratios:Array = [0, 128];
			var matrix:Matrix = new Matrix();
			var gradWidth:Number = w;
			var gradHeight:Number = h;
			var gradRotation:Number = 90 / 180 * Math.PI; // rotation expressed in radians
			var gradOffsetX:Number = 0;
			var gradOffsetY:Number = 0;

			matrix.createGradientBox(gradWidth, gradHeight, gradRotation, gradOffsetX, gradOffsetY);
			var spreadMethod:String = "pad";
			bgpanel.graphics.lineStyle(1, 0x000000, 1);
			bgpanel.graphics.beginGradientFill(fillType, colors, alphas, ratios, matrix, spreadMethod);
			bgpanel.graphics.drawRoundRect(0, 0, w,h,5,5);
			bgpanel.graphics.endFill();
			bgpanel.graphics.lineStyle();
			
			bgpanel.x = x;
			bgpanel.y = y;
		}
	}

}