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
	@:isVar public var reachedValue(get, null):Float;
	@:isVar public var canOverlap(get, set):Bool;
	@:isVar public var completeCycles(get, set):Int;
	@:isVar public var percentageComplete(get, set):Float;// how to set this to 'protected' access, so only objects that extend the class have it ?!?
	
	public function new(startValue:Float = 0, progressEndValue:Float = 1, canOverloop:Bool = false) {
		super();
		this.reachedValue = startValue;
		this.maxValue = progressEndValue;
		this.canOverlap = canOverloop;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		if (reachedValue != 0) {
			updateWithValue(0);
		}
	}
	
	public function reset():Void {
		reachedValue = 0;
	}
	public function updateWithValue(value:Float = 0):Void {
		recalculateCurrentValue(value);
	}
	public function updateWithPercentOfReached(value:Float):Void {
		value = (value / 100) * reachedValue;
		recalculateCurrentValue(value);
	}
	public function updateWithPercentOfMax(value:Float):Void {
		value = (value / 100) * maxValue;
		recalculateCurrentValue(value);
	}
	
	
	
	
	private function recalculateCurrentValue(valueToAdd:Float):Void {
		var percent:Float = 0;
		var trimmedPercent:Float = 0;
		var startPercentage:Float = (reachedValue / maxValue) * 100;
		completeCycles = 0;
		
		
		if (!canOverlap) {
			reachedValue += valueToAdd;
			reachedValue = MathUtils.roundToDecimal(reachedValue, 2);
			reachedValue = (reachedValue > maxValue)? maxValue : reachedValue;	
		}
		else {
			do {
				if (valueToAdd + reachedValue >= maxValue) {
					valueToAdd = (valueToAdd + reachedValue) - maxValue;
					reachedValue = 0;
					maxValue = maxValue * LEVEL_PROGRESSION;
					++completeCycles;
				}
				else {
					reachedValue = reachedValue + valueToAdd;
					valueToAdd = 0;
				}
			} while (valueToAdd > 0);
		}
		
		percent = (reachedValue / maxValue) * 100;
		percentageComplete = MathUtils.roundToDecimal(percent, 2);
		
		visualizeProgress(startPercentage, percentageComplete, completeCycles);
	}
	
	private function visualizeProgress(startFromPercentage:Float, stopAtPercentage:Float, completeCycles:Int = 0, isAnimated:Bool = true):Void {
	}
	
	public function timeBasedOnPercentageIncrease(start:Float, end:Float, loops:Int, timeForOneLoop:Float):Float {
		var passedHorizon:Bool = start > end; //350 , 50
		var fullRotationWithHigherEndPoint:Bool = !passedHorizon && loops > 0;  //350 - 355
		var fullRotationWithHigherStartPoint:Bool = passedHorizon && loops > 1; //350 - 50
		
		var deviation:Float = (passedHorizon)? (100 - start) + end : end - start; // (100 - 50) + 30 | (100 - 90) + 30
		
		var loopsTime:Float = 0;
		var deviationTime:Float = 0;
		var totalTime:Float = 0;
		
		if (fullRotationWithHigherEndPoint || fullRotationWithHigherStartPoint ) {
			loopsTime = loops * timeForOneLoop;
		}
		
		if (deviation > 50) { 
			deviationTime = 0.8 * timeForOneLoop;
		}
		else if (deviation > 25) {
			deviationTime = 0.5 * timeForOneLoop;
		}
		else if (deviation > 13) {
			deviationTime = 0.2 * timeForOneLoop;
		}
		else {
			deviationTime = 0.1 * timeForOneLoop;
		}
		
		totalTime = deviationTime + loopsTime;
		return totalTime;
	}
	
	
	//------------------------------------------ setters gettrs ------------------------------------------
	
	function get_completeCycles():Int { return completeCycles; }
	function set_completeCycles(value:Int):Int { return completeCycles = value; }
	
	function get_maxValue():Float { return maxValue; }
	//function set_maxValue(value:Float):Float { return maxValue = value; }
	
	function get_reachedValue():Float { return reachedValue; }
	//function set_reachedValue(value:Float):Float { return reachedValue = value; }
	
	function get_canOverlap():Bool { return canOverlap; }
	function set_canOverlap(value:Bool):Bool { return canOverlap = value; }
	
	function get_percentageComplete():Float { return percentageComplete; }
	function set_percentageComplete(value:Float):Float { return percentageComplete = value; }
}