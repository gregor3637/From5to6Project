package;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class Collectable extends VisibleStaticObject{
	static public inline var DESTROYED:String = "destroyed";
	@:isVar public var dna(get, set):CollectableDNAVO;

	
	public function new(path:String) {
		super(path);
		
		//dna = categorizeObjectEffect(type);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}
	
	private function onRemovedFromStage(ev:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		this.dispatchEvent(new Event(Collectable.DESTROYED, true));
	}
	
	function get_dna():CollectableDNAVO {
		return dna;
	}
	
	function set_dna(value:CollectableDNAVO):CollectableDNAVO {
		return dna = value;
	}
	
	
	public static override function create(info:CollectableDNAVO):Collectable {
		var obj:Collectable = new Collectable(info.pathToSource);
		obj.dna = info;
		
		return obj;
	}
	
	
}