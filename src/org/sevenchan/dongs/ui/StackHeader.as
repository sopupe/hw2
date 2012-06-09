package org.sevenchan.dongs.ui 
{
	import flash.display.Sprite;
	import flash.text.*;
	/**
	 * ...
	 * @author Harbinger
	 */
	public class StackHeader extends Sprite //implements IHovertextRecipient 
	{
		private var textContent:TextField = new TextField();
		public function StackHeader(text:String) 
		{
			addChild(textContent);
			this.textContent.width = 125;
			this.textContent.x = 0;
			this.textContent.y = 0;
			textContent.text = text;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.align = TextFormatAlign.CENTER;
			tf.size = 20;
			this.textContent.setTextFormat(tf);
			this.textContent.height = textContent.textHeight + 4;
			draw();
		}
		
		
		public function draw():void {
			graphics.clear();
			graphics.lineStyle(1,0x000000, 0.35);
			graphics.moveTo(0, this.textContent.y + this.textContent.height);
			graphics.lineTo(124,this.textContent.y + this.textContent.height);
			graphics.lineStyle();
		}
	}

}