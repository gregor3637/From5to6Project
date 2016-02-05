package;

import CommunicationControl;
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
	private var background:VisibleStaticObject;
	
	private var playerToGameCommunication:CommunicationControl;
	//private var typeControl:CollectableTypeControl;
	private var flowControl:FlowControl;
	private var actionControl:ActionControl;//eventControl - collisionDetection, falling down, moving the worm
	
	private var hero:VisibleStaticObject;
	
	private var indicators:Indicators;
		
	public function new() {
		super();
		trace("Main | started");
		init();
		//var areTrue:Int = Validation.conditionFrequency(true, [true, false, true, false, true]);
	}

	
	private function init() {
		background = new VisibleStaticObject("img/background/level1/Background_960x480.png");
		this.addChild(background);
		
		hero = new VisibleStaticObject("img/player/hero.png");
		
		flowControl = new FlowControl();
		actionControl = new ActionControl();
		this.addChild(actionControl);
		
		playerToGameCommunication = new CommunicationControl(); 
		this.addChild(playerToGameCommunication);
		
		indicators = new Indicators();
		this.addChild(indicators);
		indicators.x = 300;
		indicators.y = 100;
		
		playerToGameCommunication.addEventListener(MoveCommandEvent.CHANGED, indicators.updateMana);
		playerToGameCommunication.addEventListener(MoveCommandEvent.CHANGED, actionControl.moveHero);
		flowControl.addEventListener(ElementLifeCycleEvent.BORN, actionControl.createElement);
		actionControl.addEventListener(ElementLifeCycleEvent.DIED, flowControl.elementDestroyed);
		addEventListener(Event.ENTER_FRAME, onTick);
		
		startGame();
	}
	
	private function onTick(ev:Event):Void {
		flowControl.update(ev);
		actionControl.update(ev);
	}
	
	private function startGame() {
		flowControl.requestNewCollectable();
	}
	
	
	
}
