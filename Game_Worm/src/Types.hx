package;
import openfl.utils.Object;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class Types {
	
	
	//static public var APPLE    = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/collectable_Blue.png" };
	static public var APPLE    = { isHealthy: Effect.Positive, pathToImage: "img/objects/apple.png" };
	static public var GRAPES   = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/collectable_Purple.png" };
	static public var KIWI     = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/collectable_Green.png" };

	static public var SANDWICH = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/collectable_Yellow.png" };
	static public var ALCOHOL  = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/collectable_Grey.png" };
	static public var MEAT     = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/collectable_Red.png" };

	static public var STAR     = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };
	static public var MAGNET   = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };
	static public var BOMB     = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };

	static public var SNOW     = { isHealthy: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	static public var RAIN     = { isHealthy: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	
	static public var GOOD_COLLECTABLES = [APPLE, GRAPES, KIWI];
	static public var BAD_COLLECTABLES  = [SANDWICH, ALCOHOL, MEAT];
	static public var BONUS_COLLECTABLES  = [STAR, MAGNET, BOMB];
	static public var NEUTRAL_COLLECTABLES  = [SNOW, RAIN];
	
	static public var ALL_COLLECTABLES  = [GOOD_COLLECTABLES, BAD_COLLECTABLES, NEUTRAL_COLLECTABLES, BONUS_COLLECTABLES];
	
	
	
} 