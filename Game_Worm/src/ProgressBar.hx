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
	private var percentageProgress:Float;
	
	private var LEVEL_PROGRESSION:Float = 2;
	
	
	private var bgImageData:BitmapData;
	private var bgImage:Bitmap;
	private var bgPath:String;
	
	private var progressImageData:BitmapData;
	private var progressImage:Bitmap;
	private var progressPath:String;
	
	public function new(startValue:Float = 0, endValue:Float = 1, isOverlooping:Bool = false) {
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
		percentageProgress = progressImage.scaleX;
	}
	
	public function reset():Void {
		currentValue = 0;
	}
	
	public function update(value:Float = 0, exactValue:Bool = false, percentageOfCurrentValue:Bool = false, percentageOfFullValue:Bool = false, canOverlap:Bool = false):Void {
		if ( 1 < Validation.conditionFrequency(true, [exactValue, percentageOfCurrentValue, percentageOfFullValue])) {
			//throw new Error("Only one condition from [exactValue,percentageOfCurrent,percentageOfFull] is allowed to be 'true' !");
			//throw new Error("n");
		}
		var percent:Float = 0;
		var trimmedPercent:Float = 0;
		
		if (percentageOfCurrentValue) {
			value = (value / 100) * currentValue;
		}
		if (percentageOfFullValue) {
			value = (value / 100) * totalValue;
		}
		
		if (!canOverlap) {
			currentValue += value;
			currentValue = MathUtils.roundToDecimal(currentValue, 2);
			currentValue = (currentValue > totalValue)? totalValue : currentValue;	
			
			percent = currentValue / totalValue;
			trimmedPercent = MathUtils.roundToDecimal(percent, 2);
			percentageProgress += trimmedPercent;
			percentageProgress = (percentageProgress > 1)? 1 : percentageProgress;
		}
		else {
			var startOver:Int = -1;
			var leftOver:Float = value;
			
			do {
				if (startOver > -1) {
					totalValue = totalValue * LEVEL_PROGRESSION;
				}
				currentValue += leftOver;
				leftOver = (currentValue > totalValue)? currentValue - totalValue : 0;
				currentValue = (currentValue > totalValue)? totalValue : currentValue;	
				++startOver;
			} while (currentValue >= totalValue);
			
			percent = currentValue / totalValue;
			percentageProgress = MathUtils.roundToDecimal(percent, 2);
			
			trace("ProgressBar | startOver = " + startOver);
		}
		
		animateProgress(percentageProgress);
	}
	
	private function animateProgress(percentageProgress:Float) {
		trace("ProgressBar | animateProgress | percentageProgress = " + percentageProgress);
		Actuate.tween(progressImage, 1, { scaleX: percentageProgress } );
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