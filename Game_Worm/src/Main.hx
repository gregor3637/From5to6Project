package;

import haxe.EnumTools.EnumValueTools;
import openfl.Assets;
import openfl.display.Graphics;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Mihail Mitov
 */

class Main extends Sprite {
	
	private var fallingObject:Collectable;
	private var frameCounter:Int = 0;
	
	private var typeControl:CollectableTypeControl;
	private var flowControl:FlowControl;
	
	private var hero:VisibleStaticObject;
	private var playerToGameCommunication:CommunicationControl;
	
	private var indicators:Indicators;
		
	public function new() {
		super();
		trace("Main | started");
		//typeControl = new CollectableTypeControl();
		init();
		
		
		
		//var testArray:Array<Bool> = new Array<Bool>[true, false, false, true];
		
		var areTrue:Int = Validation.conditionFrequency(true, [true, false, true, false, true]);
		
		trace(" areTrue = " + areTrue);
		
	}

	
	private function init() {
		playerToGameCommunication = new CommunicationControl(); 
		addChild(playerToGameCommunication);
		playerToGameCommunication.addEventListener(MoveCommandEvent.CHANGED, onMoveChange);
		
		hero = new VisibleStaticObject("img/player/hero.png");
		
		var background:VisibleStaticObject = new VisibleStaticObject("img/background/level1/Background_960x480.png");
		addChild(background);
		
		
		
		indicators = new Indicators();
		addChild(indicators);
		indicators.x = stage.stageWidth - indicators.width * 1.2;
		indicators.y = 0 + indicators.height * 1.2;
		indicators.health.reset();
		//indicators.health.update(2);
		
		
		
		typeControl = new CollectableTypeControl();
		flowControl = new FlowControl();
		this.addChild(flowControl);
		
		flowControl.addEventListener(FlowControl.ELEMENT_DESTROYED, requestNewItem);
		addEventListener(Event.ENTER_FRAME, onFrame);
		
		startGame();
	}
	
	private function onMoveChange(ev:MoveCommandEvent):Void {
		indicators.health.update(2);
		flowControl.moveHero(ev.movementType);
	}
	
	private function startGame() {
		flowControl.addHero(hero);
		requestNewItem();
	}
	
	private function requestNewItem(e:Event = null):Void {
		var info:CollectableInfoVO = typeControl.getType();
		var newElement:Collectable = Collectable.create(info);
		flowControl.addNewElements(newElement);
		//flowControl.addNewElements(factory.createCollectable(typeControl.mostAppropriateChoice()));
	}
	
	private function onFrame(e:Event):Void {
		flowControl.update();
	}
	
}
