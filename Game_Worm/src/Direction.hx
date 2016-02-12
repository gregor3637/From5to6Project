package;

@:enum
abstract Direction(String) {
	var LEFT   = "left";
	var RIGHT  = "right";
	var DOWN  = "down";
	var UP  = "up";
	var STAND = "stand"; //better name might be halt?
	var MISSING  = "the move is missing";
}