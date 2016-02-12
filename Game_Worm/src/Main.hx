package;

import haxe.EnumTools.EnumValueTools;
import openfl.Assets;
import openfl.display.Graphics;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.ui.Keyboard;

import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spritesheet.Spritesheet;

/**
 * ...
 * @author Mihail Mitov
 */

class Main extends Sprite {
	
	private var fallingObject:Collectable;
	
	private var flowControl:FlowControl;
	private var actionControl:ActionControl;//eventControl - collisionDetection, falling down, moving the worm
	
	private var playerToGameCommunication:CommunicationControl;
	private var indicators:Indicators;

	public function new() {
		super();
		trace("Main | started");
		init();
		var areTrue:Int = Validation.conditionFrequency(true, [true, false, true, false, true]);
	}

	
	private function init() {
		var background:VisibleStaticObject = new VisibleStaticObject("img/background/level1/background-1.jpg");
		addChild(background);
		
		flowControl = new FlowControl();
		actionControl = new ActionControl();
		this.addChild(actionControl);
		
		playerToGameCommunication = new CommunicationControl(); 
		addChild(playerToGameCommunication);
		
		indicators = new Indicators();
		this.addChild(indicators);
		indicators.x = 300;
		indicators.y = 100;
		
		
		playerToGameCommunication.addEventListener(MoveCommandEvent.CHANGED, indicators.updateMana);
		playerToGameCommunication.addEventListener(MoveCommandEvent.CHANGED, actionControl.moveHero);
		flowControl.addEventListener(ElementLifeCycleEvent.BORN, actionControl.createElement);
		actionControl.addEventListener(ElementLifeCycleEvent.DIED, flowControl.elementDestroyed);
		
		startGame();
	}
	
	private function startGame() {
		flowControl.requestNewCollectable();
		//flowControl.requestHero(); 
	}
	
	
	private function onTick(ev:Event):Void {
		flowControl.update(ev);
		actionControl.update(ev);
	}
	
	
}
