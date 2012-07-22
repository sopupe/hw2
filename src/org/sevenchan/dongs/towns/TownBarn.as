package org.sevenchan.dongs.towns 
{
	import org.sevenchan.dongs.Creature;
	import org.sevenchan.dongs.creature.Player;
	import org.sevenchan.dongs.Item;
	import org.sevenchan.dongs.screens.Shop;
	import org.sevenchan.dongs.Town;
	
	/**
	 * ...
	 * @author Harbinger
	 */
	public class TownBarn extends Town 
	{
		public function TownBarn() 
		{
			super();
			ID = "barn";
			name = "The Barn";
			//inhabitants = [];
			isWilds = false;
			freeRest = true;
			connectedTowns = [
				"banala"
			];
			
			this.shops = {
				CART: new Shop("CART","The old demon's cart of wonders",this, 0.3, [
					ItemRegistry.BERRY_WHITE
				])
			};
		}
		
		override public function onRevelation():Boolean 
		{
			text = (<![CDATA[
			<h2>Welcome to Hell</h2>
			<p>You slowly awaken.</p>
			<p>
				You stand up, cursing from both pain and frustration as you survey your surroundings. You appear to have landed 
				in an ancient wooden barn, heavily damaged by an equally ancient fire. The roof is gone, and the blackened walls have 
				immense cracks through which you can see slivers of the outside world. Looking out through the warped windows, all you 
				can see are rolling red sand dunes beneath a bright, red sky that shimmers in the heat. The sun looms above, taking up 
				about two - thirds of the sky. The horizon is filled with shimmering mirages. You tense when you realize that one is 
				coming closer and growing larger, and your heart races. Besides the demons known to populate this land, you have no idea 
				what to expect, and duck behind a charred windowsill to be safe. You peek over the top, nervously observing.
			</p>
			<p>
				The mirage slowly takes the form of an old, frail sunburnt man atop an old, rickety merchant's wagon pulled by unseen, but 
				apparently domesticated creatures. As he draws nearer, a wheel creaks, and then snaps off, throwing the cursing old man 
				into the soft sand below. You cringe, praying that he'd okay, and sure enough, he stands and mutters in frustration. He 
				examines the remains of his wagon’s axle before sighing and initiating the process of setting up his shop in the back of 
				the wagon, still cursing under his breath.
			</p>
			<p>
				Satisfied that he’s probably not a threat, you quietly set up camp in the shaded back of the barn. However, you decide to 
				take your time and observe the merchant some more before approaching him for wares. This is Hell, after all. Who knows 
				what could happen?
			</p> 
			]]>).toString();
			
			return true;
		}
		
		override public function onEnter():void 
		{
			text = (<![CDATA[
			<p>
				You've managed to do some cleaning in the barn, mostly clearing out the old sawdust and hay so you can breathe without 
				erupting into a fit of coughing.  Your camp, with a new fire pit, is set up in the rear of the barn, where most of the 
				roof still remains and a small hand pump still dispenses surprisingly clean water.
			</p>
			]]>).toString();
		}
		
		override public function onSuccessfulRest():void 
		{
			text = (<![CDATA[
			<p>
				You ease yourself into your tent and curl up in the clean wool blanket, possibly the only surviving item left from Aldoria.  
				The smell of it soothes you into sleep, and you dream of your home.  You wake up  8 hours later, refreshed and alert.
			</p>
			]]>).toString();
		}
		
		override public function onExplore(bumpedInto:Creature):void 
		{
			text = (<![CDATA[
			<p>
				The barn is extremely old, and appears to have once stored horses, judging by the horseshoes on racks by the door.  No 
				horses exist anymore; the structure was largely gutted by fire some time ago, so only the walls and a portion of the 
				ceiling still stand.
			</p>
			<p>
				Sometime during the night, the merchant decided to move into the barn, and you suddenly notice that he has red skin, 
				like the demons, but doesn’t seem to have bothered you during your sleep.  Maybe there are multiple species, or factions 
				of demons?  You might be able to use this to your advantage.
			</p>
			]]>).toString();
		}
		
		override public function onShopBuyMenu():String 
		{
			return "<p>The old demon smiles, revealing a few yellowed teeth behind his dirty white beard, his eyes displaying a faint glimmer of dumb happiness. &quot;Great!  What can I get'ya?&quot;</p>";
		}
		
		override public function onShopSellMenu():String 
		{
			return "<p>He nods understandingly, and leans over to peer in your bag.  He's so close that you can smell how old he is. &quot;Okay, let's see what you've got.&quot;</p>";
		}
		
		override public function onShopWelcome():String 
		{
			return "<p>The merchant is a short, ancient demon, with a wispy white beard that blows across his face in the dry, dusty wind as he works to maintain his equally old wagon of wares. Startled, he whips around and flattens his back against the wagon.  Seeing that you are of no threat, he relaxes, letting out a whistly sigh. &quot;Good lord, kid, you nearly scared me to redeath.. Gonna have ta' put a bell on ya' so I can hear you comin'.&quot;  A wheazy chuckle escapes his red chest. &quot;So... What can I do ya' for?&quot;";
		}
	}

}