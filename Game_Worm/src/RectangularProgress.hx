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
	
	public function new(startValue:Float = 0, endValue:Float=1, isOverlooping:Bool=false) {
		super(startValue, endValue, isOverlooping);
		
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		bgPath = "img/ProgressBar/Background.png";
		progressPath = "img/ProgressBar/HealthProgress.png";
		
		this.visualize = animateProgress;
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		bgImageData = Assets.getBitmapData(bgPath);
		bgImage = new Bitmap(bgImageData);
		this.addChild(bgImage);
		
		progressImageData = Assets.getBitmapData(progressPath);
		progressImage = new Bitmap(progressImageData);
		this.addChild(progressImage);
		
		progressImage.scaleX = currentValue / maxValue;
		percentageProgress = progressImage.scaleX;
		animateProgress(percentageProgress);
	}
	
	private function animateProgress(percentageProgress:Float):Void {
		trace("RectangularProgress | animateProgress | percentageProgress = " + percentageProgress);
		Actuate.tween(progressImage, 1, { scaleX: percentageProgress } );
	}
	
	
}