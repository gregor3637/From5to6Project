package;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class Indicators extends Sprite {
	private var health:RectangularProgress;
	private var mana:PieChartProgress;
	
	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		
		//health = new RectangularProgress(20, 100, true);
		//this.addChild(health);
		
		mana = new PieChartProgress(40, 100, true);
		mana.y = 100;
		this.addChild(mana);
	}
	
	public function updateMana(ev:Event):Void {
		if (ev.type == MoveCommandEvent.CHANGED) {
			//mana.updateWithPercentOfMax(80);
			mana.updateWithValue(100);
		}
		else {
			//health.updateWithValue(100);
		}
	}
	
}