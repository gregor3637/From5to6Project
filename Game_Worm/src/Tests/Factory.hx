package Tests;

/**
 * ...
 * @author Mihail Mitov
 */
class Factory{

	public function new() {
		
	}
	
	public function createCollectable(information:CollectableInfoVO):Collectable {
		var collectable:Collectable = new Collectable(information.pathToSource);
		collectable.healthEffect = information.healthEffect;
		
		return collectable;
	}
	
	
}