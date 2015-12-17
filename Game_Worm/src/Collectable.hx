package;
import openfl.events.Event;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class Collectable extends VisibleStaticObject{
	static public inline var DESTROYED:String = "destroyed";
	@:isVar public var isHealthy(get, set):Effect;

	
	public function new(path:String) {
		super(path);
		
		//isHealthy = categorizeObjectEffect(type);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}
	
	private function onRemovedFromStage(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		this.dispatchEvent(new Event(Collectable.DESTROYED, true));
	}
	
	function get_isHealthy():Effect {
		return isHealthy;
	}
	
	function set_isHealthy(value:Effect):Effect {
		return isHealthy = value;
	}
	
	
	public static override function create(info:CollectableInfoVO):Collectable {
		var obj:Collectable = new Collectable(info.pathToSource);
		obj.isHealthy = info.isHealthy;
		
		return obj;
	}
	
	
}