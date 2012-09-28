package org.sevenchan.dongs.creature.npc
{
	import org.sevenchan.dongs.Creature;
	import flash.net.*;
	
	/**
	 * Automatically marks a class for serialization.
	 * @author Harbinger
	 */
	public class NPC extends Creature
	{
		registerClassAlias("_NPC", NPC);
		
		/**
		 * All NPCs in the world.
		 */
		public static var instances:Object = {};
		
		/**
		 * The unique ID of this particular NPC.
		 */
		public var instanceID:String = "";
		
		/**
		 * Create our NPC with a unique ID (AKA its fucking name).
		 * @param	instanceID
		 */
		public function NPC(instanceID:String)
		{
			super();
			this.staticStats = true; // Because we're not autogen'd.
			if (instances.hasOwnProperty(instanceID))
				throw Error("YOU FUCKING IDIOT, " + instanceID + " IS ALREADY TAKEN");
			this.instanceID = instanceID;
		}
		
		/**
		 * Store the NPC in the global community.
		 */
		public final function save():void
		{
			onSave();
			instances[instanceID] = this;
		}
		
		/**
		 * Load NPC from the global community.
		 */
		public final function load():void
		{
			if (instances.hasOwnProperty(instanceID))
			{
				_abilities = (instances[instanceID] as Creature)._abilities;
				_arms = (instances[instanceID] as Creature)._arms;
				_assholes = (instances[instanceID] as Creature)._assholes;
				_balls = (instances[instanceID] as Creature)._balls;
				_breasts = (instances[instanceID] as Creature)._breasts;
				_dicks = (instances[instanceID] as Creature)._dicks;
				_eyes = (instances[instanceID] as Creature)._eyes;
				_gender = (instances[instanceID] as Creature)._gender;
				_gold = (instances[instanceID] as Creature)._gold;
				_HP = (instances[instanceID] as Creature)._HP;
				_intellect = (instances[instanceID] as Creature)._intellect;
				_legs = (instances[instanceID] as Creature)._legs;
				_level = (instances[instanceID] as Creature)._level;
				_lust = (instances[instanceID] as Creature)._lust;
				_mana = (instances[instanceID] as Creature)._mana;
				_sensitivity = (instances[instanceID] as Creature)._sensitivity;
				_speed = (instances[instanceID] as Creature)._speed;
				_strength = (instances[instanceID] as Creature)._strength;
				_vaginas = (instances[instanceID] as Creature)._vaginas;
				_wings = (instances[instanceID] as Creature)._wings;
				_XP = (instances[instanceID] as Creature)._XP;
				build = (instances[instanceID] as Creature).build;
				customized = (instances[instanceID] as Creature).customized;
				enchantments = (instances[instanceID] as Creature).enchantments;
				explored = (instances[instanceID] as Creature).explored;
				hair = (instances[instanceID] as Creature).hair;
				height = (instances[instanceID] as Creature).height;
				inventory = (instances[instanceID] as Creature).inventory;
				material = (instances[instanceID] as Creature).material;
				ownName = (instances[instanceID] as Creature).ownName;
				skin = (instances[instanceID] as Creature).skin;
			}
			else
				onNewNPC();
			onLoad(instances.hasOwnProperty(instanceID)?(instances[instanceID] as NPC):null);
		}
		
		/**
		 * The NPC is brand new, hasn't been stored yet.
		 */
		public function onNewNPC():void
		{
		}
		
		/**
		 * The NPC has been loaded (onNewNPC() called first)
		 * npc is null if NPC is new.
		 */
		public function onLoad(npc:NPC):void
		{
		}
		
		/**
		 * About to save the NPC
		 */
		public function onSave():void
		{
		}
	}

}