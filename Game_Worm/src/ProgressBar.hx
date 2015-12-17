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
	
	
	
	private var bgImageData:BitmapData;
	private var bgImage:Bitmap;
	private var bgPath:String;
	
	private var progressImageData:BitmapData;
	private var progressImage:Bitmap;
	private var progressPath:String;
	
	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		bgPath = "img/ProgressBar/Background.png";
		progressPath = "img/ProgressBar/HealthProgress.png";
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		bgImageData = Assets.getBitmapData(bgPath);
		bgImage = new Bitmap(bgImageData);
		this.addChild(image);
		
		progressPath = Assets.getBitmapData(progressPath);
		progressPath = new Bitmap(progressPath);
		this.addChild(progressPath);
	}
	
	public function reset():Void {
		currentValue = 0;
	}
	
	public function update(value:Float = 0, exactValue:Bool = false, percentageOfCurrent:Bool = false, percentageOfFull:Bool = false):Void {
		if ( 1 < Validation.conditionTimesMet(true, [exactValue, percentageOfCurrent, percentageOfFull]) {
			throw new Error("Only one condition from [exactValue,percentageOfCurrent,percentageOfFull] is allowed to be 'true' !");
		}
		
		
		//TODO: continue from here
		
		if (!exactValue) {
			
		}
		
		
		var startFromBeggining:Int = -1;
		
		do {
			currentValue += value;
			++startFromBeggining;
		} while (currentValue > totalValue)
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
		return currentValue = value;
	}
}