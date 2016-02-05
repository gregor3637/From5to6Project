package;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Point;

/**
 * ...
 * @author Mihail Mitov
 */
class ActionControl extends Sprite {
	private var FALL_DOWN_SPEED:Int = 3;
	
	private var hero:VisibleStaticObject;
	
	
	private var playfieldWidth:Int;
	private var playfieldHeight:Int;
	
	private var fallingObjects:Array<Collectable>;
	
	private var oldElementPosition:Int;
	private var oldElementWidth:Int;
	
	
	
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(ev:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		playfieldWidth = this.parent.stage.stageWidth;
		playfieldHeight = this.parent.stage.stageHeight;
		
		fallingObjects = new Array<Collectable>();
	}
	
	public function update(ev:Event = null):Void {
		checkCollision();
		checkElementsOutOfStage();
		makeObjectsFallDown();
	}
	
	
	public function addHero(obj:VisibleStaticObject):Void {
		hero = obj;
		this.addChild(hero);
		hero.x = playfieldWidth * 0.5 - hero.width * 0.5;
		hero.y = playfieldHeight - hero.height;
	}
	
	public function moveHero(ev:MoveCommandEvent):Void {
		var diversion:Point =  new Point();
		
		switch(ev.movementType) {
			case Direction.LEFT: diversion.x -= 5;
			case Direction.RIGHT: diversion.x += 5;
			case Direction.DOWN: diversion.y += 0;
			case Direction.UP: diversion.y -= 0;
			case Direction.MISSING: trace("You cant move with that key");
		}
		
		setNewHeroPosition(diversion);
	}
	
	private function setNewHeroPosition(diversion:Point) {
		//if (hero.x + diversion.x < 0) { //left edge
			//return;
		//}
		//if (hero.x + hero.width + diversion.x > playfieldWidth) { //right edge
			//return;
		//}
		//
		//hero.x += diversion.x;
		//hero.y += diversion.y;
	}
	
	
	private function checkCollision():Void {
		for (a in  0...fallingObjects.length) {
			var element:Collectable  = fallingObjects[a];
			//if (hero.hitTestObject(element)) {
				//trace("HIT HIT HIT ");
				//
				//disposeElement(element);
			//}
		}
	}
	
	private function checkElementsOutOfStage():Void {
		for (a in 0...fallingObjects.length) {
			var element:Collectable = fallingObjects[a];
			if (element.y > (playfieldHeight - element.height)) {
				disposeElement(element);
				break;
			}
		}
	}
	
	private function makeObjectsFallDown():Void {
		for (a in 0...fallingObjects.length) {
			fallingObjects[a].y += FALL_DOWN_SPEED;
		}
	}
	
	public function createElement(ev:ElementLifeCycleEvent):Void {
		var collectable:Collectable = Collectable.create(ev.dna);
		addNewCollectable(collectable);
	}
	
	public function addNewCollectable(element:Collectable):Void {
		fallingObjects.push(element);
		element.x = nextPosition(Math.floor(element.width));
		this.addChild(element);
	}
	
	
	private function nextPosition(elementWidth:Int):Int {
		var currentPosition:Int;
		do {
			currentPosition = MathUtils.randomIntegerWithinRange(elementWidth, playfieldWidth - elementWidth);
		} while ( !acceptablePosition(currentPosition, elementWidth) );
		
		return currentPosition;
	}
	
	private function acceptablePosition(newElementPosition:Int, newElementWidth:Int):Bool { //0, 50
		var isSuitable:Bool = false;
		
		if (newElementPosition < oldElementPosition) {//left
			if (newElementPosition  < oldElementPosition - newElementWidth ) {
				isSuitable = true;
			}
		}
		else if (newElementPosition > oldElementPosition) { // right
			if (newElementPosition > oldElementPosition + oldElementWidth) {
				isSuitable = true;
			}
		}
		
		if (isSuitable) { 
			oldElementWidth = newElementWidth;
			oldElementPosition = newElementPosition;
		}
		
		return isSuitable;
	}
	
	private function disposeElement(element:Collectable):Void {
		dispatchEvent(new ElementLifeCycleEvent(ElementLifeCycleEvent.DIED, element.dna));
		var indexInArr:Int = fallingObjects.indexOf(element);
		fallingObjects.splice(indexInArr, 1);
		this.removeChild(element);
		element = null;
	}
	
}