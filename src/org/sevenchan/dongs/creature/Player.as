package org.sevenchan.dongs.creature 
{
	import com.adobe.serialization.json.*;
	import flash.events.Event;
	import flash.net.*;
	import org.sevenchan.dongs.ability.Instawin;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.*;
	import flash.utils.*;
	import org.sevenchan.dongs.enchantment.Enchantment;
	import org.sevenchan.dongs.screens.CombatScreen;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Player extends Creature
	{
		private var f:FileReference = new FileReference();
		private var baseType:Creature = new Human();
		private var saveFile:FileReference = null;
		private var waitingForLoad:Boolean = false;
		private var cancelled:Boolean = false;
		public var currentTown:Town = Town.knownTowns["barn"];
		public var main:Main;
		
		public function Player(main:Main) 
		{
			this.main = main;
			trace("Player.init()");
		}
		
		public function changeTo(t:Creature):void {
			var tmp:Creature = baseType;
			baseType = t;
			baseType._speed = tmp._speed;
			baseType._strength = tmp._strength;
			baseType.abilities = tmp.abilities;
			baseType.enchantments = tmp.enchantments;
			baseType.explored = tmp.explored;
			baseType.gender = tmp.gender;
			baseType.gold = tmp.gold;
			baseType.height = tmp.height;
			baseType.HP = tmp.maxHP;
			baseType.ownName = tmp.ownName;
			baseType.sensitivity = tmp.sensitivity;
			baseType.sexualPreference = tmp.sexualPreference;
			baseType.inventory = tmp.inventory;
			
			baseType.performConversion(tmp);
		}
		
		
		
		override public function getExplored(loc:String):Boolean {
			for (var i:int = 0; i < baseType.explored.length; i++) {
				if (baseType.explored[i] == loc)
					return true;
			}
			return false;
		}
		
		override public function setExplored(loc:String):void {
			if (getExplored(loc)) return;
			baseType.explored.push(loc);
		}
		
		public function save():void {
			var f:FileReference = new FileReference();
			var ba:ByteArray = new ByteArray();
			ba.writeObject(
			{
				currentTown: currentTown.ID,
				body: baseType
			}
			);
			f.save(ba, "save.dat");
		}
		
		public function load():Boolean {
			
			waitingForLoad = true;
			f.addEventListener(Event.SELECT, onFileSelected);
			f.addEventListener(Event.CANCEL, onFileCancelled);
			if (!f.browse([new FileFilter("Saves","*.dat")]))
				return false;
			return true;
		}
		
		private function onFileSelected(e:Event):void {
			f.addEventListener(Event.COMPLETE, onFileLoaded);
			f.load();
		}
		
		private function onFileLoaded(e:Event):void {
			var saveData:Object = f.data.readObject();
			this.currentTown = Town.knownTowns[saveData.currentTown];
			this.baseType = saveData.body;
			main.onPlayerLoaded();
		}
		
		private function onFileCancelled(e:Event):void {
		}
		
		override public function initialGenderSetup():void 
		{
			baseType.initialGenderSetup();
		}
		
		override public function yourMove(cs:CombatScreen, ply:Creature):void 
		{
		}
		
		public override function getDescription():String {
			var descr:String = "<h2>Appearance</h2>";
			// You, Charles Cockhammer, are a gay human male of average height and build.  You also possess a long, flowing mane of golden hair, 
			// which contrasts nicely with your blue eyes and light skin.
			//
			// In the equipment department, you're not too odd.  You have two human testicles swinging between your legs, paired with 
			// a single, 5.5" human schlong.  Your breasts are flat, but well-sculpted human pecs, and you have a standard-issue male 
			// ass with a standard-issue virgin male asshole between its buns.  You've got two human arms, two human legs. 
			//
			// In other words, you're an average human, which probably won't last long down here.
			//
			descr += "<p>You, " + baseType.ownName + ", are " + Utils.A(baseType.sexualPreference.label) + " " + baseType.gender.label + " " + baseType.getTypeName() + " " + baseType.build.getDescription()
			+" You also possess " + baseType.hair.getDescription();
			
			if (baseType.hair == Hair.BALD)
				descr += ", your glistening scalp distracting from your ";
			else
				descr += ", which constrasts nicely with your ";
			if(baseType.eyes.length == 0)
				descr += " complete lack of eyes (<b>and resulting blindness</b>)";
			else
				descr += baseType.getEyesDescr();
			
			descr += " and " + baseType.skin.getDescr(0, this);
			descr += "</p>";
			
			descr += "<p>In the equipment department, ";
			//if (baseType.customized)
			//	descr += "you're a bit different from the average bear.  ";
			//else
				descr += "you're not too odd, compared to other "+baseType.getTypeName()+"s.  ";
			var haveBalls:Boolean = (baseType.balls.length > 0);
			var haveDicks:Boolean = (baseType.dicks.length > 0);
			var haveVags:Boolean = (baseType.vaginas.length > 0);
			if (haveBalls && haveDicks)
				descr += "You have " + baseType.getTesticleDescr() + " swinging between your legs, paired with " + baseType.getDickDescr() + ".";
			if (!haveBalls && haveDicks)
				descr += "No testicles rub between your thighs when you walk, but you do have " + baseType.getDickDescr() + ".";
			if (haveBalls && !haveDicks)
				descr += "You don't have a dick, but you do have " + baseType.getTesticleDescr() + ".  <b>Because of a lack of an outlet for semen, you cannot masturbate, so your balls fill with semen, out of control.</b>";
			
			if (haveVags)
				descr += "Your body possesses " + baseType.getVagDescr() + ".";
			
			if (!haveBalls && !haveDicks && !haveVags)
				descr += "You don't have any sexual organs, so you can't masturbate.  On the bright side, you won't get horny, either.";
			
			
			if (baseType.breasts.length > 0)
				descr += "You have " + baseType.getBreastDescr() + ", and you wear ";
			else
				descr += "You don't have any breasts, but you do have ";
			descr += baseType.getAssDescr() + ".";
			
			if (baseType.arms.length > 0)
					descr += "You have "+baseType.getArmsDescr()+", ";
			else
				descr += "You don't have any arms (<b>and therefore can't attack</b>), ";
			
			if (baseType.legs.length > 0) {
					if (baseType.arms.length == 0)
						descr += "but you DO have ";
					else 
						descr += "and ";
					descr += baseType.getLegsDescr()+".";
			} else
				descr += "and no legs (<b>so you can't dodge attacks</b>).";
			descr += "</p>";
			
			return baseType.gender.doReplace(descr);
		}
		
		override public function getTypeName():String 
		{
			return baseType.getTypeName();
		}
		
		override public function levelUp(firstTime:Boolean=false):void 
		{
			baseType.levelUp(firstTime);
		}
		
		override public function recalcStrength():void 
		{
			baseType.recalcStrength();
		}
		
		public function setBaseType(base:Creature):void {
			baseType = base;
			baseType.abilities["instawin"] = new Instawin();
		}
		
		
		override public function hasEnchantment(name:String):Boolean {
			return baseType.hasEnchantment(name);
		}
		
		override public function addEnchantment(ench:Enchantment):String 
		{
			return baseType.addEnchantment(ench);
		}
		override public function notifyEnchantments(e:*):Boolean 
		{
			return baseType.notifyEnchantments(e);
		}
		
		override public function get wings():Array { return baseType._wings; }
		override public function set wings(wings:Array):void { baseType._wings=wings;
			customized = true; }
		
		override public function get vaginas():Array { return baseType._vaginas; }
		override public function set vaginas(balls:Array):void { baseType._vaginas=balls;
			customized = true; }
		
		override public function get dicks():Array { return baseType._dicks; }
		override public function set dicks(balls:Array):void { baseType._dicks=balls;
			customized = true; }
			
		public override function get strength():int { return baseType.strength; }
		public override function set strength(value:int):void { baseType.strength = value; }
		
		public override function get speed():uint { return baseType.speed; }
		public override function set speed(value:uint):void { baseType.speed=value; }
		
		public override function get balls():Array { return baseType.balls; }
		public override function set balls(balls:Array):void { baseType.balls=balls; }
		
		public override function get intellect():uint { return baseType.intellect; }
		public override function set intellect(value:uint):void { baseType.intellect = value; }
		
		public override function get arms():Array { return baseType.arms; }
		public override function set arms(arr:Array):void { baseType.arms = arr; }
		
		public override function get legs():Array { return baseType.legs; }
		public override function set legs(arr:Array):void{ baseType.legs=arr; }
		
		public override function get abilities():Object { return baseType.abilities; }
		public override function set abilities(arr:Object):void{ baseType.abilities=arr; }
		
		public override function get gender():Gender{ return baseType.gender; }
		public override function set gender(arr:Gender):void { baseType.gender = arr; }
		
		public override function get level():int{ return baseType.level; }
		
		public override function get HP():int{ return baseType.HP; }
		public override function get maxHP():int{ return baseType.maxHP; }
		public override function set HP(value:int):void { baseType.HP = value; main.refreshStats(); }
		
		public override function get XP():int{ return baseType.XP; }
		public override function get maxXP():int { trace("maxXP", baseType.maxXP); return baseType.maxXP; }
		public override function set XP(value:int):void { baseType.XP = value; main.refreshStats(); }
	}

}