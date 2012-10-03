package org.sevenchan.dongs.creature
{
	import org.sevenchan.AdventureController;
	import com.adobe.serialization.json.*;
	import flash.events.Event;
	import flash.net.*;
	import org.sevenchan.dongs.ability.Instawin;
	import org.sevenchan.dongs.bodyparts.*;
	import org.sevenchan.dongs.*;
	import flash.utils.*;
	import org.sevenchan.dongs.creature.npc.NPC;
	import org.sevenchan.dongs.enchantment.Enchantment;
	import org.sevenchan.dongs.screens.CombatScreen;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class Player extends Creature
	{
		private var f:FileReference = new FileReference();
		public var baseType:Creature = new Human();
		private var saveFile:FileReference = null;
		private var waitingForLoad:Boolean = false;
		private var cancelled:Boolean = false;
		public var currentTown:Town = Town.knownTowns["barn"];
		
		public function Player(main:AdventureController)
		{
			this.main = main;
			//trace("Player.init()");
			super();
		}
		
		override public function addBreast():Breast
		{
			return baseType.addBreast();
		}
		
		override public function addDick(type:String = "default"):Penis
		{
			return baseType.addDick(type);
		}
		
		public function changeTo(t:Creature):void
		{
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
		
		override public function getExplored(loc:String):Boolean
		{
			for (var i:int = 0; i < baseType.explored.length; i++)
			{
				if (baseType.explored[i] == loc)
					return true;
			}
			return false;
		}
		
		override public function setExplored(loc:String):void
		{
			if (getExplored(loc))
				return;
			baseType.explored.push(loc);
		}
		
		public function save(slot:int = -1):void
		{
			if (slot == -1)
			{ // Export
				var ba:ByteArray = new ByteArray();
				ba.writeObject( {
					currentTown: currentTown.ID, 
					body: baseType,
					npcs: NPC.instances
				});
				ba.objectEncoding = ObjectEncoding.AMF3;
				var f:FileReference = new FileReference();
				f.save(ba, "save.dat");
			}
			else
			{
				var so:SharedObject = SharedObject.getLocal("7la_slot" + slot.toString());
				so.data.currentTown = currentTown.ID;
				so.data.body = baseType;
				so.data.npcs = NPC.instances;
				so.flush();
			}
		}
		
		public function load(slot:int = -1):Boolean
		{
			if (slot == -1)
			{
				waitingForLoad = true;
				f.addEventListener(Event.SELECT, onFileSelected);
				f.addEventListener(Event.CANCEL, onFileCancelled);
				if (!f.browse([new FileFilter("Saves", "*.dat")]))
					return false;
				return true;
			}
			else
			{
				var so:SharedObject = SharedObject.getLocal("7la_slot" + slot.toString());
				currentTown = Town.knownTowns[so.data.currentTown];
				baseType = so.data.body;
				return true;
			}
		}
		
		// Slot 1: Level 150 Bova in Horus's Spine 
		// [HP: 50, Lust: 50]
		public static function previewSlot(slot:int):String
		{
			try {
				var so:SharedObject = SharedObject.getLocal("7la_slot" + slot.toString());
				
				if (so == null || so.data == null)
					return "Empty Slot";
				
				var t:Town = Town.knownTowns[so.data.currentTown];
				var c:Creature = so.data.body;
				if (t == null || c == null)
					return "Empty Slot";
				var o:String = "Slot " + slot + ": Level " + c.level + " " + c.getTypeName() + " at " + t.name + "<br />";
				o += "[HP: " + c.HP + ", Lust: " + c.lust + "]";
				return o;
			} catch (e:Error) {
				trace(e.message + ": " + e.getStackTrace());
				return "Slot "+slot+": Corrupt/Outdated!";
			}
			return "???";
		}
		
		private function onFileSelected(e:Event):void
		{
			f.addEventListener(Event.COMPLETE, onFileLoaded);
			f.load();
		}
		
		private function onFileLoaded(e:Event):void
		{
			var saveData:Object = f.data.readObject();
			this.currentTown = Town.knownTowns[saveData.currentTown];
			this.baseType = saveData.body;
			if (saveData.hasOwnProperty("npcs"))
			{
				for(var k:Object in saveData.npcs){
					NPC.instances[k] = saveData.npcs[k];
				}
			}
			main.onPlayerLoaded();
		}
		
		private function onFileCancelled(e:Event):void
		{
		}
		
		override public function initialGenderSetup():void
		{
			baseType.initialGenderSetup();
		}
		
		override public function yourMove(cs:CombatScreen, ply:Creature):void
		{
		}
		
		public override function getDescription():String
		{
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
			descr += "<p>You, " + baseType.ownName + ", are " + Utils.A(baseType.gender.label) + " " + baseType.gender.label + " " + baseType.getTypeName() + " whose body " + baseType.build.getDescription() + "." + " You also possess " + baseType.hair.toString();
			
			if (baseType.hair == Hair.BALD)
				descr += ", your glistening scalp distracting from your ";
			else
				descr += ", which constrasts nicely with your ";
			if (baseType.eyes.length == 0)
				descr += " complete lack of eyes (<b>and resulting blindness</b>)";
			else
				descr += baseType.getEyesDescr();
			
			descr += " and " + baseType.skin.getDescr(0, this);
			descr += "</p>";
			
			descr += "<p>In the equipment department, ";
			//if (baseType.customized)
			//	descr += "you're a bit different from the average bear.  ";
			//else
			//	descr += "you're not too odd, compared to other "+baseType.getTypeName()+"s.  ";
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
				descr += "You have " + baseType.getArmsDescr() + ", ";
			else
				descr += "You don't have any arms (<b>and therefore can't attack</b>), ";
			
			if (baseType.legs.length > 0)
			{
				if (baseType.arms.length == 0)
					descr += "but you DO have ";
				else
					descr += "and ";
				descr += baseType.getLegsDescr() + ".";
			}
			else
				descr += "and no legs (<b>so you can't dodge attacks</b>).";
				
			descr += "You are wearing " + ((clothing.length > 0) ? "a " + getClothingDescr() : "nothing" ) + ".";;
				
			descr += "</p>";
			
			return baseType.gender.doReplace(descr);
		}
		
		override public function getTypeName():String
		{
			return baseType.getTypeName();
		}
		
		override public function levelUp(firstTime:Boolean = false):void
		{
			baseType.levelUp(firstTime);
		}
		
		public function setBaseType(base:Creature):void
		{
			baseType = base;
			baseType.abilities["instawin"] = new Instawin();
		}
		
		/*
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
		 */
		override public function get assholes():Vector.<Asshole>
		{
			return baseType._assholes;
		}
		
		override public function set assholes(balls:Vector.<Asshole>):void
		{
			baseType._assholes = balls;
			customized = true;
		}
		
		override public function get breasts():Vector.<Breast>
		{
			return baseType._breasts;
		}
		
		override public function set breasts(balls:Vector.<Breast>):void
		{
			baseType._breasts = balls;
			customized = true;
		}
		
		override public function get eyes():Vector.<Eye>
		{
			return baseType._eyes;
		}
		
		override public function set eyes(balls:Vector.<Eye>):void
		{
			baseType._eyes = balls;
			customized = true;
		}
		
		override public function get vaginas():Vector.<Vagina>
		{
			return baseType._vaginas;
		}
		
		override public function set vaginas(balls:Vector.<Vagina>):void
		{
			baseType._vaginas = balls;
			customized = true;
		}
		
		override public function get arms():Vector.<Arm>
		{
			return baseType._arms;
		}
		
		override public function set arms(arr:Vector.<Arm>):void
		{
			baseType._arms = arr;
			customized = true;
		}
		
		override public function get legs():Vector.<Leg>
		{
			return baseType._legs;
		}
		
		override public function set legs(arr:Vector.<Leg>):void
		{
			baseType._legs = arr;
			customized = true;
		}
		
		override public function get wings():Vector.<Wing>
		{
			return baseType._wings;
		}
		
		override public function set wings(arr:Vector.<Wing>):void
		{
			baseType._wings = arr;
			customized = true;
		}
		
		override public function get balls():Vector.<Testicle>
		{
			return baseType._balls;
		}
		
		override public function set balls(balls:Vector.<Testicle>):void
		{
			baseType._balls = balls;
			customized = true;
		}
		
		override public function get dicks():Vector.<Penis>
		{
			return baseType._dicks;
		}
		
		override public function set dicks(balls:Vector.<Penis>):void
		{
			baseType._dicks = balls;
			customized = true;
		}
		
		public override function get strength():int
		{
			return baseType.strength;
		}
		
		public override function set strength(value:int):void
		{
			baseType.strength = value;
		}
		
		public override function get mana():int
		{
			return baseType.mana;
		}
		
		public override function set mana(value:int):void
		{
			baseType.mana = value;
		}
		
		public override function get speed():int
		{
			return baseType.speed;
		}
		
		public override function set speed(value:int):void
		{
			baseType.speed = value;
		}
		
		public override function get intellect():int
		{
			return baseType.intellect;
		}
		
		public override function set intellect(value:int):void
		{
			baseType.intellect = value;
		}
		
		public override function get sensitivity():int
		{
			return baseType.sensitivity;
		}
		
		public override function set sensitivity(value:int):void
		{
			baseType.sensitivity = value;
		}
		
		public override function get abilities():Object
		{
			return baseType.abilities;
		}
		
		public override function set abilities(arr:Object):void
		{
			baseType.abilities = arr;
		}
		
		public override function get gender():Gender
		{
			return baseType.gender;
		}
		
		public override function set gender(arr:Gender):void
		{
			baseType.gender = arr;
		}
		
		public override function get level():int
		{
			return baseType.level;
		}
		
		public override function get HP():int
		{
			return baseType.HP;
		}
		
		public override function get maxHP():int
		{
			return baseType.maxHP;
		}
		
		public override function get maxMana():int
		{
			return baseType.maxMana;
		}
		
		public override function set HP(value:int):void
		{
			baseType.HP = value;
			main.refreshStats();
		}
		
		public override function get XP():int
		{
			return baseType.XP;
		}
		
		public override function get maxXP():int
		{
			trace("maxXP", baseType.maxXP);
			return baseType.maxXP;
		}
		
		public override function set XP(value:int):void
		{
			baseType.XP = value;
			main.refreshStats();
		}
		
		override public function get gold():int
		{
			return baseType.gold;
		}
		
		override public function set gold(value:int):void
		{
			baseType.gold = value;
		}
	}

}