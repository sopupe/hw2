package org.sevenchan.dongs.ui 
{
	import flash.display.SimpleButton;    
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	
	/**
	 * Black, translucent, rounded button with text.
	 * @author Harbinger
	 */
	public class SexButton extends Sprite 
	{
		public var size:Number;
		public var bgColor:uint = 0x000000;
		public var fgColor:uint = 0xffffff;
		private var textControl:TextField = new TextField();
		private const padding:Number = 6;
		public const alphaNormal:Number = 0.90;
		public const alphaHover:Number = 0.75;
		
		public function SexButton(_size:Number,text:String) 
		{
			this.size = _size;
			this.textControl.text = text;
			this.textControl.textColor = 0xffffff;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.CENTER;
			this.textControl.setTextFormat(tf);
			
			addChild(textControl);
			this.textControl.width = _size;
			this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
			draw();
		}
		
		public function setText(text:String):void {
			textControl.text = text;
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.CENTER;
			this.textControl.setTextFormat(tf);
			
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