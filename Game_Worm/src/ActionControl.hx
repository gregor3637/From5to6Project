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
	
	@:isVar public var hero(get, null):Player;
	
	
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
		
		addHero();
	}
	
	public function update(ev:Event = null):Void {
		checkCollision();
		checkElementsOutOfStage();
		makeObjectsFallDown();
	}
	
	
	public function addHero(/*obj:VisibleStaticObject*/):Void {
		hero = new Player();
		this.addChild(hero);
		hero.x = playfieldWidth * 0.5 - hero.width * 0.5;
		hero.y = playfieldHeight - hero.height;
	}
	
	public function moveHero(ev:MoveCommandEvent):Void {
		if (ev.movementType != Direction.STAND && ev.movementType != Direction.MISSING) {
			var deltaX:Int = ev.movementType == Direction.LEFT? -5 : 5;
			hero.walk();
			hero.scaleX = deltaX > 0? 1: -1;
			
			if ( (hero.x + deltaX - hero.width * 0.5 < 0) || (hero.x + deltaX + hero.width * 0.5 > playfieldWidth) ) {
				return;
			}
			
			hero.x += deltaX;
			
			trace("move");
		} 
		else if(ev.movementType == Direction.STAND) {
			hero.stand();
			trace("stand");
			
		}
		
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
	
	function get_hero():Player { return hero; }
	
}