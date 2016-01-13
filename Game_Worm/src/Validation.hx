package;

/**
 * ...
 * @author Mihail Mitov
 */
class Validation{

	//returns the number of time a comndition is met in an array of bools
	public static function conditionFrequency(condition:Bool, elements:Array<Bool>):Int {
		return Lambda.filter(elements, function(n) { return n == condition ;}).length;
	}
	
}