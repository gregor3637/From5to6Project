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
	
	private var typeControl:CollectableTypeControl;
	private var flowControl:FlowControl;
	
	//private var heroOld:VisibleStaticObject;
	private var playerToGameCommunication:CommunicationControl;
	
	private var indicators:Indicators;
	private var lastTime:Int = 0;
	private var animated:AnimatedSprite;

	@:isVar public var hero(get, null):Player;
	
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
		playerToGameCommunication.addEventListener(CommunicationControl.KEY_UP, onKeyUp);
		playerToGameCommunication.addEventListener(CommunicationControl.KEY_LEFT, onKeyLeft);
		playerToGameCommunication.addEventListener(CommunicationControl.KEY_RIGHT, onKeyRight);
		
		//heroOld = new VisibleStaticObject("img/player/hero.png");
		
		var background:VisibleStaticObject = new VisibleStaticObject("img/background/level1/background-1.jpg");
		addChild(background);
		
		indicators = new Indicators();
		addChild(indicators);
		indicators.x = stage.stageWidth - indicators.width * 1.2;
		indicators.y = 100;//0 + indicators.height * 1.2;
		//indicators.health.reset();
		//indicators.health.update(2);

		typeControl = new CollectableTypeControl();
		flowControl = new FlowControl();
		this.addChild(flowControl);
		
		flowControl.addEventListener(FlowControl.ELEMENT_REQUEST_CONFIRMED, manufactureElement);
		addEventListener(Event.ENTER_FRAME, onFrame);

		startGame();
	}
	
	private function onKeyRight(e:Event):Void {
		if (!hero.walking) {
			hero.scaleX = 1;
			hero.walk();
		}
	}
	
	private function onKeyLeft(e:Event):Void {
		
		if (!hero.walking) {
			hero.scaleX = -1;
			hero.walk();
		}
	}
	
	private function onKeyUp(e:Event):Void {
		hero.stand();
	}
	
	private function onMoveChange(ev:MoveCommandEvent):Void {
		//indicators.health.canOverlap = true;
		//indicators.health.updateWithValue(140);
		//indicators.health.updateWithPercentOfCurrent(300);//24
		//indicators.health.updateWithPercentOfTotal(300);
		indicators.mana.canOverlap = true;
		indicators.mana.updateWithValue(140);//24
		flowControl.moveHero(ev.movementType);
	}
	
	private function startGame() {
		hero = new Player();
		flowControl.addHero(hero);
		manufactureElement();
	}
	
	private function manufactureElement(ev:Event = null):Void {
		var info:CollectableInfoVO = typeControl.getType();
		var newElement:Collectable = Collectable.create(info);
		flowControl.addNewElements(newElement);
		//flowControl.addNewElements(factory.createCollectable(typeControl.mostAppropriateChoice()));
	}
	
	private function onFrame(e:Event):Void {
		flowControl.update();
	}
	
	
	function get_hero():Player { return hero; }
	
}
