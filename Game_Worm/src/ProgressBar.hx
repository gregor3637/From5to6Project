package;

import haxe.Constraints.Function;
import haxe.io.Error;
import motion.Actuate;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class ProgressBar extends Sprite {
	private var LEVEL_PROGRESSION:Float = 2;
	@:isVar public var maxValue(get, null):Float;
	@:isVar public var currentValue(get, null):Float;
	@:isVar public var canOverlap(get, set):Bool;
	@:isVar public var startOver(get, set):Int = -1;
	@:isVar public var percentageProgress(get, set):Float;// how to set this to 'protected' access, so only objects that extend the class have it ?!?
	@:isVar public var visualize(get, set):Function;
	
	public function new(startValue:Float = 0, endValue:Float = 1, isOverlooping:Bool = false) {
		super();
		this.currentValue = startValue;
		this.maxValue = endValue;
	}
	
	public function reset():Void {
		currentValue = 0;
	}
	
	
	
	
	public function updateByValue(value:Float = 0):Void {
		calculateEndValue(value);
	}
	public function updateByPercentOfCurrent(value:Float):Void {
		value = (value / 100) * currentValue;
		calculateEndValue(value);
	}
	public function updateByPercentOfTotal(value:Float):Void {
		value = (value / 100) * maxValue;
		calculateEndValue(value);
	}
	
	
	
	
	private function calculateEndValue(value:Float):Void {
		var percent:Float = 0;
		var trimmedPercent:Float = 0;
		
		currentValue += value;
		
		if (!canOverlap) {
			currentValue = MathUtils.roundToDecimal(currentValue, 2);
			currentValue = (currentValue > maxValue)? maxValue : currentValue;	
			
			percent = currentValue / maxValue;
			percentageProgress = MathUtils.roundToDecimal(percent, 2);
			percentageProgress = (percentageProgress > 1)? 1 : percentageProgress;
		}
		else {
			var hasLeftOver:Bool = true;
			startOver = -1;
			
			do {
				if (currentValue > maxValue) {
					currentValue = currentValue - maxValue;
					++startOver;
					maxValue = maxValue * LEVEL_PROGRESSION;
				}
				else {
					hasLeftOver = false;
				}
			} while (hasLeftOver);
			
			percent = currentValue / maxValue;
			percentageProgress = MathUtils.roundToDecimal(percent, 2);
			
			trace("ProgressBar | startOver = " + startOver);
		}
		
		visualize(percentageProgress);
	}
	
	//------------------------------------------ setters gettrs ------------------------------------------
	function get_visualize():Function { return visualize; }
	function set_visualize(value:Function):Function { return visualize = value; }
	
	function get_startOver():Int { return startOver; }
	function set_startOver(value:Int):Int { return startOver = value; }
	
	function get_maxValue():Float { return maxValue; }
	//function set_maxValue(value:Float):Float { return maxValue = value; }
	
	function get_currentValue():Float { return currentValue; }
	//function set_currentValue(value:Float):Float { return currentValue = value; }
	
	function get_canOverlap():Bool { return canOverlap; }
	function set_canOverlap(value:Bool):Bool { return canOverlap = value; }
	
	function get_percentageProgress():Float { return percentageProgress; }
	function set_percentageProgress(value:Float):Float { return percentageProgress = value; }
}