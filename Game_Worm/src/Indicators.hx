package;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class Indicators extends Sprite{
	
	private var health:ProgressBar;
	
	public function new() {
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		health = new ProgressBar();
		this.addChild(health);
	}
	
	public function changeHealth(value:Int = 0, exactValue:Bool = false, percentageOfCurrent:Bool = false, percentageOfFull:Bool = false):Void {
		
	}
	
}