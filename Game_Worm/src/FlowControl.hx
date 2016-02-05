package;
import CollectableDNAControl;
import haxe.io.Error;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.geom.Point;

/**
 * ...
 * @author Mihail Mitov
 */
class FlowControl extends Sprite {
	static public inline var ELEMENT_CREATION_CONFIRMED:String = "elementCreationConfirmed";
	private var TICKS_FOR_NEW_ELEMENT:Int = 50; //type needs to be const, but how to do it in Haxe
	private var MAX_ELEMENTS_ON_STAGE:Int = 5;  //type needs to be const, but how to do it in Haxe
	private var ticks:Int;
	
	private var gameEnded:Bool = false;
	private var dnaControl:CollectableDNAControl;
	
	private var currentlyOperatingElements:Int = 0;
	
	public function new() {
		super();
		dnaControl = new CollectableDNAControl();
	}
	
	
	public function update(ev:Event):Void {
		++ticks;
		if (ticks % TICKS_FOR_NEW_ELEMENT == 0) {
			requestNewCollectable();
		}
	}
	
	
	public function requestNewCollectable() {
		var maxElementsReached:Bool = currentlyOperatingElements >= MAX_ELEMENTS_ON_STAGE;
		
		if (!maxElementsReached && !gameEnded) {
			++currentlyOperatingElements;
			var elementDNA:CollectableDNAVO = dnaControl.getType();
			dispatchEvent(new ElementLifeCycleEvent(ElementLifeCycleEvent.BORN, elementDNA));
		}
	}
	
	public function elementDestroyed(ev:ElementLifeCycleEvent):Void {
		if (currentlyOperatingElements - 1 < 0 ) {
			throw("This can`t happen .... with this element you just destroyed more elements then you have created.");
		}
		--currentlyOperatingElements;
		dnaControl.reducePopulationType(ev.dna);
		
		requestNewCollectable();
	}
	
}