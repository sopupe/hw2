package org.sevenchan.dongs.bodyparts 
{
	import org.sevenchan.dongs.*;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.screens.InfoScreen;
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Leg implements IBodyPart
	{
		registerClassAlias("P_Leg", Leg);
		public static const HUMAN:Leg = new Leg("human");
		
		private var _name:String;
		public function Leg(name:String="") 
		{
			_name = name;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function getDescr(num:Number, host:Creature):String {
			return num + " " + name + " leg"+((num>1)?"s":"");
		}
		public function onFailedAttack(from:Creature, to:Creature):void
		{
			if (from is Player)
				InfoScreen.push(to.gender.doReplace("<p>You attempt to kick the " + to.getTypeName() + ", but %SUB% moves too quickly and evades the attack!</p>"));
			else
				InfoScreen.push(from.gender.doReplace("<p>%CSUB% attempts to kick you, but you move too quickly and evade the attack!</p>"));
		}
		public function onGoodAttack(from:Creature, to:Creature):void{
			var dmg:Number = Math.max(7, from.strength - to.strength);
			var txt:String = "";
			if (from is Player) {
				txt=MathUtils.getRandomEntry([
					"You deliver a powerful round kick to the " + to.getTypeName(),
					"You kick the " + to.getTypeName(),
					"The "+to.getTypeName()+" gets a foot to the face",
				]);
				InfoScreen.push(to.gender.doReplace("<p>"+txt+", dealing " + dmg + " damage!</p>"));
			} else {
				txt=MathUtils.getRandomEntry([
					"%CSUB% kicks you",
					"You discover how "+from.getTypeName()+" feet taste",
					"One of %SUB%'s kicks finds your face",
				]);
				InfoScreen.push(from.gender.doReplace("<p>"+txt+", causing " + dmg + " damage!</p>"));
			}
			trace("["+getDescr(1,from)+"] BEFORE: "+to.HP);
			to.HP -= dmg;
			trace("["+getDescr(1,from)+"] AFTER: "+to.HP);
		}
	}

}