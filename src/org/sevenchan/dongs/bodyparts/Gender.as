package org.sevenchan.dongs.bodyparts 
{
	import flash.net.registerClassAlias;
	/**
	 * ...
	 * @author N3X15
	 */
	public class Gender 
	{
		registerClassAlias("P_Gender", Gender);
															//              SUBJ	OBJ		REF			POS		PP
												            //derp			I		me		myself 		my		mine	dick	vag
		public static const MALE:Gender 		= new Gender("male",		"he",	"his",	"himself",	"his",	"his",	true,	false);
		public static const FEMALE:Gender 		= new Gender("female",		"she",	"her",	"herself",	"her",	"hers",	false,	true);
		public static const HERM:Gender 		= new Gender("hermophrodite","shi",	"hir",	"hirself",	"hir",	"hirs",	true,	true); // Might change to its
		public static const ASEXUAL:Gender		= new Gender("asexual",		"it",	"its",	"itself",	"its",	"its",	false,	false);
		public static const YOU:Gender			= new Gender("-",			"you",	"your",	"yourself",	"your",	"your",	false,	false);
		
		public var label:String;
		
		/**
		 * He/she/it
		 */
		public var subject:String;
		
		/**
		 * Who are we talking about?
		 * 
		 * Him/her/it (me)
		 */
		public var objective:String;
		
		/**
		 * Himself/herself/itself
		 */
		public var reflexive:String;
		
		/**
		 * Who owns X?
		 * 
		 * His/her/its (mine)
		 */
		public var possessive:String;
		
		/**
		 * His/hers/its
		 */
		public var possessivePronoun:String;
		
		public var hasDick:Boolean;
		public var hasVag:Boolean;
		public function Gender(label:String = "", Subject:String = "", Objective:String = "", Reflexive:String = "", Possessive:String = "", PossessivePronoun:String = "", hasDick:Boolean = false , hasVag:Boolean = false ) 
		{
			this.label = label;
			this.subject = Subject;
			this.objective = Objective;
			this.reflexive = Reflexive;
			this.possessive = Possessive;
			this.possessivePronoun = PossessivePronoun;
			this.hasDick = hasDick;
			this.hasVag = hasVag;
		}	
		
		/**
		 * Replaces %SUB% with subjective gender, %OBJ% with objectives, %REF% with reflexives, %POS% with possessive, and %POSP% with possessive pronouns.
		 * @param _s
		 * @return
		 */
		public function doReplace(_s:String):String {
			var s:String = _s;
			s=s.replace(/%SUB%/g, subject);
			s=s.replace(/%CSUB%/g, subject.substr(0,1).toUpperCase()+subject.substr(1));
			s=s.replace(/%OBJ%/g, objective);
			s=s.replace(/%COBJ%/g, objective.substr(0,1).toUpperCase()+objective.substr(1));
			s=s.replace(/%REF%/g, reflexive);
			s=s.replace(/%CREF%/g, reflexive.substr(0,1).toUpperCase()+reflexive.substr(1));
			s=s.replace(/%POS%/g, possessive);
			s=s.replace(/%CPOS%/g, possessive.substr(0,1).toUpperCase()+possessive.substr(1));
			s = s.replace(/%PP%/g, possessivePronoun);
			s=s.replace(/%CPP%/g, possessivePronoun.substr(0,1).toUpperCase()+possessivePronoun.substr(1));
			return s;
		}
	}
}