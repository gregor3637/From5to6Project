package;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class Indicators extends Sprite {
	
	@:isVar public var health(get, null):ProgressBar;
	@:isVar public var mana(get, null):ProgressBar;
	
	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		health = new RectangularProgress(20, 100);
		this.addChild(health);
		
		
		mana = new PieChartProgress(25, 100);
		mana.y = 100;
		this.addChild(mana);
	}
	
	function get_health():ProgressBar {
		return health;
	}
	
	function get_mana():ProgressBar {
		return mana;
	}
	
}