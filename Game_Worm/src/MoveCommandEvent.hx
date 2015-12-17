package;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class MoveCommandEvent extends Event{
	public static inline var CHANGED:String = "changed";
	//public static inline var RIGHT:String = "right";
	//public static inline var DOWN:String = "down";
	//public static inline var UP:String = "up";
	//public static inline var MISSING:String = "missing";

    public var movementType:Direction;
    public function new(type:String, moveType:Direction, bubbles:Bool=false, cancelable:Bool=false) 
    {
        super(type, bubbles, cancelable);       
        movementType = moveType;
    }
	
}