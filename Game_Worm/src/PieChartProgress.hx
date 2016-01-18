package;
import motion.Actuate;
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
	@:isVar public var curPieStep(get, set):Float;
	
	private	var pieMaxStep:Int = 60;
	private	var pieAngleStep:Int = Math.round(360 / 60);//(360 / pieMaxStep)
	private	var pieSprite:Sprite = new Sprite();
	
	public function new(startValue:Float = 0, endValue:Float = 1, isOverlooping:Bool = false) {
		super(startValue, endValue, isOverlooping);
		
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		this.visualize = visualizeProgress;
		
		curPieStep = 0;
		if (currentValue != 0) {
			this.visualize(currentValue / 100, false);
		}
	}
	
	private function init(ev:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		addChild(pieSprite);
		pieSprite.x = 100;
		pieSprite.y = 100;
		pieSprite.rotation = -90;
	}
	
	
	
	
	
	private function visualizeProgress(value:Float, animateIt:Bool = true):Void {
		var pieChartProgress:Float = value * pieMaxStep;
		
		if (animateIt) {
			Actuate.update(animate, 2, [curPieStep], [pieChartProgress]);
		}
		else {
			curPieStep = pieChartProgress;
			drawPie();
		}
	}
	
	private function animate(value:Float) {
		curPieStep = value;
		drawPie();
	}
	
	function get_curPieStep():Float { return curPieStep; }
	function set_curPieStep(value:Float):Float { return curPieStep = (value % pieMaxStep); }

	private function drawPie():Void {
		pieSprite.graphics.clear();
		fillRound(pieSprite.graphics, 100, 0, pieAngleStep * curPieStep);
	}
	
	
	
	
	
	
	
	
	
	//private function fillRound(graphics:Graphics, color:UInt = 0x000000, alpha:Float = 1, radius:Float = 10, startAngle:Float = 0, endAngle:Float = 360, angleStep:Float = 1):Void {
	private function fillRound(graphics:Graphics, radius:Float = 10, startAngle:Float = 0, endAngle:Float = 360, angleStep:Float = 1):Void {
		var tempRadians:Float;
		var startRadians:Float = convertAngleToRadians(startAngle);
		var endRadians:Float = convertAngleToRadians(endAngle);
		var radiansStep:Float = convertAngleToRadians(angleStep);
		
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
	
	private function convertAngleToRadians(angle:Float):Float {
		return angle / 180 * Math.PI;
	}
	
	
}