package;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class CollectableDNAVO {
	@:isVar public var healthEffect(get, set):Effect;
	@:isVar public var pathToSource(get, set):String;
	
	public function new(effect:Effect, sourcePath:String) {
		healthEffect = effect;
		pathToSource = sourcePath;
	}
	
	function get_healthEffect():Effect {
		return healthEffect;
	}
	
	function set_healthEffect(value:Effect):Effect {
		return healthEffect = value;
	}
	
	
	function get_pathToSource():String {
		return pathToSource;
	}
	
	function set_pathToSource(value:String):String {
		return pathToSource = value;
	}
	
	
}