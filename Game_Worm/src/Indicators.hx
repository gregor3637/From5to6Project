package;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class Indicators extends Sprite {
	
	@:isVar public var health(get, null):ProgressBar;
	
	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		health = new ProgressBar(20, 100);
		this.addChild(health);
	}
	
	public function changeHealth(value:Int = 0, exactValue:Bool = false, percentageOfCurrent:Bool = false, percentageOfFull:Bool = false):Void {
		health.update(value, false, exactValue, percentageOfCurrent, percentageOfFull);
	}
	
	function get_health():ProgressBar {
		return health;
	}
	
}