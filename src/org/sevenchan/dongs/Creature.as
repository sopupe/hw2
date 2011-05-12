package org.sevenchan.dongs 
{
	import flash.net.*;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.enchantment.*;
	import org.sevenchan.dongs.enchantment.events.*;
	import org.sevenchan.dongs.screens.*;
	/**
	 * It's alive!
	 * @author N3X15
	 */
	public class Creature 
	{
		registerClassAlias("ECreature", Creature);
		
		// Characteristics
		public var customized:Boolean = false;
		public var ownName:String = "Blah Blah"; 									// Who am I?
		public var height:Number = 0.0; 											// How tall am I?
		public var build:Build = Build.AVG; 										// How fat am I?
		public var material:Material = Material.NO_MATERIAL_MODIFIER;				// What am I made of?
		public var hair:Hair = Hair.BALD; 											// His/her/hir hair is...
		public var skin:Skin = new Skin("human"); 											// His/her/hir hair is...
		public var _gender:Gender = Gender.ASEXUAL; 									// Boy, Girl, Neither, Both?
		public var sexualPreference:SexualPreference = SexualPreference.ASEXUAL;	// Straight, Gay, ASexual, Bi?
		
		// Stats (CACHED VALUES)
		public var _level:uint = 0;		// In comparison to standard human being.  No attacking rats for 20 levels.
		private var d_level:uint = 0;	// Delta
		public var _strength:int = 1;	// Damage caused in case of a successful attack.
		public var _speed:uint = 1;		// Chance of dodging.  defending.speed-attacking.speed = relative chance of dodging.
		public var _intellect:uint = 1;  // Smartness.  Opens dialog trees and gives hints.
		public var _lust:uint = 1;		// Slowly increases over time, eliminated by masturbation or smecks.  Some battles are nonsexual and will not affect lust, others will slightly increase it based on ((number of balls x ball hormone output)+(number of vaginas * vagina hormone output)* sensitivity).
		public var sensitivity:Number = 0; // 0-1, 0 being not sensitive
		public var _HP:int = 100;		//100*(level*0.02)
		public var _XP:int = 0;			// 50*(level*0.5)
		public var mana:uint = 0;		// Magic shit, increases over time, especially near relaxing places.
		public var _gold:int = 0;		// Currency
										
		// Collections
		public var _abilities:Object = new Object(); 			// What magic/techniques can I use?
		public var assholes:Array = new Array(); 				// How many, and what type of assholes do I possess?
		public var _arms:Array = new Array();					// Needed to attack. Tentacles are ok.
		public var _balls:Array = new Array(); 					// Testes (Cum and pregnancy options)
		public var breasts:Array = new Array(); 				// Boobs (fuckable)
		public var _dicks:Array = new Array(); 					// Penises (Pleasure options, testes required for preggo/cum stuff)
		public var enchantments:Object = new Object();			// What kinds of effects am I suffering/benefiting from?
		public var eyes:Array = new Array();					// How many/what kinds of eyes do I have?
		public var inventory:Array = new Array();				// What stuff am I carrying?
		public var _legs:Array = new Array();					// Legs or locomotive tentacles or some other propulsion. (NONE = CAN'T MOVE OR DODGE)
		public var _vaginas:Array = new Array();					// Places to put babies if the "father" has a penis and doesn't know the FALCON PUNCH.  Anal pregnancy is okay but only with dicks with that flag.
		public var _wings:Array = new Array();					// For flight.
		public var explored:Array = new Array();				
		
		private var main:Main = null;
		public function Creature() 
		{
			trace("Creature.init()");
			gold = MathUtils.rand(0, 50);
			genName();
		}
		
		public function addEnchantment(ench:Enchantment):String {
			var story:String = ench.onInit(this);
			if(!ench.cancelAddition)
				this.enchantments[ench.getID()] = ench;
			return story;
		}
		
		public function initialGenderSetup():void { }
		
		public function yourMove(cs:CombatScreen, ply:Creature):void {
			if (notifyEnchantments(new CombatTurnEvent(ply))) {
				InfoScreen.push("<p>The " + getTypeName() + " cannot attack!</p>");
				return;
			}
			if (MathUtils.lengthOf(abilities) > 0 && MathUtils.rand(0,1) == 0) {
				var ab:Ability = Ability(MathUtils.getRandomObjectEntry(abilities));
				if(ab.activate(this, ply))
					return;
			}
			cs.tryAttack(this, ply);
			return;
		}
		
		public function addLust(amt:Number=1):void {
			lust += (amt * getLustMult());
		}
		
		private function getLustMult():Number {
			var numballs:Number = balls.length;
			var loadMultSum:Number = 0;
			for (var i:int = 0; i < balls.length; i++) {
				loadMultSum += (balls[i] as Testicle).loadMult;
			}
			return (numballs * (loadMultSum / numballs))*0.5;
		}
		
		public function addToInventory(item:Item):void {
			for (var i:int = 0; i < inventory.length; i++) {
				if ((inventory[i] as Item).id == item.id) {
					(inventory[i] as Item).amount += item.amount;
					return;
				}
			}
			if(inventory.length<11) {
				inventory.push(item);
			} else {
				if (main != null)
					main.showInventory(item);
			}
		}
		
		public function combatDescr(subj:Creature):String {
			if (getInterested(subj)) {
				this.lust = 100;
			}
			var o:String = "<p>" + Utils.A(getTypeName(),true) + " "+getTypeName()+" leaps from the bushes and attacks!</p><p>Your attacker is ";
			o += getDescription();
				
			return o;
		}
		
		public function onEncounter(ply:Creature):Boolean { return false; }
		
		public function onWin(ply:Creature):Boolean { return false; }
		public function onLose(ply:Creature):Boolean { return false; }
		
		protected function genName():void {
			var firstNames:Array = [
				"Andrew",
				"Alex",
				"Boris",
				"Charles",
				"Alexei",
				"Drew",
				"Scruffy",
				"Gonnadi",
				"Adolf",
				"Albert",
				"Bruno",
				"Frederick",
				"Ray"
			];
			
			var lastNames:Array = [
				"Lenin",
				"Hitler",
				"Jenkins",
				"Balboa",
				"Nelson",
				"O'Reilly",
				"McDonald",
				"Charles",
				"Rubin",
				"Schwarzeneggar"
			];
			ownName = MathUtils.getRandomEntry(firstNames) + " " + MathUtils.getRandomEntry(lastNames);
			//trace(ownName);
		}
		
		/**
		 * What am I?
		 * @return String Whatever it's called
		 */
		public function getTypeName():String {
			return "NOT FUCKING NAMED YET";
		}
		
		public function getDescription():String {
			var descr:String = "";
			// a gay human male of average height and build.  He also possesses a long, flowing mane of golden hair, 
			// which contrasts nicely with your blue eyes and light skin.
			//
			// In the equipment department, you're not too odd.  You have two human testicles swinging between your legs, paired with 
			// a single, 5.5" human schlong.  Your breasts are flat, but well-sculpted human pecs, and you have a standard-issue male 
			// ass with a standard-issue virgin male asshole between its buns.  You've got two human arms, two human legs. 
			//
			// In other words, you're an average human, which probably won't last long down here.
			//
			descr = Utils.A(sexualPreference.label)+" "+sexualPreference.label+ " " + gender.label + " " + getTypeName() + ", who " + build.getDescription()
			+" %CSUB% also possesses " + hair.getDescription();
			
			if (hair == Hair.BALD)
				descr += ", %POS% glistening scalp distracting from %POS% ";
			else
				descr += ", which constrasts nicely with %POS% ";
			if(eyes.length == 0)
				descr += " complete lack of eyes (<b>and resulting blindness</b>)";
			else
				descr += getEyesDescr();
			
			descr += " and " + skin.getDescr(0, this);
			descr += "</p>";
			
			descr += "<p>In the equipment department, ";
			var haveBalls:Boolean = (balls.length > 0);
			var haveDicks:Boolean = (dicks.length > 0);
			var haveVags:Boolean = (vaginas.length > 0);
			if (haveBalls && haveDicks)
				descr += "%SUB% has " + getTesticleDescr() + " swinging between %POS% legs, paired with " + getDickDescr() + ".";
			if (!haveBalls && haveDicks)
				descr += "no testicles rub between %POS% thighs when %SUB% walks, but %SUB% does have " + getDickDescr() + ".";
			if (haveBalls && !haveDicks)
				descr += "%SUB% doesn't have a dick, but %SUB% does have " + getTesticleDescr() + ".  %SUB% seems to get more horny as time passes.";
			
			if (haveVags)
				descr += " %CPOS% body possesses " + getVagDescr() + ".";
			
			if (!haveBalls && !haveDicks && !haveVags)
				descr += " %CSUB% doesn't have any sexual organs.  At least you won't get raped.";
			
			
			if (breasts.length > 0)
				descr += " %CSUB% has " + getBreastDescr() + ", and wears ";
			else
				descr += " %CSUB% doesn't have any breasts, but does have ";
			descr += getAssDescr() + ".";
			
			if (arms.length > 0)
					descr += " %CSUB% has "+getArmsDescr()+", ";
			else
				descr += " %CSUB% doesn't have any arms (<b>and therefore can't attack</b>), ";
			
			if (legs.length > 0) {
					if (arms.length == 0)
						descr += "but %SUB% DOES have ";
					else 
						descr += "and ";
					descr += getLegsDescr()+".";
			} else
				descr += "and no legs (<b>so %SUB% can't dodge attacks</b>).";
			
			if (wings.length > 0) {
				descr += " %CSUB% also has " + getWingsDescr() + ".";
			}
			descr += "</p>";
			
			return gender.doReplace(descr);
		}
		
		public function hasEnchantment(name:String):Boolean {
			return Utils.objHas(enchantments,name);
		}
		
		public function levelUp(firstOne:Boolean = false):void {
			_level++;
			if(!firstOne)
				InfoScreen.push("<h2>Levelled up!</h2><p>You are now level " + level + "!</p>");
			recalcStrength();
			//recalcSpeed();
		}
		
		public function onCombatInit():void {
				HP = this.maxHP;
		}
		
		public function get maxHP():int {
			return 100 + ((level-1) * 5);
		}
		
		public function get maxXP():int {
			trace("_level", _level);
			trace("_strength", _strength);
			return Math.max(1,50*(_level * 0.5));
		}
		
		public function getExplored(loc:String):Boolean {
			for (var i:int = 0; i < explored.length; i++) {
				if (explored[i] == loc)
					return true;
			}
			return false;
		}
		
		public function setExplored(loc:String):void {
			if (getExplored(loc)) return;
			explored.push(loc);
		}
		
		public function recalcStrength():void {
			//trace("height:", height);
			var weight:Number = build.calculateWeight(height, 0.5)
			//trace("weight:",weight);
			var A:Number = Math.ceil((Math.pow(level, 2) * 0.01) - (Math.abs(17.5 - (weight * 0.1))) + 8);
			if (level <= 1)
				_strength = A;
			var B:Number = Math.ceil((Math.pow(level-1,2) * 0.01) - (Math.abs(17.5 - (weight * 0.1))) + 8);
			_strength = _strength + (A - B);
		}
		
		public function get strength():int { return _strength; }
		public function set strength(str:int):void { 
			_strength = str;
			doStatsUpdate();
		}
		
		public function get speed():uint { return _speed; }
		public function set speed(spd:uint):void  { 
			_speed = spd;
			doStatsUpdate(); 
		}
		
		public function get lust():uint { return _lust; }
		public function set lust(lst:uint):void  
		{ 
			_lust = lst; 
			if (_lust > 100)
				_lust = 100;
			doStatsUpdate();
		}
		public function get gold():uint { return _gold; }
		public function set gold(value:uint):void  
		{ 
			if (value < 100)
				value = 0;
			_gold = value;
			doStatsUpdate();
		}
		public function get intellect():uint { return _intellect; }
		public function set intellect(i:uint):void  
		{ 
			_intellect = i; 
			doStatsUpdate();
		}
		
		public function get arms():Array { return _arms; }
		public function set arms(arr:Array):void { 
			_arms = arr;
			customized = true;
		}
		
		public function get legs():Array { return _legs; }
		public function set legs(arr:Array):void { _legs = arr;
			customized = true; }
			
		public function get wings():Array { return _wings; }
		public function set wings(arr:Array):void { _wings = arr;
			customized = true; }
		
		public function get balls():Array { return _balls; }
		public function set balls(balls:Array):void { _balls=balls;
			customized = true; }
		
		public function get vaginas():Array { return _vaginas; }
		public function set vaginas(balls:Array):void { _vaginas=balls;
			customized = true; }
		
		public function get dicks():Array { return _dicks; }
		public function set dicks(balls:Array):void { _dicks=balls;
			customized = true; }
		
		public function get abilities():Object { return _abilities; }
		public function set abilities(arr:Object):void{ _abilities=arr; }
		
		public function get gender():Gender { return _gender; }
		public function set gender(value:Gender):void { _gender=value;
			customized = true; }
		
		public function get HP():int { return _HP; }
		public function set HP(value:int):void {
			_HP=value;
			doStatsUpdate(); 
		}
		public function get XP():int { return _XP; }
		public function set XP(value:int):void {
			trace("XP", value);
			_XP = value;
			if (_XP >= maxXP) {
				_XP = 0;
				levelUp();
			}
			doStatsUpdate(); 
		}
		
		
		public function setMain(main:Main):void {
			this.main = main;
		}
		
		private function doStatsUpdate():void {
			if (main != null) {
				main.refreshStats();
			}
		}
		
		public function get level():int {
			return _level;
		}
		
		private function getBodyPartDesc(collection:Array, singular:String):String {
			
			if (collection.length== 0) {
				return "no "+singular+"s";
			}
			var out:String = "";
			var varying:Boolean = false;
			var types:Object = new Object();
			var lname:String = "";
			var numtypes:Number = 0;
			for each (var i:* in collection) {
				var t:IBodyPart = i as IBodyPart;
				if (t == null)
					continue;
				//trace(t);
				lname = t.name;
				if(!(lname in types)) {
					types[lname] = 0;
					numtypes++;
				}
				types[lname]++;
			}
			for (var k:String in types) {
				trace(k + " = " + types[k]);
			}
			if(numtypes==1) {
				for each (t in collection) {
					if (t.name == lname)
						return t.getDescr(types[lname], this);
				}
			} else {
				var n:Number = 0;
				for (var ot:* in types) {
					var gotdescr:Boolean = false;
					for each (t in collection) {
						if (t.name == ot) {
							if(!gotdescr) {
								out += ", " + t.getDescr(types[ot] as Number, this);
								gotdescr = true;
							}
							n += types[ot];
						}
					}
				}
				return collection.length + " "+singular+"s of varying types ("+out.substr(2)+")";
			}
			return "";
		}
		
		public function notifyEnchantments(e:*):Boolean {
			var collection:Array = [];
			for (var eID:String in enchantments) {
				var ench:Enchantment = enchantments[eID];
				if (e is CombatStartEvent) {
					ench.onCombatInit(e.other);
				}
				if (e is CombatEndEvent) {
					ench.onCombatComplete(e.won, e.other);
				}
				if (e is CombatTurnEvent) {
					return ench.onMyCombatTurn(e.other);
				}
			}
			return false;
		}
		
		public function getTesticleDescr():String {
			return getBodyPartDesc(balls,"ball");
		}
		
		public function getDickDescr():String {
			return getBodyPartDesc(dicks,"dick");
		}
		
		public function getVagDescr():String {
			return getBodyPartDesc(vaginas,"vag");
		}
		
		public function getBreastDescr():String {
			return getBodyPartDesc(breasts, "boob");		
		}
		
		public function getAssDescr():String {
			return getBodyPartDesc(assholes,"asshole");
		}
		
		public function getArmsDescr():String {
			return getBodyPartDesc(arms,	"arm");
		}
		
		public function getEyesDescr():String {
			return getBodyPartDesc(eyes,	"eye");
		}
		
		public function getLegsDescr():String {
			return getBodyPartDesc(legs,	"leg");
		}
		
		public function getWingsDescr():String {
			return getBodyPartDesc(wings,	"wing");
		}
		
		/**
		 * Wants your body
		 *  
		 * I = Interested
		 * H = Hostile
		 * +---------------+---+---+
		 * | Type          | I | H |
		 * +---------------+---+---+
		 * | Rape          | T | T |
		 * | Fight         | F | T |
		 * | Horny         | T | F |
		 * | -             | F | F |
		 * +---------------+---+---+
		 */
		public function getInterested(subj:Creature):Boolean {
			return sexualPreference.isOppositeGender(gender, subj.gender);
		}
		
		public function getHostile(subj:Creature):Boolean {
			return false;
		}
		
		public function performConversion(oldMe:Creature):void {
			
		}
		
		public function changeFrom(f:Creature):void {
			this._speed = f._speed;
			this._strength = f._strength;
			this.abilities = f.abilities;
			this.enchantments = f.enchantments;
			this.explored = f.explored;
			this.gender = f.gender;
			this.gold = f.gold;
			this.height = f.height;
			this.HP = f.maxHP;
			this.ownName = f.ownName;
			this.sensitivity = f.sensitivity;
			this.sexualPreference = f.sexualPreference;
			this.inventory = f.inventory;
			
			this.performConversion(f);
		}
	}
}

