package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Mihail Mitov
 */
class VisibleStaticObject extends Sprite {
	private var imageData:BitmapData;
	private var image:Bitmap;
	private var path:String;
	
	public function new(pathToSource:String) {
		super();
		path = pathToSource;
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		imageData = Assets.getBitmapData(path);
		image = new Bitmap(imageData);
		//trace("imageData = " + imageData.width);
		this.addChild(image);
	}
	
}