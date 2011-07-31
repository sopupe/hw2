package
{
	import flash.display.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.events.*;
	import flash.net.*;
	import mx.events.FlexEvent;
	import mx.preloaders.*;
	import mx.preloaders.IPreloaderDisplay;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Preloader extends Sprite implements IPreloaderDisplay
	{
		private var txtLoading:TextField;
		private var graphicLoader:Sprite = new Sprite();
		private var bgcolor:Sprite = new Sprite();
		private var c:Number = 0; // angle.
		private var percentDone:Number = 0;
		
		public function Preloader()
		{
			super();
			if (stage)
			{
			}
		}
		
		// Specify the event listeners.
		public function set preloader(preloader:Sprite):void
		{
			// Listen for the relevant events
			preloader.addEventListener(Event.ENTER_FRAME, onFrame);
			preloader.addEventListener(ProgressEvent.PROGRESS, handleProgress);
			preloader.addEventListener(Event.COMPLETE, handleComplete);
			preloader.addEventListener(FlexEvent.INIT_PROGRESS, handleInitProgress);
			//preloader.addEventListener(FlexEvent.INIT_COMPLETE, handleInitComplete);
		}
		
		// Initialize the Loader control in the override 
		// of IPreloaderDisplay.initialize().
		public function initialize():void
		{
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			//stage.align = StageAlign.TOP_LEFT;
			
			// Background
			bgcolor.graphics.clear();
			bgcolor.graphics.beginFill(0x000000, 1);
			bgcolor.graphics.drawRect(0, 0, stageWidth, stageHeight);
			addChildAt(bgcolor, 0);
			
			// Circular Loader
			addChild(graphicLoader);
			graphicLoader.width = stage.stageWidth;
			graphicLoader.height = stage.stageHeight;
			graphicLoader.x = 0;
			graphicLoader.y = 0;
			stage.addEventListener(Event.RESIZE, resizeBGWithStage);
			
			txtLoading = new TextField();
			txtLoading.text = "0%";
			addChild(txtLoading);
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";
			tf.size = "22";
			txtLoading.setTextFormat(tf);
			txtLoading.textColor = 0xffffff;
		}
		
		private function onFrame(e:Event):void
		{
			draw();
		}
		
		private function resizeBGWithStage(e:Event):void
		{
			try
			{
				bgcolor.width = stageWidth;
				bgcolor.height = stageHeight;
				bgcolor.graphics.beginFill(0x000000, 1);
				bgcolor.graphics.drawRect(0, 0, stageWidth, stageHeight);
				
				graphicLoader.x = 0;
				graphicLoader.y = 0;
				graphicLoader.width = stageWidth;
				graphicLoader.height = stageHeight;
				
				txtLoading.x = (stageWidth / 2) - (txtLoading.width / 2);
				txtLoading.y = (stageHeight / 2) - (txtLoading.height / 2);
			}
			catch (e)
			{
			}
		}
		
		private function handleProgress(e:ProgressEvent):void
		{
			txtLoading.text = ((e.bytesLoaded / e.bytesTotal) * 100) + "%";
			draw();
			c = Math.round((e.bytesLoaded / e.bytesTotal) * 100 * (-1.84));
		}
		
		private function draw():void {
			
			
			var glow:GlowFilter = new GlowFilter();
			glow.color = 0xffffff;
			glow.alpha = 1;
			glow.blurX = 25;
			glow.blurY = 25;
			
			graphicLoader.graphics.clear();
			
			graphicLoader.graphics.lineStyle(1, 0xffffff, 1);
			var center_x:Number = stage.stageWidth / 2;
			var center_y:Number = stage.stageHeight / 2;
			graphicLoader.graphics.moveTo(center_x, center_y);
			var fp:Boolean = false;
			for (var i:Number = 0; i >= c; i--)
			{
				x = Math.sin(Math.PI / 90 * i) * 100 + center_x;
				y = Math.cos(Math.PI / 90 * i) * 100 + center_y;
				graphicLoader.graphics.lineTo(x, y);
			}
			
			graphicLoader.filters = new Array(glow);
		}
		
		private function handleComplete(event:Event):void
		{
			//loadingFinished();
		}
		
		private function handleInitProgress(event:Event):void
		{
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void
		{
		}
		
		private function loadingFinished():void
		{
			//removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			removeChild(txtLoading);
			
			startup();
		}
		
		private function startup():void
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as DisplayObject);
		} // Implement IPreloaderDisplay interface
		
		public function get backgroundColor():uint
		{
			return 0x000000;
		}
		
		public function set backgroundColor(value:uint):void
		{
		}
		
		public function get backgroundAlpha():Number
		{
			return 1;
		}
		
		public function set backgroundAlpha(value:Number):void
		{
		}
		
		public function get backgroundImage():Object
		{
			return undefined;
		}
		
		public function set backgroundImage(value:Object):void
		{
		}
		
		public function get backgroundSize():String
		{
			return "";
		}
		
		public function set backgroundSize(value:String):void
		{
		}
		
		public function get stageWidth():Number
		{
			return 800;
		}
		
		public function set stageWidth(value:Number):void
		{
		}
		
		public function get stageHeight():Number
		{
			return 600;
		}
		
		public function set stageHeight(value:Number):void
		{
		}
	
	}

}