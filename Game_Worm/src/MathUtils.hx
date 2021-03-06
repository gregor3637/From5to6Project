package;

/**
 * ...
 * @author Mihail Mitov
 */
class MathUtils {
	
	static public function randomIntegerWithinRange(minNum:Int, maxNum:Int):Int {
		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	}
	
	
	static public function roundToDecimal(value:Float, decimals:Int):Float {
		var m:Float = Math.pow(10, decimals);
		return (Math.round(value * m) / m);
	}
	
	static public function sumOfNumbersWithMaxAllowedValue(currentValue:Float, valueToAdd:Float, maxAllowedValue:Float):Float {
		return (currentValue + valueToAdd < maxAllowedValue)? (currentValue + valueToAdd) : maxAllowedValue;
	}
	
	//static public function randomPickFromSelection(collection:Array<Int>, collectionPercentage:Array<Int>):Int {
		//var value:Int;
		//value = 
		//
		//return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	//}
	
	static public  function angleToRadians(angle:Float):Float {
		return angle / 180 * Math.PI;
	}
}