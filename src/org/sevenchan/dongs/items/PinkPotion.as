package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.bodyparts.Breast;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class PinkPotion extends Potion 
	{
		
		public function PinkPotion(num:uint = 0) 
		{
			super(num);
			this.setDescr("pink, milky");
			this.id = 5;
			this.name = "Pink Potion";
			this.value = 250;
		}
		
		override public function copy():Item 
		{
			return new PinkPotion(amount);
		}
		
		override public function Use(host:Creature):Boolean 
		{
			var text:String = 
			"<h2>Use Pink Potion</h2><p>You cautiously raise the vial to your nose, sniffing it.  It " 
			+"smells... Well, you can't really describe it, but it makes your mouth water in " 
			+"anticipation.  Without further hesitation, you gulp down the contents.  The warm liquid " 
			+"rushes down your throat, tasting like warm milk but somehow sweeter.  Tossing the used " 
			+"flask behind you without even reading the label, you stand there expectantly, waiting " 
			+"for the effects to take hold.  After a few minutes nothing happens, and you sigh sadly. " 
			+" &quot;Well, that was a waste,&quot;  You grumble.</p>" 
			+"<p>Returning home, you step into your tent to change when you begin to feel dizzy.  Holding " 
			+"onto a wall, you stumble over to a mirror.  Your shirt feels tight against your skin, so " 
			+"you remove it as fast as you can.  Your eyes open wide as your look at your chest and notice that your" 
			+host.getBreastDescr() + " have changed to become ";
			if(!host.breasts.length==0) {
				host.addBoob();
				host.addBoob();
			} else {
				host.breasts.forEach(embiggen);
			}
			text += host.getBreastDescr() + ".  The extra weight pulls you forward a bit, and they wobble ";
			text += "slightly.  You hold them in your hands and rub them gently, feeling their larger size.</p>";
			text += "<i>TODO: Do something smexy.  Have an idea? Drop it in the thread.</i>";
			InfoScreen.push(text);
			return true;
		}
		
		private function embiggen(obj:Object):void {
			(obj as Breast).bigger();
		}
	}

}