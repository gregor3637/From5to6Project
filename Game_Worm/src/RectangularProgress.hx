package;
import motion.Actuate;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class RectangularProgress extends ProgressBar {
	private var bgImageData:BitmapData;
	private var bgImage:Bitmap;
	private var bgPath:String;
	
	private var progressImageData:BitmapData;
	private var progressImage:Bitmap;
	private var progressPath:String;
	
	public function new(startValue:Float = 0, endValue:Float = 1, isOverlooping:Bool = false) {
		super(startValue, endValue, isOverlooping);
		bgPath = "img/ProgressBar/Background.png";
		progressPath = "img/ProgressBar/HealthProgress.png";
	}
	
	override private function init(ev:Event):Void {
		super.init(ev);
		
		bgImageData = Assets.getBitmapData(bgPath);
		bgImage = new Bitmap(bgImageData);
		this.addChild(bgImage);
		
		progressImageData = Assets.getBitmapData(progressPath);
		progressImage = new Bitmap(progressImageData);
		this.addChild(progressImage);
		
		progressImage.scaleX = super.reachedValue/ super.maxValue;
		percentageComplete = progressImage.scaleX;
	}
	
	override private function visualizeProgress(startFromPercentage:Float, stopAtPercentage:Float, completeCycles:Int = 0, isAnimated:Bool = true):Void {
		trace("RectangularProgress | animateProgress | stopAtPercentage   = " + stopAtPercentage);
		trace("RectangularProgress | animateProgress | completeCycles     = " + completeCycles);
		trace("RectangularProgress | animateProgress | isAnimated         = " + isAnimated);
		stopAtPercentage = stopAtPercentage / 100;
		if (isAnimated) {
			Actuate.tween(progressImage, 1, { scaleX: stopAtPercentage } );
		}
		else {
			progressImage.scaleX = stopAtPercentage;
		}
	}
	
	
}