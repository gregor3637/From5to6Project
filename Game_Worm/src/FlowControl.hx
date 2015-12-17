package;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author Mihail Mitov
 */
class FlowControl extends Sprite {
	static public inline var ELEMENT_DESTROYED:String = "objectDestroyed";
	private var TICKS_FOR_NEW_ELEMENT:Int = 50;
	private var ticks:Int;
	private var fallingObjects:Array<Collectable>;
	
	private var playfieldWidth:Int;
	private var playfieldHeight:Int;
	
	private var oldElementPosition:Int;
	private var oldElementWidth:Int;
	
	private var hero:VisibleStaticObject;
	
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		playfieldWidth = this.parent.stage.stageWidth;
		playfieldHeight = this.parent.stage.stageHeight;
		
		fallingObjects = new Array<Collectable>();
	}
	
	public function addHero(obj:VisibleStaticObject):Void {
		hero = obj;
		this.addChild(hero);
		hero.x = playfieldWidth * 0.5 - hero.width * 0.5;
		hero.y = playfieldHeight -hero.height;
	}
	
	public function moveHero(direction:Direction):Void {
		switch(direction) {
			case Direction.LEFT: hero.x -= 5;
			case Direction.RIGHT: hero.x += 5;
			case Direction.DOWN: hero.y += 5;
			case Direction.UP: hero.y -= 5;
			case Direction.MISSING: trace("You cant move with that key");
		}
	}
	
	public function addNewElements(element:Collectable):Void {
		fallingObjects.push(element);
		element.x = nextPosition(Math.floor(element.width));
		this.addChild(element);
	}
	
	private function nextPosition(elementWidth:Int):Int {
		var position:Int;
		do {
			position = MathUtils.randomIntegerWithinRange(elementWidth, playfieldWidth-elementWidth);
		} while ( !acceptablePosition(position, elementWidth) );
		
		return position;
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
	
	public function update():Void {
		++ticks;
		if (ticks % TICKS_FOR_NEW_ELEMENT == 0) {
			dispatchEvent(new Event(ELEMENT_DESTROYED));
		}
		checkCollision();
		checkIfElementOutOfRange();
		makeObjectsFallDown();
	}
	
	private function checkCollision():Void {
		for (a in  0...fallingObjects.length) {
			var element:Collectable  = fallingObjects[a];
			if (hero.hitTestObject(element)) {
				trace("HIT HIT HIT ");
				
				disposeElement(element);
			}
		}
	}
	
	private function disposeElement(element:Collectable):Void {
		var indexInArr:Int = fallingObjects.indexOf(element);
		fallingObjects.splice(indexInArr, 1);
		this.removeChild(element);
		element = null;
		
		dispatchEvent(new Event(ELEMENT_DESTROYED));
	}
	
	private function checkIfElementOutOfRange():Void {
		for (a in 0...fallingObjects.length) {
			var element:Collectable = fallingObjects[a];
			if (element.y > (playfieldHeight - element.height)) {
				//trace("removed");
				disposeElement(element);
			}
		}
	}
	
	private function makeObjectsFallDown():Void {
		for (a in 0...fallingObjects.length) {
			fallingObjects[a].y += 2;
		}
	}
	
}