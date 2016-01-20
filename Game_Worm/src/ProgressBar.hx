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
	private var canTrace:Bool = true;
	private var LEVEL_PROGRESSION:Float = 2;
	
	@:isVar public var maxValue(get, null):Float;
	@:isVar public var currentValueOfMaxValue(get, null):Float;
	@:isVar public var canOverlap(get, set):Bool;
	@:isVar public var startOver(get, set):Int = -1;
	@:isVar public var percentageComplete(get, set):Float;// how to set this to 'protected' access, so only objects that extend the class have it ?!?
	@:isVar public var visualize(get, set):Function;
	
	public function new(startValue:Float = 0, endValue:Float = 1, canOverloop:Bool = false) {
		super();
		this.currentValueOfMaxValue = startValue;
		this.maxValue = endValue;
		this.canOverlap = canOverloop;
	}
	
	public function reset():Void {
		currentValueOfMaxValue = 0;
	}
	public function updateWithValue(value:Float = 0):Void {
		if(canTrace) trace("ProgressBar | updateWithValue | currentValueOfMaxValue (1)              = " + currentValueOfMaxValue);
		if(canTrace) trace("ProgressBar | updateWithValue | value adding                            = " + value);
		recalculateCurrentValue(value);
	}
	public function updateWithPercentOfCurrent(value:Float):Void {
		if(canTrace) trace("ProgressBar | updateWithPercentOfCurrent | currentValueOfMaxValue (1)   = " + currentValueOfMaxValue);
		if(canTrace) trace("ProgressBar | updateWithPercentOfCurrent | %     adding                 = " + value);
		value = (value / 100) * currentValueOfMaxValue;
		if(canTrace) trace("ProgressBar | updateWithPercentOfCurrent | value adding                 = " + value);
		recalculateCurrentValue(value);
	}
	public function updateWithPercentOfTotal(value:Float):Void {
		if(canTrace) trace("ProgressBar | updateWithPercentOfTotal   | currentValueOfMaxValue (1)   = " + currentValueOfMaxValue);
		if(canTrace) trace("ProgressBar | updateWithPercentOfTotal   |  %     adding                = " + value);
		value = (value / 100) * maxValue;
		if(canTrace) trace("ProgressBar | updateWithPercentOfTotal   |  value adding                = " + value);
		recalculateCurrentValue(value);
	}
	
	
	
	
	private function recalculateCurrentValue(valueToAdd:Float):Void {
		var percent:Float = 0;
		var trimmedPercent:Float = 0;
		var startPercentage:Float = (currentValueOfMaxValue / maxValue) * 100;
		startOver = 0;
		
		if(canTrace) trace("ProgressBar | recalculateCurrentValue | maxValue     (1)             = " + maxValue);
		
		
		if (!canOverlap) {
			currentValueOfMaxValue += valueToAdd;
			currentValueOfMaxValue = MathUtils.roundToDecimal(currentValueOfMaxValue, 2);
			currentValueOfMaxValue = (currentValueOfMaxValue > maxValue)? maxValue : currentValueOfMaxValue;	
			
			percent = currentValueOfMaxValue / maxValue;
			percentageComplete = MathUtils.roundToDecimal(percent, 2);
			percentageComplete = (percentageComplete > 1)? 1 : percentageComplete;
		}
		else {
			do {
				if (currentValueOfMaxValue + valueToAdd >= maxValue) {
					valueToAdd = valueToAdd - (maxValue - currentValueOfMaxValue);
					currentValueOfMaxValue = 0;
					maxValue = maxValue * LEVEL_PROGRESSION;
					++startOver;
				}
				else {
					currentValueOfMaxValue = currentValueOfMaxValue + valueToAdd;
					valueToAdd = 0;
				}
			} while (valueToAdd > 0);
			
			percent = (currentValueOfMaxValue / maxValue) * 100;
			percentageComplete = MathUtils.roundToDecimal(percent, 3);
			
			if(canTrace) trace("ProgressBar | recalculateCurrentValue | maxValue     (2)             = " + maxValue);
			if(canTrace) trace("ProgressBar | recalculateCurrentValue | currentValueOfMaxValue (2)   = " + currentValueOfMaxValue);
			if(canTrace) trace("ProgressBar | recalculateCurrentValue | startOver                    = " + startOver);
			if(canTrace) trace("ProgressBar | recalculateCurrentValue | percentageComplete           = " + percentageComplete);
		}
		
		visualize(startPercentage, percentageComplete, startOver);
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
	function get_visualize():Function { return visualize; }
	function set_visualize(value:Function):Function { return visualize = value; }
	
	function get_startOver():Int { return startOver; }
	function set_startOver(value:Int):Int { return startOver = value; }
	
	function get_maxValue():Float { return maxValue; }
	//function set_maxValue(value:Float):Float { return maxValue = value; }
	
	function get_currentValueOfMaxValue():Float { return currentValueOfMaxValue; }
	//function set_currentValueOfMaxValue(value:Float):Float { return currentValueOfMaxValue = value; }
	
	function get_canOverlap():Bool { return canOverlap; }
	function set_canOverlap(value:Bool):Bool { return canOverlap = value; }
	
	function get_percentageComplete():Float { return percentageComplete; }
	function set_percentageComplete(value:Float):Float { return percentageComplete = value; }
}