package;
import MathUtils;

/**
 * ...
 * @author Mihail Mitov
 */
class CollectableTypeControl {
	public static inline var TOTAL_ELEMENTS:Int = 100;
	public static inline var BONUS_FREQUENCY:Int = 1;
	public static inline var NEUTRAL_FREQUENCY:Int = 15;
	private var effectSequence(get, null):Array<Effect>;
	private var currentIndex:Int = -1;
	
	
	public function new() {
		effectSequence;
	}
	
	public function getType() { 
		if (++currentIndex >= TOTAL_ELEMENTS) {
			currentIndex = 0;
		}
		var effect:Effect = effectSequence[currentIndex];
		//trace("Type.enumIndex(effect) = " + Type.enumIndex(effect));
		var objectsCollection = Types.ALL_COLLECTABLES[Type.enumIndex(effect)];
		var objectIndex:Int = MathUtils.randomIntegerWithinRange(0, objectsCollection.length - 1);
		var object = objectsCollection[objectIndex];
		var cvo:CollectableInfoVO = new CollectableInfoVO(object.healthEffect, object.pathToImage);
		
		return cvo;
	}
	
	function get_effectSequence():Array<Effect> {
		if (effectSequence == null) {
			effectSequence = new Array<Effect>();
			
			var bonusPercentage:Float = (TOTAL_ELEMENTS * BONUS_FREQUENCY) / 100;
			var neutralPercentage:Float = (TOTAL_ELEMENTS * NEUTRAL_FREQUENCY) / (100 - bonusPercentage);
			
			for (a in 0...TOTAL_ELEMENTS) {
				var rand:Float = Math.random() * 100;
				var value:Effect;
				
				if (rand <= bonusPercentage) {
					value = Effect.Bonus;
				} 
				else if (rand <= neutralPercentage) {
					value = Effect.Neutral;
				}
				else {
					value = (Math.random() > 0.5)? Effect.Positive : Effect.Negative;
				}
				
				effectSequence[a] = value;
			}
			
			
			//TODO: logic for "bonus frequency is below percentage"
			//if (sequence.indexOf(0) < 0) {
				//sequence[MathUtils.randomIntegerWithinRange(0, 100)] = Type.enumIndex(Effect.Bonus);
			//}
			//TODO: logic for "bonus frequency is above percentage"
			//trace(effectSequence);
		}
		
		
		return effectSequence;
	}
	
}