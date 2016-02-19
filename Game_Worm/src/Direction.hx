package;

@:enum
abstract Direction(String) {
	var LEFT   = "left";
	var RIGHT  = "right";
	var STAND = "stand"; //better name might be halt?
	var MISSING  = "the move is missing";
}