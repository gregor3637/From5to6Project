package;

/**
 * ...
 * @author Mihail Mitov
 */
class MathUtils {
	
	static public function randomIntegerWithinRange(minNum:Int, maxNum:Int):Int {
		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	}
	
	//static public function randomPickFromSelection(collection:Array<Int>, collectionPercentage:Array<Int>):Int {
		//var value:Int;
		//value = 
		//
		//return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	//}
}