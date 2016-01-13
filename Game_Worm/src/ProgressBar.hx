package;

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
class ProgressBar extends Sprite{
	@:isVar private var totalValue(get, set):Float;
	@:isVar private var currentValue(get, set):Float;
	
	private var LEVEL_PROGRESSION:Float = 1.5;
	
	
	private var bgImageData:BitmapData;
	private var bgImage:Bitmap;
	private var bgPath:String;
	
	private var progressImageData:BitmapData;
	private var progressImage:Bitmap;
	private var progressPath:String;
	
	public function new(startValue:Float = 0, endValue:Float = 10, isOverlooping:Bool = false) {
		super();
		this.currentValue = startValue;
		this.totalValue = endValue;
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		bgPath = "img/ProgressBar/Background.png";
		progressPath = "img/ProgressBar/HealthProgress.png";
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		bgImageData = Assets.getBitmapData(bgPath);
		bgImage = new Bitmap(bgImageData);
		this.addChild(bgImage);
		
		progressImageData = Assets.getBitmapData(progressPath);
		progressImage = new Bitmap(progressImageData);
		this.addChild(progressImage);
		
		progressImage.scaleX = currentValue / totalValue;
	}
	
	public function reset():Void {
		currentValue = 0;
	}
	
	public function update(value:Float = 0, canOverlap:Bool = false, exactValue:Bool = false, percentageOfCurrentValue:Bool = false, percentageOfFullValue:Bool = false):Void {
		if ( 1 < Validation.conditionFrequency(true, [exactValue, percentageOfCurrentValue, percentageOfFullValue])) {
			//throw new Error("Only one condition from [exactValue,percentageOfCurrent,percentageOfFull] is allowed to be 'true' !");
			//throw new Error("n");
		}
		
		
		//TODO: continue from here
		
		//this means it cant loop //hmmm or does it ? whem we have 99% of the bar progress and we get to this point 
		if (!canOverlap) {
			if (exactValue) {
				currentValue = MathUtils.sumOfNumbersWithMaxAllowedValue(currentValue, value, totalValue);
			}
			
			if (percentageOfCurrentValue) {
				var valueToBeAdd:Float = MathUtils.roundToDecimal(currentValue / value, 2);
				currentValue = MathUtils.sumOfNumbersWithMaxAllowedValue(currentValue, valueToBeAdd, totalValue);
			}
			
			if (percentageOfFullValue) {
				var valueToBeAdd:Float = MathUtils.roundToDecimal(totalValue / value, 2);
				currentValue = MathUtils.sumOfNumbersWithMaxAllowedValue(currentValue, valueToBeAdd, totalValue);
			}
		}
		
		
		
		else {
			var overlapCount:Int = -1;
			
			do {
				if (currentValue == totalValue) {
					totalValue = currentValue * LEVEL_PROGRESSION;
				}
				currentValue += value;
				++overlapCount;
			} while (currentValue > totalValue);
			
			trace("ProgressBar | overlapCount = " + overlapCount);
		}
		
		animateProgress();
	}
	
	private function animateProgress() {
		Actuate.tween(progressImage, 2, { scaleX: 1 } );
	}
	
	function get_totalValue():Float {
		return totalValue;
	}
	
	function set_totalValue(value:Float):Float {
		return totalValue = value;
	}
	
	function get_currentValue():Float {
		return currentValue;
	}
	
	function set_currentValue(value:Float):Float {
		trace("ProgressBar | set_currentValue = " + value);
		return currentValue = value;
	}
}