package;
import openfl.events.Event;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class Collectable extends VisibleStaticObject{
	static public inline var DESTROYED:String = "destroyed";
	@:isVar public var healthEffect(get, set):Effect;

	
	public function new(path:String) {
		super(path);
		
		//healthEffect = categorizeObjectEffect(type);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}
	
	private function onRemovedFromStage(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		this.dispatchEvent(new Event(Collectable.DESTROYED, true));
	}
	
	function get_healthEffect():Effect {
		return healthEffect;
	}
	
	function set_healthEffect(value:Effect):Effect {
		return healthEffect = value;
	}
	
	
	public static override function create(info:CollectableInfoVO):Collectable {
		var obj:Collectable = new Collectable(info.pathToSource);
		obj.healthEffect = info.healthEffect;
		
		return obj;
	}
	
	
}