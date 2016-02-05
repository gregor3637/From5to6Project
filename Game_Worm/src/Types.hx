package;
import openfl.utils.Object;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class Types {
	
	
	//static public var APPLE    = { healthEffect: Effect.Positive, pathToImage: "img/Collectables/collectable_Blue.png" };
	static public var APPLE    = { healthEffect: Effect.Positive, pathToImage: "img/objects/apple.png" };
	static public var GRAPES   = { healthEffect: Effect.Positive, pathToImage: "img/Collectables/collectable_Purple.png" };
	static public var KIWI     = { healthEffect: Effect.Positive, pathToImage: "img/Collectables/collectable_Green.png" };

	static public var SANDWICH = { healthEffect: Effect.Negative, pathToImage: "img/Collectables/collectable_Yellow.png" };
	static public var ALCOHOL  = { healthEffect: Effect.Negative, pathToImage: "img/Collectables/collectable_Grey.png" };
	static public var MEAT     = { healthEffect: Effect.Negative, pathToImage: "img/Collectables/collectable_Red.png" };

	static public var STAR     = { healthEffect: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };
	static public var MAGNET   = { healthEffect: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };
	static public var BOMB     = { healthEffect: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };

	static public var SNOW     = { healthEffect: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	static public var RAIN     = { healthEffect: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	
	static public var GOOD_COLLECTABLES = [APPLE, GRAPES, KIWI];
	static public var BAD_COLLECTABLES  = [SANDWICH, ALCOHOL, MEAT];
	static public var BONUS_COLLECTABLES  = [STAR, MAGNET, BOMB];
	static public var NEUTRAL_COLLECTABLES  = [SNOW, RAIN];
	
	static public var ALL_COLLECTABLES  = [GOOD_COLLECTABLES, BAD_COLLECTABLES, NEUTRAL_COLLECTABLES, BONUS_COLLECTABLES];
	
	
	
} 