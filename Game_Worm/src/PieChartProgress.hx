package;
import motion.Actuate;
import motion.easing.Linear;
import motion.easing.Quad;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Graphics;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Point;

/**
 * ...
 * @author Mihail Mitov
 */
class PieChartProgress extends ProgressBar {
	static public inline var TIME_PER_ONE_CIRCUIT:Float = 2;//in seconds
	@:isVar public var curPieStep(get, set):Float;
	
	private	var pieMaxStep:Int = 60;
	private	var pieAngleStep:Int = Math.round(360 / 60);//(360 / pieMaxStep)
	private	var pieSprite:Sprite = new Sprite();
	
	public function new(startValue:Float = 0, endValue:Float = 1, isOverlooping:Bool = false) {
		super(startValue, endValue, isOverlooping);
		curPieStep = 0;
	}
	
	override private function init(ev:Event):Void {
		super.init(ev);
		
		addChild(pieSprite);
		pieSprite.x = 100;
		pieSprite.y = 100;
		//set wheel to our 0 degrees
		pieSprite.rotation = -90;
	}
	
	override private function visualizeProgress(startFromPercentage:Float, stopAtPercentage:Float, completeCycles:Int = 0, isAnimated:Bool = true):Void {
		var percentageIncrease:Float = (completeCycles * 100) + stopAtPercentage;
		var endPieStep:Float = (percentageIncrease / 100 ) * pieMaxStep;
		
		if (isAnimated) {
			var animationTime:Float = super.timeBasedOnPercentageIncrease(startFromPercentage, stopAtPercentage, completeCycles, TIME_PER_ONE_CIRCUIT);
			Actuate.update(drawPie, animationTime, [curPieStep], [endPieStep])
					.ease(Quad.easeInOut);
					//.ease(Linear.easeNone);
		}
		else {
			drawPie(endPieStep);
		}
	}

	private function drawPie(value:Float):Void {
		curPieStep = value;
		pieSprite.graphics.clear();
		draw(pieSprite.graphics, 100, 0, pieAngleStep * curPieStep);
	}
	
	private function draw(graphics:Graphics, radius:Float = 10, startAngle:Float = 0, endAngle:Float = 360, angleStep:Float = 1):Void {
		var tempRadians:Float;
		var startRadians:Float = MathUtils.angleToRadians(startAngle);
		var endRadians:Float = MathUtils.angleToRadians(endAngle);
		var radiansStep:Float = MathUtils.angleToRadians(angleStep);
		
		var tempPoint:Point;
		
		//graphics.beginFill(color, alpha);
		graphics.beginFill( 0x000000, alpha);
		
		if (endAngle % 360 == startAngle % 360) {
			graphics.drawCircle(0, 0, radius);
		}
		else {
			var pointsCount:Int = Math.ceil((endAngle - startAngle) / angleStep);
			
			for (pointIndex in 0...pointsCount) {
				tempRadians = startRadians + pointIndex * radiansStep;
				
				tempPoint = new Point();
				tempPoint.x = Math.cos(tempRadians) * radius;
				tempPoint.y = Math.sin(tempRadians) * radius;
				
				graphics.lineTo(tempPoint.x, tempPoint.y);
			}
		}
		
		graphics.endFill();
	}
	
	function get_curPieStep():Float { return curPieStep; }
	function set_curPieStep(value:Float):Float { return curPieStep = (value % pieMaxStep); }
}