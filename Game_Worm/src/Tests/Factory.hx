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
		collectable.isHealthy = information.isHealthy;
		
		return collectable;
	}
	
	
}