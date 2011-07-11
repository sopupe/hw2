package org.sevenchan.dongs.items 
{
	import org.sevenchan.dongs.bodyparts.Testicle;
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.InfoScreen;
	
	/**
	 * ...
	 * @author N3X15
	 */
	public class SpiderEgg extends Item 
	{
		
		public function SpiderEgg(num:uint = 0) 
		{
			super(num);
			this.descr = "An unfertilized, black spider egg.";
			this.id = 7;
			this.name = "Spider Egg";
			this.value = 250;
		}
		
		override public function copy():Item 
		{
			return new SpiderEgg(amount);
		}
		
		override public function Use(ply:Creature):Boolean 
		{
			if(ply.gender.hasDick) {
				var amtCum:Number = 0;
				for (var i:int = 0; i < ply.balls.length; i++) {
					(ply.balls[i] as Testicle).loadMult -= 1;
					var t:Testicle = ply.balls[i];
					amtCum+=t.loadMult * t.normalLoad;
				}
				var text:String = "<h2>Eat spider egg</h2>";
				text += "<p>You cautiously bite into the leathery, black egg, immediately producing a disgusting torrent of foul taste into your mouth.  You force yourself to swallow, nearly gagging.  Pain in your nether regions signals that something happened to your balls.</p>";
				text += "<p><b>Your semen output has decreased by 1, bringing your total seminal volume to " + MathUtils.fmtMilliLiters(amtCum) + ".</b></p>";
				text += "<p>You will now gain lust slower.</p>";
				InfoScreen.push(text);
				return true;
			}
			return false;
		}
	}

}