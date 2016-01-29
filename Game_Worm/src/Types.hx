package;
import openfl.utils.Object;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class Types {
	
	static public var AVOCADO     = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/avocado.png" };
	static public var LETTUCE    = { isHealthy: Effect.Positive, pathToImage: "img/objects/lettuce.png" };
	static public var APPLE   = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/apple.png" };
	static public var WATERMELON     = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/watermelon.png" };
	static public var CARROT     = { isHealthy: Effect.Positive, pathToImage: "img/Collectables/carot.png" };

	static public var SAUSAGE = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/sausage.png" };
	static public var BURGER  = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/burger.png" };
	static public var PIZZA     = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/pizza.png" };
	static public var FRESHFRIES     = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/frenchFries.png" };
	static public var DONUT     = { isHealthy: Effect.Negative, pathToImage: "img/Collectables/donut.png" };

	static public var GOODBASKET     = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/goodBasket.png" };
	static public var BADBASKET     = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/badBasket.png" };
	//static public var MAGNET   = { isHealthy: Effect.Bonus,    pathToImage: "img/Collectables/collectable_Red.png" };

	static public var SNOW     = { isHealthy: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	static public var RAIN     = { isHealthy: Effect.Neutral,  pathToImage: "img/Collectables/collectable_Red.png" };
	
	static public var GOOD_COLLECTABLES = [AVOCADO, LETTUCE, APPLE, WATERMELON, CARROT];
	static public var BAD_COLLECTABLES  = [SAUSAGE, BURGER, PIZZA, FRESHFRIES, DONUT];
	static public var BONUS_COLLECTABLES  = [GOODBASKET];
	static public var NEUTRAL_COLLECTABLES  = [SNOW, RAIN];
	
	static public var ALL_COLLECTABLES  = [GOOD_COLLECTABLES, BAD_COLLECTABLES, NEUTRAL_COLLECTABLES, BONUS_COLLECTABLES];
	
	
	
} 