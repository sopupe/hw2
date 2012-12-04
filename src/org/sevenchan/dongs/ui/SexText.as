package org.sevenchan.dongs.ui 
{
	import flash.display.SimpleButton;    
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldType;
	import flash.utils.Timer;
	import org.sevenchan.AdventureController;
	
	/**
	 * White, translucent, rounded text control.
	 * @author Harbinger
	 */
	public class SexText extends Sprite 
	{
		public var xRatio:Number = 0;
		public var yRatio:Number = 0;
		public var hRatio:Number = 0;
		public var wRatio:Number = 0;
		public var size:Number;
		public var bgColor:uint = 0xffffff;
		public var fgColor:uint = 0x000000;
		private var textControl:TextField = new TextField();
		private const padding:Number = 6;
		// Flipped
		public const alphaNormal:Number = 0.75;
		public const alphaHover:Number = 0.90;
		
		public function SexText(_size:Number,text:String) 
		{
			this.size = _size;
			this.textControl.text = text;
			this.textControl.textColor = 0x666666;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.LEFT;
			textControl.type = TextFieldType.INPUT;
			this.textControl.setTextFormat(tf);
			
			addChild(textControl);
			this.textControl.width = _size;
			//this.addEventListener(KeyboardEvent.KEY_DOWN, this.relayKeyDown);
			addEventListener(MouseEvent.CLICK, this.setFocus);
			this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
			draw();
		}
		public function dynamicResize(main:AdventureController):void
		{
			this.x = xRatio * main.currentWidth;
			this.y = (yRatio*main.currentHeight) - this.height;
			height = (30 / 600) * main.currentHeight;
			width = (size / 800) * main.currentWidth;
		}
		
		public function setPosition(main:AdventureController,x:Number, y:Number):void
		{	
			this.xRatio = x / 800;
			this.yRatio = y / 600;
			this.dynamicResize(main);
		}
		
		public function setText(text:String):void {
			textControl.text = text;
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.CENTER;
			this.textControl.setTextFormat(tf);
			
		}
		
		public function getText():String { return textControl.text; }
		
		private function setFocus(e:MouseEvent):void {
			stage.focus = textControl;
		}
		
		private function relayKeyDown(e:KeyboardEvent):void {
			textControl.dispatchEvent(e);
		}
		
		private function onMouseOver(e:MouseEvent):void {
			this.alpha = alphaHover;
			this.mouseChildren = false;
		}
		private function onMouseOut(e:MouseEvent):void {
			this.alpha = alphaNormal;
		}
		
		public function draw():void {
			graphics.beginFill(this.bgColor);
			textControl.height = textControl.textHeight+3;
			textControl.width = textControl.textWidth;
			if (textControl.width < size)
			{
				textControl.width = size;
			}
			var w:Number = textControl.width + (padding * 2);
			var h:Number = textControl.height + (padding * 2);
			graphics.drawRoundRectComplex(0, 0, w, h, 5, 5, 5, 5);
			textControl.x = (w / 2) - (textControl.width / 2);
			textControl.y = (h / 2) - (textControl.height / 2);
			graphics.endFill();
			this.alpha = alphaNormal;
		}
		
	}

}