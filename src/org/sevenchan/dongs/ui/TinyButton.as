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
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class TinyButton extends Sprite implements IHovertextRecipient 
	{
		public var bgColor:uint = 0x000000;
		public var fgColor:uint = 0xffffff;
		private var textControl:TextField = new TextField();
		private const padding:Number = 6;
		public var alphaNormal:Number = 0.90;
		public var alphaHover:Number = 0.75;
		
		public function TinyButton(text:String) 
		{
			this.textControl.text = text;
			this.textControl.textColor = 0xffffff;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.CENTER;
			this.textControl.setTextFormat(tf);
			
			addChild(textControl);
			this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
			this.alpha = alphaNormal;
			draw();
		}
		
		public function setText(text:String):void {
			textControl.text = text;
		}
		
		private function onMouseOver(e:MouseEvent):void {
			this.alpha = alphaHover;
			this.mouseChildren = false;
		}
		private function onMouseOut(e:MouseEvent):void {
			this.alpha = alphaNormal;
		}
		
		public function draw():void {
			graphics.clear();
			graphics.beginFill(this.bgColor);
			textControl.height = textControl.textHeight+4;
			textControl.width = textControl.textWidth+3.5;
			var w:Number = 16;
			var h:Number = 16;
			textControl.x = (w / 2) - (textControl.width / 2);
			textControl.y = (h / 2) - (textControl.height / 2);
			graphics.drawCircle(w/2, h/2, w/2);
			graphics.endFill();
		}
		
		/* INTERFACE IHovertextRecipient */
		
		public function setHoverText(text:String):void 
		{
			
		}
		
		public function getHoverText():String 
		{
			return "";
		}
		
	}

}