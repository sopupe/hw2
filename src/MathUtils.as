package {
	public class MathUtils {
		public static function lerp(value:Number, a:Number, b:Number):Number 
		{
		   var o:Number = value * (b - a) + a;
		   return o;
		}
		
		public static function lerpColor(value:Number,_a:uint, _b:uint):uint {
			//var a_a:uint = a >> 24 & 0xFF;
			var r_a:uint = _a >> 16 & 0xFF;
			var g_a:uint = _a >> 8 & 0xFF;
			var b_a:uint = _a & 0xFF;

			//var a_b:uint = b >> 24 & 0xFF;
			var r_b:uint = _b >> 16 & 0xFF;
			var g_b:uint = _b >> 8 & 0xFF;
			var b_b:uint = _b & 0xFF;

			var r:Number = lerp(value, r_a, r_b);
			var g:Number = lerp(value, g_a, g_b);
			var b:Number = lerp(value, b_a, b_b);
			
			return r << 16 | g << 8 | b;
		}
		
		public static function inchesToFootInches(_in:int):String {
			var inches:Number = _in % 12;
			var feet:Number = Math.round(_in / 12);
			var out:String = inches + "\"";
			if (feet > 0) {
				out =feet + "' " + out;
			}
			return out;
		}
		
		public static function rand(from:Number, to:Number, round:Boolean=true):Number {
			var o:Number =  (Math.random() * (to - from)) + from;
			if (round)
				o = Math.round(o);
			return o;
		}
		
		public static function fmtMilliLiters(ml:Number, returnFirst:Boolean = false):String {
			var txt:Array = [];
			var amt:Number = ml;
			var gottxt:Boolean = false;
			
			//1 gallon [US, liquid] = 3 785.411 784 milliliter
			var gal:Number = Math.round(amt / 3785);
			if(gal>0 && !gottxt) {
				txt.push(Math.round(gal)+" gallon"+((gal>1)?"s":""));
				amt %= 3785;
				if (returnFirst)gottxt = true;
			}
			//1 quart [US, liquid] = 946.352 946 milliliter
			var quart:Number = Math.round(amt / 946);
			if(quart>0 && !gottxt) {
				txt.push(Math.round(gal)+" quart"+((quart>1)?"s":""));
				amt %= 946;
				if (returnFirst)gottxt = true;
			}
			
			//1 cup [US] = 236.588 236 5 milliliter
			var cup:Number = Math.round(amt / 237);
			if(cup>0 && !gottxt) {
				txt.push(Math.round(cup)+" cup"+((cup>1)?"s":""));
				amt %= 237;
				if (returnFirst)gottxt = true;
			}
			
			//1 Tablespoon [US] = 14.786 764 781 milliliter
			var Tsp:Number = Math.round(amt / 15);
			if(Tsp>0 && !gottxt) {
				txt.push(Math.round(Tsp)+" tablespoon"+((Tsp>1)?"s":""));
				amt %= 15;
				if (returnFirst)gottxt = true;
			}
			
			if (returnFirst)
				return txt[0] + " (" + ml + " ml)";
			else 
				return txt.join(", ") + " (" + ml + " ml)";
			
		}
		
		public static function getRandomArrayEntry(arr:Array):* {
			var idx:int = rand(0, arr.length - 1);
			trace(0, arr.length - 1, "=", idx);
			return arr[idx];
		}
		
		public static function getRandomVectorEntry(arr:Vector.<*>):* {
			var idx:int = rand(0, arr.length - 1);
			trace(0, arr.length - 1, "=", idx);
			return arr[idx];
		}
		
		public static function getRandomObjectEntry(o:Object):* {
			var ab:Array = [];
			for (var k:String in o) {
				ab.push(o[k]);
			}
			return getRandomArrayEntry(ab);
		}
		
		public static function lengthOf(o:Object):int {
			var i:int = 0;
			for (var k:String in o) {
				i++;
			}
			return i;
		}
	}
}