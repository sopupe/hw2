package org.sevenchan.dongs.ui 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author N3X15
	 */
	public class LCDProgressBar extends Sprite
	{
		public static const opacity:Number = 0.5;
		public var color:uint = 0x000000;
		public function LCDProgressBar() 
		{
		}
		
		public function draw(steps:Number, max:Number, h:Number, w:Number):void {
			//trace("Drawing: {x:"+x+", y:"+y+", h:"+h+", w:"+w+"}");
			graphics.clear();
			graphics.lineStyle(2, 0x000000, opacity);
			graphics.moveTo(0, 0);
			graphics.lineTo(w, 0);
			graphics.lineTo(w, h);
			graphics.lineTo(0, h);
			graphics.lineTo(0, 0);
			graphics.lineStyle();
			
			graphics.beginFill(0x000000, opacity);
			graphics.drawRect(3, 3, (steps/max)*(w - 6), h - 6);
			graphics.endFill();
		}
		
	}

}