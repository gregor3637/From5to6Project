package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Mihail Mitov
 */
class CommunicationControl extends Sprite {
	
	static public inline var KEY_UP:String = "keyUp";
	static public inline var KEY_LEFT:String = "keyLeft";
	static public inline var KEY_RIGHT:String = "keyRight";
	private var flowControl:FlowControl;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		this.parent.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		this.parent.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		
		
	}
	
	private function keyUp(e:KeyboardEvent):Void {
		var traceVar:Int = 5;
		dispatchEvent(new MoveCommandEvent(MoveCommandEvent.CHANGED, Direction.STAND));
	}
		
	private function keyDown(ev:KeyboardEvent):Void {
		//trace("some key is pressed down");
		//var keyPresssed:Int = ev.keyCode;
		var move:Direction;
		switch(ev.keyCode) {
			case 37: move = Direction.LEFT; 
			case 39: move = Direction.RIGHT;
			case 38: move = Direction.UP;
			case 40: move = Direction.DOWN;
			
			default: move = Direction.MISSING;
			trace("No move corresponds to button: " + String.fromCharCode(ev.keyCode) + " | ev.keyCode = " + ev.keyCode );
		}
		
		dispatchEvent(new MoveCommandEvent(MoveCommandEvent.CHANGED, move));
	}
	
}