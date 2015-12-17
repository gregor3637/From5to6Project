package;
import Effect;

/**
 * ...
 * @author Mihail Mitov
 */
class CollectableInfoVO {
	@:isVar public var isHealthy(get, set):Effect;
	@:isVar public var pathToSource(get, set):String;
	
	public function new(effect:Effect, sourcePath:String) {
		isHealthy = effect;
		pathToSource = sourcePath;
	}
	
	function get_isHealthy():Effect {
		return isHealthy;
	}
	
	function set_isHealthy(value:Effect):Effect {
		return isHealthy = value;
	}
	
	
	function get_pathToSource():String {
		return pathToSource;
	}
	
	function set_pathToSource(value:String):String {
		return pathToSource = value;
	}
	
	
}