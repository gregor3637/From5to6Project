package;

@:enum
abstract Direction(String) {
	var LEFT   = "left";
	var RIGHT  = "right";
	var DOWN  = "down";
	var UP  = "up";
	var MISSING  = "the move is missing";
}