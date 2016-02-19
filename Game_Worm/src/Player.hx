package;

import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Lib;
import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spritesheet.Spritesheet;
import openfl.events.Event;
/**
 * ...
 * @author Desislava Dimcheva
 */
class Player extends Sprite
{
	
	
	static public inline var SPRITE_COLUMNS:Int = 4;
	static public inline var SPRITE_ROWS:Int = 3;
	static public inline var IMAGE_WIDTH:Int = 162;
	static public inline var IMAGE_HEIGHT:Int = 53;
	static public inline var ANIMATIONS_FRAME_RATE:Int = 15;

	var animated:AnimatedSprite;
	var lastTime:Int = 0;
	public var walking:Bool = false;
	
	public function new() {
		super();
		var bitmap:BitmapData = openfl.Assets.getBitmapData("img/player/WormAnim.png");
		
		var spritesheet:Spritesheet = BitmapImporter.create(bitmap, SPRITE_COLUMNS, SPRITE_ROWS, IMAGE_WIDTH, IMAGE_HEIGHT);
		spritesheet.addBehavior(new BehaviorData("walk-normal", [8, 9, 10, 11, 10, 9,8], true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH/2, IMAGE_HEIGHT/2));
		spritesheet.addBehavior(new BehaviorData("stand-normal", [8],  true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH / 2, IMAGE_HEIGHT / 2));
		
		spritesheet.addBehavior(new BehaviorData("walk-skinny", [4, 5, 6, 7, 6, 5, 4], true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH/2, IMAGE_HEIGHT/2));
		spritesheet.addBehavior(new BehaviorData("stand-skinny", [4],  true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH / 2, IMAGE_HEIGHT / 2));
		
		spritesheet.addBehavior(new BehaviorData("walk-fat", [0, 1, 2, 3, 2, 1, 0], true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH/2, IMAGE_HEIGHT/2));
		spritesheet.addBehavior(new BehaviorData("stand-fat", [0],  true, ANIMATIONS_FRAME_RATE, IMAGE_WIDTH/2, IMAGE_HEIGHT/2));
		
		spritesheet.behaviors.get("stand-normal").loop = true;
		
		
		animated = new AnimatedSprite(spritesheet, true);
		animated.showBehavior("stand-normal");
		addChild(animated);
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
	}
	
	public function onEnterFrame(e:Event):Void{
		var delta = Lib.getTimer()- lastTime;
		animated.update(delta);
		lastTime = Lib.getTimer();
	}

	public function walk():Void {
		if (walking) {
			return;
		}
		animated.showBehavior("walk-normal");
		walking = true;
	}

	public function stand():Void {
		if (!walking) {
			return;
		}
		animated.showBehavior("stand-normal");
		walking = false;
	}
	
	
}