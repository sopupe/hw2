package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.sevenchan.dongs.ui.LCDProgressBar;
	import org.sevenchan.dongs.ui.TinyButton;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Statistic extends Sprite implements IHovertextRecipient
	{
		private var label:String;
		private var hovertext:String;
		private var max:Number=100;
		private var val:Number = 0;
		private var d_max:Number = 0;
		private var d_val:Number = 0;
		public var showMax:Boolean = false;
		private var shown_max:Number = 0;
		private var shown_val:Number = 0;
		private var step:int = -1;
		
		private var lcdProgress:LCDProgressBar;
		private var txtLabel:TextField;
		private var btnAdd:TinyButton;
		private var btnRemove:TinyButton;
		
		private const goodColor:uint = 0x006600;
		private const normalColor:uint = 0x000000;
		private const badColor:uint = 0x660000;
		
		public var upIsGood:Boolean = true;
		
		// Blah: 100   (+)(-)
		// [================]
		public function Statistic(label:String,hovertext:String,showMax:Boolean=false) 
		{
			this.showMax = showMax;
			this.label = label;
			this.hovertext = hovertext;
			txtLabel = new TextField();
			txtLabel.htmlText = label + ": -";
			addChild(txtLabel);
			txtLabel.x = txtLabel.y = 0;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.color = normalColor;
			txtLabel.setTextFormat(tf);
			txtLabel.defaultTextFormat = tf;
			txtLabel.autoSize = "left";
			
			this.btnAdd = new TinyButton("+");
			addChild(btnAdd);
			this.btnRemove = new TinyButton("-");
			addChild(btnRemove);
			btnAdd.addEventListener(MouseEvent.CLICK, this.addWhatever);
			btnRemove.addEventListener(MouseEvent.CLICK, this.removeWhatever);
			btnAdd.y = btnRemove.y = 0;
			btnRemove.x = 124 - btnRemove.width;
			btnAdd.x = 124 - btnRemove.width - btnAdd.width - 3;
			btnAdd.bgColor = 0x003300;
			btnRemove.bgColor = 0x330000;
			btnAdd.alphaNormal = btnRemove.alphaNormal = 0.25;
			btnAdd.alphaHover = btnRemove.alphaHover = 0.90;
			btnAdd.draw();
			btnRemove.draw();
			btnAdd.alpha = btnRemove.alpha = btnAdd.alphaNormal;
			
			lcdProgress = new LCDProgressBar();
			addChild(lcdProgress);
			lcdProgress.y = txtLabel.textHeight + 3;
			lcdProgress.x = 0;
			lcdProgress.draw(0, 100, 20, 125);
		}
		
		private function addWhatever(e:MouseEvent):void {
			this.setValue(this.getValue() + 5);
		}
		
		private function removeWhatever(e:MouseEvent):void {
			this.setValue(this.getValue() - 5);
		}
		
		public function setHoverText(hovertext:String):void {
			this.hovertext = hovertext;
		}
		
		public function getHoverText():String {
			return this.hovertext;
		}
		
		public function setMax(max:Number, showAnimation:Boolean = true):void {
			this.max = max;
			
			if (this.val > max)
				this.val = max;
				
			doAnimation(showAnimation);
		}
		
		public function setValue(val:Number, showAnimation:Boolean = true):void {
			//trace(val);
			this.val = val;
			if (this.val > max)
				this.val = max;
			if (this.val < 0)
				this.val = 0;
			doAnimation(false);
		}
		
		public function getValue():Number {
			return val;
		}
		
		public function setMaxAndValue(max:Number, val:Number, showAnimation:Boolean = true):void {
			setMax(max, false);
			setValue(val, showAnimation);
		}
		
		private function doAnimation(showAnimation:Boolean):void {
			if (showAnimation) {
				step = 0;
				this.addEventListener(Event.ENTER_FRAME, this.frameListener);
			} else {
				d_max = shown_max = max;
				d_val = shown_val = val;
				lcdProgress.draw(shown_val,shown_max, 20, 125);
				txtLabel.text = label + ": " + shown_val;
				if (showMax)
					txtLabel.appendText("/" + shown_max);
			}
		}
		
		private function frameListener(e:Event):void {
			return;
			if (step == 100) { 
				step = -1; 
				this.removeEventListener(Event.ENTER_FRAME, this.frameListener);
				doAnimation(false);
			}
			shown_max = MathUtils.lerp((step / 100), d_max, max);
			shown_val = MathUtils.lerp((step / 100), d_val, val);
			var origColor:uint=normalColor;
			if (max > d_max) {
				if(upIsGood)
					origColor = goodColor;
				else
					origColor = badColor;
			} else if(max < d_max) {
				if(!upIsGood)
					origColor = goodColor;
				else
					origColor = badColor;
			}
			lcdProgress.color=MathUtils.lerpColor((step / 100), origColor, normalColor);
			lcdProgress.draw(shown_val, shown_max,20,125);
			txtLabel.text = label + ": " + shown_val;
		}
	}

}