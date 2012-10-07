package org.sevenchan.dongs
{
	import flash.net.*;
	import org.sevenchan.AdventureController;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.clothing.Clothing;
	import org.sevenchan.dongs.clothing.ClothingType;
	import org.sevenchan.dongs.creature.*;
	import org.sevenchan.dongs.enchantment.*;
	import org.sevenchan.dongs.enchantment.events.*;
	import org.sevenchan.dongs.screens.*;
	import org.sevenchan.dongs.weapons.IWeapon;
	
	/**
	 * It's alive!
	 * @author Harbinger
	 */
	public class Creature
	{
		registerClassAlias("ECreature", Creature);
		
		// Characteristics
		public var customized:Boolean = false;
		public var ownName:String = "Blah Blah"; // Who am I?
		public var height:Number = 0.0; // How tall am I?
		public var build:Build = Build.AVG; // How fat am I?
		public var material:Material = Material.NO_MATERIAL_MODIFIER; // What am I made of?
		public var hair:Hair = Hair.BALD; // His/her/hir hair is...
		public var skin:Skin = new Skin("human"); // His/her/hir hair is...
		public var _gender:Gender = Gender.ASEXUAL; // Boy, Girl, Neither, Both?
		public var sexualPreference:SexualPreference = SexualPreference.ASEXUAL; // Straight, Gay, ASexual, Bi?
		
		private var mGenderInitialized:Boolean = false;
		
		// Stats (CACHED VALUES)
		public var _level:int = 0; // In comparison to standard human being.  No attacking rats for 20 levels.
		private var d_level:int = 0; // Delta
		public var _strength:int = 1; // Damage caused in case of a successful attack.
		public var _speed:int = 1; // Chance of dodging [0-1].  defending.speed-attacking.speed = relative chance of dodging.
		public var _intellect:int = 1; // Smartness.  Opens dialog trees and gives hints.
		public var _lust:int = 1; // Slowly increases over time, eliminated by masturbation or smecks.  Some battles are nonsexual and will not affect lust, others will slightly increase it based on ((number of balls x ball hormone output)+(number of vaginas * vagina hormone output)* sensitivity).
		public var _sensitivity:Number = 0; // 0-1, 0 being not sensitive
		public var _HP:int = 100; //100*(level*0.02)
		public var _XP:int = 0; // 50*(level*0.5)
		public var _mana:int = 0; // Magic shit, increases over time, especially near relaxing places.
		public var _gold:int = 0; // Currency
		
		// Collections
		// What magic/techniques can I use?
		public var _abilities:Object = new Object();
		// How many, and what type of assholes do I possess?
		public var _assholes:Vector.<Asshole> = new Vector.<Asshole>();
		// Needed to attack. Tentacles are ok.
		public var _arms:Vector.<Arm> = new Vector.<Arm>();
		// Testes (Cum and pregnancy options)
		public var _balls:Vector.<Testicle> = new Vector.<Testicle>();
		// Boobs (fuckable)
		public var _breasts:Vector.<Breast> = new Vector.<Breast>();
		// Penises (Pleasure options, testes required for preggo/cum stuff)
		public var _dicks:Vector.<Penis> = new Vector.<Penis>();
		// What kinds of effects am I suffering/benefiting from?
		public var enchantments:Object = new Object();
		// How many/what kinds of eyes do I have?
		public var _eyes:Vector.<Eye> = new Vector.<Eye>();
		// What stuff am I carrying?
		public var inventory:Vector.<Item> = new Vector.<Item>();
		// Legs or locomotive tentacles or some other propulsion. (NONE = CAN'T MOVE OR DODGE)
		public var _legs:Vector.<Leg> = new Vector.<Leg>();
		// Places to put babies if the "father" has a penis and doesn't know the FALCON PUNCH.  Anal pregnancy is okay but only with dicks with that flag.
		public var _vaginas:Vector.<Vagina> = new Vector.<Vagina>();
		// For flight.
		public var _wings:Vector.<Wing> = new Vector.<Wing>();
		// Explored locations
		public var explored:Vector.<String> = new Vector.<String>();
		
		public var clothing:Vector.<Clothing> = new Vector.<Clothing>();
		
		/**
		 * Do stats scale with the PC (false) or stay the same (true)?
		 * Mostly useful for bosses.
		 */
		public var staticStats:Boolean = false;
		
		public var main:AdventureController = null;
		
		protected var abilityUseProbability:Number = 1;
		protected var turnsToLose:int = 0;
		
		public function Creature()
		{
			trace("Creature.init()");
			clearFuckingEverything();
			
			_gold = MathUtils.rand(0, 50);
			_mana = maxMana;
		}
		
		/**
		 * IF YOU ADD ANY NEW VARIABLES TO THIS CLASS, RESET THEM TO DEFAULT VALUES HERE!
		 */
		private function clearFuckingEverything():void {
			_level = 0; // In comparison to standard human being.  No attacking rats for 20 levels.
			d_level = 0; // Delta
			_strength = 1; // Damage caused in case of a successful attack.
			_speed = 1; // Chance of dodging [0-1].  defending.speed-attacking.speed = relative chance of dodging.
			_intellect = 1; // Smartness.  Opens dialog trees and gives hints.
			_lust = 1; // Slowly increases over time, eliminated by masturbation or smecks.  Some battles are nonsexual and will not affect lust, others will slightly increase it based on ((number of balls x ball hormone output)+(number of vaginas * vagina hormone output)* sensitivity).
			_sensitivity = 0; // 0-1, 0 being not sensitive
			_HP = 100; //100*(level*0.02)
			_XP = 0; // 50*(level*0.5)
			_mana = 0; // Magic shit, increases over time, especially near relaxing places.
			_gold = 0; // Currency
			
			_abilities = new Object();
			_assholes = new Vector.<Asshole>();
			_arms = new Vector.<Arm>();
			_balls = new Vector.<Testicle>();
			_breasts = new Vector.<Breast>();
			_dicks = new Vector.<Penis>();
			enchantments = new Object();
			_eyes = new Vector.<Eye>();
			inventory = new Vector.<Item>();
			_legs = new Vector.<Leg>();
			_vaginas = new Vector.<Vagina>();
			_wings = new Vector.<Wing>();
			explored = new Vector.<String>();
			clothing = new Vector.<Clothing>();
		}
		
		public function addBreast():Breast
		{
			trace("USING CREATURE.ADDBREAST INSTEAD OF OVERRIDING");
			return null;
		}
		
		/**
		 * IT'S A TRAP
		 * @return What the gender LOOKS like, given what you can see with clothing.
		 */
		public function getApparentGender():Gender
		{
			var canSeeDick:Boolean = false;
			var canSeeBalls:Boolean = false;
			var canSeeBoobs:Boolean = false;
			var canSeeVag:Boolean = false;
			
			for each (var d:Penis in dicks)
			{
				if (d == null)
					continue;
				if (!d.isConcealedBy(this, clothing))
				{
					trace(d.getDescr(1, this), "gave", getTypeName(), "away");
					canSeeDick = true;
					break;
				}
			}
			
			for each (var t:Testicle in balls)
			{
				if (t == null)
					continue;
				if (!t.isConcealedBy(this, clothing))
				{
					trace(t.getDescr(1, this), "gave", getTypeName(), "away");
					canSeeBalls = true;
					break;
				}
			}
			
			for each (var b:Breast in breasts)
			{
				if (b == null)
					continue;
				if (!b.isConcealedBy(this, clothing))
				{
					trace(b.getDescr(1, this), "gave", getTypeName(), "away");
					canSeeBoobs = true;
					break;
				}
			}
			
			for each (var v:Vagina in vaginas)
			{
				if (v == null)
					continue;
				if (!v.isConcealedBy(this, clothing))
				{
					trace(v.getDescr(1, this), "gave", getTypeName(), "away");
					canSeeVag = true;
					break;
				}
			}
			var masc:Boolean = canSeeDick || canSeeBalls;
			var fem:Boolean = canSeeBoobs || canSeeVag;
			if (masc && fem)
				return Gender.HERM;
			if (masc && !fem)
				return Gender.MALE;
			if (!masc && fem)
				return Gender.FEMALE;
			return Gender.MALE;
		}
		
		public function breastDelta(delta:Number, mult:Boolean):void
		{
			for (var i:int = 0; i < _breasts.length; i++)
				if (!mult)
					_breasts[i].size += (delta);
				else
					_breasts[i].milkMult
		}
		
		public function dickDelta(delta:Number, mult:Boolean):void
		{
			for (var i:int = 0; i < _dicks.length; i++)
				if (mult)
					_dicks[i].sizeMult += (delta);
				else
					_dicks[i].size += (delta);
		}
		
		public function testicleDelta(delta:Number, mult:Boolean):void
		{
			for (var i:int = 0; i < _balls.length; i++)
				if (mult)
					_balls[i].loadMult += (delta);
				else
					_balls[i].normalLoad += (delta);
		}
		
		public function addEnchantment(ench:Enchantment):String
		{
			var story:String = ench.onInit(this);
			if (!ench.cancelAddition)
				this.enchantments[ench.getID()] = ench;
			return story;
		}
		
		public function setupBody():void
		{
			initialGenderSetup();
			CONFIG::debug
			{
				if (this._arms.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no arms!");
				if (this._assholes.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no anuses!");
				if (this._gender.hasDick && this._balls.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no balls!");
				if (this._breasts.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no breasts!");
				if (this._gender.hasDick && this._dicks.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no dick!");
				if (this._eyes.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no eyes!");
				if (this._legs.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no legs!");
				if (this._gender.hasVag && this._vaginas.length == 0)
					trace("[WARNING] ", this.getTypeName(), " has no vag!");
			}
		}
		
		public function initialGenderSetup():void
		{
			mGenderInitialized = true;
		}
		
		public function yourMove(cs:CombatScreen, ply:Creature):void
		{
			if ((turnsToLose > 0) || notifyEnchantments(new CombatTurnEvent(cs, ply)))
			{
				InfoScreen.push("<p>The " + getTypeName() + " cannot attack!</p>");
				return;
			}
			if (turnsToLose > 0)
			{
				turnsToLose--;
			}
			if (MathUtils.lengthOf(abilities) > 0 && MathUtils.rand(0, abilityUseProbability) == 0)
			{
				var ab:Ability = Ability(MathUtils.getRandomObjectEntry(abilities));
				if (this.mana < ab.manaCost)
				{
					InfoScreen.push("<p>The " + getTypeName() + " tried to use " + ab.name + " but is too exhausted!</p>");
					return;
				}
				if (ab.activate(this, ply))
				{
					this.mana -= ab.manaCost
					return;
				}
			}
			cs.tryAttack(this, ply);
			return;
		}
		
		public function addDick(type:String = "default"):Penis
		{
			return null;
		}
		
		public function addLust(amt:Number = 1):void
		{
			var adding2Lust:int = (amt * getLustMult());
			trace("Adding to lust ", adding2Lust);
			lust += Math.ceil(adding2Lust);
		}
		
		private function getLustMult():Number
		{
			var numballs:Number = balls.length;
			var loadMultSum:Number = 0;
			for (var i:int = 0; i < balls.length; i++)
			{
				loadMultSum += (balls[i] as Testicle).loadMult * 0.5;
			}
			return loadMultSum;
		}
		
		public function takeFromInventory(item:Item):void
		{
			for (var i:int = 0; i < inventory.length; i++)
			{
				if ((inventory[i] as Item).id == item.id)
				{
					(inventory[i] as Item).amount -= item.amount;
					if ((inventory[i] as Item).amount <= 0)
						inventory.splice(i, 1);
					return;
				}
			}
		}
		
		public function addToInventory(item:Item):void
		{
			for (var i:int = 0; i < inventory.length; i++)
			{
				if ((inventory[i] as Item).id == item.id)
				{
					(inventory[i] as Item).amount += item.amount;
					return;
				}
			}
			if (inventory.length < 11)
			{
				inventory.push(item);
			}
			else
			{
				if (main != null)
					main.showInventory(item);
			}
		}
		
		public function combatDescr(subj:Creature):String
		{
			if (getInterested(subj))
			{
				this.lust = 100;
			}
			var o:String = "<p>" + Utils.A(getTypeName(), true) + " " + getTypeName() + " leaps from the bushes and attacks!</p><p>Your attacker is ";
			o += getDescription();
			
			return o;
		}
		
		public function onEncounter(ply:Creature):Boolean
		{
			return false;
		}
		
		public function onWin(ply:Creature):Boolean
		{
			return false;
		}
		
		/**
		 * Override this and return true to override the default "YOU WHIN TEH PRIZE!!!!" screen
		 * @param	ply
		 * @return
		 */
		public function onLose(ply:Creature):Boolean
		{
			return false;
		}
		
		protected function genName():void
		{
			var firstNames:Array = ["Andrew", "Alex", "Boris", "Charles", "Alexei", "Drew", "Scruffy", "Gonnadi", "Adolf", "Albert", "Bruno", "Frederick", "Ray"];
			
			var lastNames:Array = ["Lenin", "Hitler", "Jenkins", "Balboa", "Nelson", "O'Reilly", "McDonald", "Charles", "Rubin", "Schwarzeneggar"];
			ownName = MathUtils.getRandomArrayEntry(firstNames) + " " + MathUtils.getRandomArrayEntry(lastNames);
			//trace(ownName);
		}
		
		public function recalcGender():void
		{
			if (balls.length > 0)
			{
				if (vaginas.length > 0)
				{
					gender = Gender.HERM;
				}
				else
				{
					gender = Gender.MALE;
				}
			}
			else
			{
				if (vaginas.length > 0)
				{
					gender = Gender.FEMALE;
				}
				else
				{
					gender = Gender.ASEXUAL;
				}
			}
		}
		
		/**
		 * What am I?
		 * @return String Whatever it's called
		 */
		public function getTypeName():String
		{
			throw new Error("SOME DUMBASS DIDN'T GIVE THIS CREATURE A NAME");
			return "NOT FUCKING NAMED YET";
		}
		
		/**
		 * Do I have the option to run?
		 * @return Button visibility
		 */
		public function canRun():Boolean
		{
			return true;
		}
		
		public function areAnyConcealed(parts:Vector.<IBodyPart>):Boolean
		{
			var yes:Boolean = false;
			for each (var p:IBodyPart in parts)
			{
				if (p != null && p.isConcealedBy(this, clothing))
					return true;
			}
			return false;
		}
		
		public function isHeadConcealed():Boolean
		{
			var wat:Function = function(c_:Object, index:int, vector:Vector.<Clothing>):Boolean
			{
				var c:Clothing = Clothing(c_);
				if (c != null)
					return (c.type.obscures.indexOf("head") > -1);
				else
					return false;
			}
			return clothing.some(wat);
		}
		
		public function isWearing(ct:ClothingType):Boolean
		{
			var wat:Function = function(c_:Object, index:int, vector:Vector.<Clothing>):Boolean
			{
				var c:Clothing = Clothing(c_);
				if (c != null)
					return (c.type == ct);
				else
					return false;
			}
			return clothing.some(wat);
		}
		
		public function areEyesConcealed():Boolean
		{
			return areAnyConcealed(Vector.<IBodyPart>(eyes));
		}
		
		public function getDescription():String
		{
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
			
			// NOW WITH ENEMY TRAPS
			var aGender:Gender = getApparentGender();
			descr = Utils.A(sexualPreference.label) + " " + aGender.label + " " + getTypeName() + ", who " + build.getDescription();
			
			if (!isHeadConcealed())
			{
				if (hair == Hair.BALD)
				{
					descr += ", %POS% glistening scalp";
					if (!areEyesConcealed())
						descr += " distracting from %POS%";
				}
				else
				{
					descr += ". %CSUB% has " + hair;
					if (!areEyesConcealed())
						descr += ", which constrasts nicely with %POS%";
				}
			}
			else
			{
				descr += ", and has";
			}
			if (!areEyesConcealed())
			{
				if (eyes.length == 0)
				{
					if (isHeadConcealed())
						descr += " a";
					descr += " complete lack of eyes";
				}
				else
					descr += getEyesDescr();
				descr += " and "
			}
			
			descr += skin.getDescr(0, this);
			descr += ".</p>";
			
			descr += "<p>In the equipment department, ";
			var wearingPants:Boolean = isWearing(ClothingType.PANTS);
			var haveBalls:Boolean = (balls.length > 0 && !wearingPants);
			var haveDicks:Boolean = (dicks.length > 0 && !wearingPants);
			var haveVags:Boolean = (vaginas.length > 0 && !wearingPants);
			if (haveBalls && haveDicks)
				descr += "%SUB% has " + getTesticleDescr() + " swinging between %POS% legs, paired with " + getDickDescr() + ".";
			if (!haveBalls && haveDicks)
				descr += "no testicles rub between %POS% thighs when %SUB% walks, but %SUB% does have " + getDickDescr() + ".";
			if (haveBalls && !haveDicks)
				descr += "%SUB% doesn't have a dick, but %SUB% does have " + getTesticleDescr() + ".  %SUB% seems to get more horny as time passes.";
			
			if (haveVags)
				descr += " %CPOS% body possesses " + getVagDescr() + ".";
			
			if (!haveBalls && !haveDicks && !haveVags )
			{
				descr += " You can't see any dangly parts, nor anything else between %POS% legs.";
				if (breasts.length > 0)
					descr += " However, ";
			}
			
			if (breasts.length > 0)
			{
				descr += " %CSUB% has " + getBreastDescr();
				if (assholes.length > 0 && !areAnyConcealed(Vector.<IBodyPart>(assholes)))
				{
					descr += ", and also has " + getAssDescr() + ".";
				}
				else
				{
					descr += ".";
				}
			}
			else
			{
				descr += " %CSUB% doesn't have any breasts";
				if (assholes.length > 0 && !areAnyConcealed(Vector.<IBodyPart>(assholes)))
				{
					descr += ", but does have " + getAssDescr() + ".";
					;
				}
				else
				{
					descr += ".";
				}
			}
			
			if (arms.length > 0)
				descr += " %CSUB% has " + getArmsDescr() + ", ";
			else
				descr += " %CSUB% doesn't have any arms, ";
			
			if (legs.length > 0)
			{
				if (arms.length == 0)
					descr += "but %SUB% DOES have ";
				else
					descr += "and ";
				descr += getLegsDescr() + ".";
			}
			else
				descr += "and no legs.";
			
			if (wings.length > 0)
			{
				descr += " %CSUB% also has " + getWingsDescr() + ".";
			}
			
			descr += "</p>";
			
			descr += "<p>%CSUB% is wearing " + ((clothing.length > 0) ? "a " + getClothingDescr() : "nothing") + ".</p>";
			if (aGender.label != gender.label)
				descr += "<p><small>DEBUG: %CSUB% is actually a " + gender.label + " with " + getDickDescr() + "/" + getTesticleDescr() + "/" + getVagDescr() + ". TEE HEE.</small></p>";
			
			return aGender.doReplace(descr);
		}
		
		public function hasEnchantment(name:String):Boolean
		{
			return Utils.objHas(enchantments, name);
		}
		
		public function levelUp(firstOne:Boolean = false):void
		{
			_level++;
			if (!firstOne)
				InfoScreen.push("<h2>Levelled up!</h2><p>You are now at level " + level + "!</p>");
		}
		
		public function onCombatInit(ply:Player):void
		{
			HP = this.maxHP;
		}
		
		public function get maxMana():int
		{
			return 100 + ((level - 1) * 10);
		}
		
		public function get maxHP():int
		{
			return 100 + ((level - 1) * 10);
		}
		
		public function get maxXP():int
		{
			return Math.max(1, 50 * (_level * 0.5));
		}
		
		public function getExplored(loc:String):Boolean
		{
			for (var i:int = 0; i < explored.length; i++)
			{
				if (explored[i] == loc)
					return true;
			}
			return false;
		}
		
		public function setExplored(loc:String):void
		{
			if (getExplored(loc))
				return;
			explored.push(loc);
		}
		
		public function getEffectivenessMultiplier(defender:Creature):Number
		{
			var a:Number = strength;
			var e:Number = defender.strength;
			return (a * (100 - e)) / 10000;
		}
		
		/**
		 * Calculation from http://www.gamedev.net/topic/183822-rpg-combat-formula-question/
		 * @param	attacker
		 */
		public function speedCheckAgainst(attacker:Creature):Boolean
		{
			// C = A * (100% - E)
			// WHERE
			// C = Chance to hit
			// A = Attacker's accuracy (speed, in our case)
			// E = Defender's evasion rate (speed, again)
			var a:Number = attacker.speed;
			var e:Number = speed;
			return Math.random() <= (a * (100 - e)) / 10000;
		}
		
		/**
		 * Calculation from http://www.gamedev.net/topic/183822-rpg-combat-formula-question/
		 * @param	attacker
		 */
		public function strengthCheckAgainst(attacker:Creature):Boolean
		{
			var a:Number = attacker.strength;
			var e:Number = strength;
			// C = A * (100% - E)
			// WHERE
			// C = Chance to hit
			// A = Attacker's accuracy (strength, in our case)
			// E = Defender's evasion rate (strength, again)
			return Math.random() <= (a * (100 - e)) / 10000;
		}
		
		/**
		 * Figure out how much shit we're going to wreck.
		 * @param	attacker
		 * @param	weapon or null
		 * @return
		 */
		public function damageAgainst(attacker:Creature, weapon:IWeapon):Number
		{
			// from D&D?
			// TODO:  Probably need to factor in speed or something at some point. I ain't a math guy.
			var a:Number = attacker.strength;
			var e:Number = strength;
			var weaponDamage:Number = 0;
			if (weapon != null)
				weaponDamage = weapon.calcDamage(this, attacker);
			var dmg:Number = (MathUtils.rand(0, 1, false) + level + (strength / 50) + weaponDamage) - (MathUtils.rand(0, 1, false) + attacker.level + (attacker.strength / 50));
			dmg *= 10;
			return Math.ceil((dmg > 0) ? dmg : 1); // Keep above 1 (no negatives, no 0-damage attacks.)
		}
		
		public function get strength():int
		{
			return _strength;
		}
		
		public function set strength(str:int):void
		{
			_strength = str;
			doStatsUpdate();
		}
		
		public function get speed():int
		{
			return _speed;
		}
		
		public function set speed(spd:int):void
		{
			_speed = spd;
			doStatsUpdate();
		}
		
		public function get lust():int
		{
			return _lust;
		}
		
		public function set lust(lst:int):void
		{
			_lust = lst;
			if (_lust > 100)
				_lust = 100;
			doStatsUpdate();
		}
		
		public function get gold():int
		{
			return _gold;
		}
		
		public function set gold(value:int):void
		{
			if (value < 0)
				value = 0;
			_gold = value;
			doStatsUpdate();
		}
		
		public function get intellect():int
		{
			return _intellect;
		}
		
		public function set intellect(i:int):void
		{
			_intellect = i;
			doStatsUpdate();
		}
		
		public function get mana():int
		{
			return _mana;
		}
		
		public function set mana(i:int):void
		{
			_mana = i;
			doStatsUpdate();
		}
		
		public function get sensitivity():int
		{
			return _sensitivity;
		}
		
		public function set sensitivity(i:int):void
		{
			_sensitivity = i;
			doStatsUpdate();
		}
		
		public function get assholes():Vector.<Asshole>
		{
			return this._assholes;
		}
		
		public function set assholes(balls:Vector.<Asshole>):void
		{
			this._assholes = balls;
			customized = true;
		}
		
		public function hasItem(id:int):Boolean
		{
			for each (var item:Item in this.inventory)
			{
				if (item.id == id)
					return true;
			}
			return false;
		}
		
		public function get breasts():Vector.<Breast>
		{
			return this._breasts;
		}
		
		public function set breasts(balls:Vector.<Breast>):void
		{
			this._breasts = balls;
			customized = true;
		}
		
		public function get eyes():Vector.<Eye>
		{
			return this._eyes;
		}
		
		public function set eyes(balls:Vector.<Eye>):void
		{
			this._eyes = balls;
			customized = true;
		}
		
		public function get vaginas():Vector.<Vagina>
		{
			return this._vaginas;
		}
		
		public function set vaginas(balls:Vector.<Vagina>):void
		{
			this._vaginas = balls;
			customized = true;
		}
		
		public function get arms():Vector.<Arm>
		{
			return _arms;
		}
		
		public function set arms(arr:Vector.<Arm>):void
		{
			_arms = arr;
			customized = true;
		}
		
		public function get legs():Vector.<Leg>
		{
			return _legs;
		}
		
		public function set legs(arr:Vector.<Leg>):void
		{
			_legs = arr;
			customized = true;
		}
		
		public function get wings():Vector.<Wing>
		{
			return _wings;
		}
		
		public function set wings(arr:Vector.<Wing>):void
		{
			_wings = arr;
			customized = true;
		}
		
		public function get balls():Vector.<Testicle>
		{
			return _balls;
		}
		
		public function set balls(balls:Vector.<Testicle>):void
		{
			_balls = balls;
			customized = true;
		}
		
		public function get dicks():Vector.<Penis>
		{
			return _dicks;
		}
		
		public function set dicks(aaa:Vector.<Penis>):void
		{
			_dicks = aaa;
			customized = true;
		}
		
		public function get abilities():Object
		{
			return _abilities;
		}
		
		public function set abilities(arr:Object):void
		{
			_abilities = arr;
		}
		
		public function get gender():Gender
		{
			return _gender;
		}
		
		public function set gender(value:Gender):void
		{
			_gender = value;
			customized = true;
		}
		
		public function get HP():int
		{
			return _HP;
		}
		
		public function set HP(value:int):void
		{
			_HP = value;
			doStatsUpdate();
		}
		
		public function get XP():int
		{
			return _XP;
		}
		
		public function set XP(value:int):void
		{
			//trace("XP", value);
			_XP = value;
			if (_XP >= maxXP)
			{
				_XP = 0;
				levelUp();
			}
			doStatsUpdate();
		}
		
		public function setMain(main:AdventureController):void
		{
			this.main = main;
		}
		
		private function doStatsUpdate():void
		{
			if (main != null)
			{
				main.refreshStats();
			}
			else
			{
				// AI
				if (_eyes.length == 0)
					_speed = 0.1; // 1/10 chance of hitting when blind
			}
		}
		
		public function get level():int
		{
			return _level;
		}
		
		private function getBodyPartDesc(collection:Vector.<IBodyPart>, singular:String):String
		{
			
			if (collection.length == 0)
			{
				return "no " + Utils.pluralize(2, singular);
			}
			var out:String = "";
			var varying:Boolean = false;
			var types:Object = new Object();
			var lname:String = "";
			var numtypes:Number = 0;
			for each (var i:*in collection)
			{
				var t:IBodyPart = i as IBodyPart;
				if (t == null)
					continue;
				//trace(t);
				lname = t.name;
				if (!(lname in types))
				{
					types[lname] = 0;
					numtypes++;
				}
				types[lname]++;
			}
			if (numtypes == 1)
			{
				for each (t in collection)
				{
					if (t.name == lname)
						return t.getDescr(types[lname], this);
				}
			}
			else
			{
				var n:Number = 0;
				for (var ot:*in types)
				{
					var gotdescr:Boolean = false;
					for each (t in collection)
					{
						if (t.name == ot)
						{
							if (!gotdescr)
							{
								out += ", " + t.getDescr(types[ot] as Number, this);
								gotdescr = true;
							}
							n += types[ot];
						}
					}
				}
				return collection.length + " " + singular + "s of varying types (" + out.substr(2) + ")";
			}
			return "";
		}
		
		public function notifyEnchantments(e:*):Boolean
		{
			var collection:Array = [];
			for (var eID:String in enchantments)
			{
				var ench:Enchantment = enchantments[eID];
				if (e is CombatStartEvent)
				{
					ench.onCombatInit(e.other);
				}
				if (e is CombatEndEvent)
				{
					ench.onCombatComplete(e.won, e.other);
				}
				if (e is CombatTurnEvent)
				{
					return ench.onMyCombatTurn(e.screen, e.other);
				}
			}
			return false;
		}
		
		public function inventoryUpdate(item:Item, received:Boolean):Boolean
		{
			var actionToTake:int = -1;
			for (var eID:String in enchantments)
			{
				var act:int = enchantments[eID].onInventoryReceived(item);
				if (act != Enchantment.INTERCEPT_ACTION_NONE)
				{
					actionToTake = act;
					break;
				}
			}
			switch (actionToTake)
			{
				case Enchantment.INTERCEPT_ACTION_TOSS: 
					// Do nothing, we're already tossing.
					break;
				case Enchantment.INTERCEPT_ACTION_USE: 
					item.Use(this);
					break;
				default: 
					break;
			}
			return actionToTake == Enchantment.INTERCEPT_ACTION_NONE;
		}
		
		public function getTesticleDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(balls), "ball");
		}
		
		public function getBulgesInPants():String
		{
			var numBulge:int = 0;
			var peeks:Vector.<Penis> = new Vector.<Penis>();
			for each (var p:Penis in dicks)
			{
				if (p == null)
					continue;
				if (!p.isConcealedBy(this, clothing))
				{
					for each (var c:Clothing in clothing)
					{
						if (c == null)
							continue;
						var bsize:Number = p.getBulgeSize(this, c);
						trace(p.getDescr(1, this), "bsize=" + bsize.toString());
						if (bsize > 6)
						{
							if (bsize < 8)
							{
								numBulge++;
							}
							else
							{
								peeks.push(p)
							}
						}
					}
				}
			}
			if (numBulge == 0 && peeks.length == 0)
				return "";
			var fo:String = " (which has ";
			if (numBulge > 0)
			{
				fo += numBulge + " " + Utils.pluralize(numBulge, "bulge", "bulges");
			}
			if (numBulge > 0 && peeks.length > 0)
			{
				fo += " and ";
			}
			if (peeks.length > 0)
			{
				fo += getBodyPartDesc(Vector.<IBodyPart>(peeks), "dick") + " peeking over %POS% waistband";
			}
			return fo + ")";
		}
		
		public function getDickDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(dicks), "dick");
		}
		
		public function getVagDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(vaginas), "vag");
		}
		
		public function getBreastDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(breasts), "boob");
		}
		
		public function getAssDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(assholes), "asshole");
		}
		
		public function getArmsDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(arms), "arm");
		}
		
		public function getEyesDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(eyes), "eye");
		}
		
		public function getLegsDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(legs), "leg");
		}
		
		public function getWingsDescr():String
		{
			return getBodyPartDesc(Vector.<IBodyPart>(wings), "wing");
		}
		
		public function getClothingDescr():String
		{
			var desc:String = "";
			
			for (var i:int = 0; i < clothing.length; i++)
			{
				var item:Clothing = clothing[i];
				
				desc += item.getDescr(this);
				
				switch (item.type)
				{
					case ClothingType.HEADGEAR: 
						desc += " as a hat";
						break;
					case ClothingType.TOP: 
						desc += " as a shirt";
						break;
					case ClothingType.FOOTWEAR: 
						desc += " as shoes";
						break;
					case ClothingType.PANTS: 
						desc += " as trousers" + getBulgesInPants();
						break;
				}
				
				if (i < (clothing.length - 3))
				{
					desc += ", ";
				}
				else if (i == (clothing.length - 2))
				{
					desc += " and ";
				}
			}
			
			return desc;
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
		public function getInterested(subj:Creature):Boolean
		{
			return sexualPreference.isOppositeGender(gender, subj.getApparentGender()); // trollface.jpg
		}
		
		/**
		 * By default, only allow rape if health == 0 or paralyzed.
		 * @param	rapist WHO BE RAPIN ME
		 *
		 */
		public function tryRape(rapist:Creature):Boolean
		{
			return (HP == 0 || Paralyze.isParalyzed(this));
		
		}
		
		public function getHostile(subj:Creature):Boolean
		{
			return false;
		}
		
		public function performConversion(oldMe:Creature):void
		{
		
		}
		
		public function changeFrom(f:Creature):void
		{
			this.performConversion(f);
		}
		
		public function loseTurns(numturns:int):void
		{
			turnsToLose += numturns;
		}
		
		public function getRapable():Boolean
		{
			return canRun() && HP < (maxHP / 3);
		}
		
		/**
		 * Alter the rape menu to fit your needs.
		 * @param	ply
		 * @param	menu
		 */
		public function onRape(ply:Creature, rape:Rape):void
		{
		
		}
		
		/**
		 * Does this character have any weapons?
		 * @return
		 */
		public function hasAnyWeapon():Boolean {
			for (var i:int = 0; i < arms.length; i++) {
				if (arms[0].weapon != null)
					return true;
			}
			return false;
		}
		
		/**
		 * Find any equipped weapon.
		 * @return
		 */
		public function getFirstWeapon():IWeapon {
			for (var i:int = 0; i < arms.length; i++) {
				if (arms[0].weapon != null)
					return arms[0].weapon;
			}
			return null;
		}
	}
}

