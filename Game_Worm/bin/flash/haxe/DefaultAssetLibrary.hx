package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("img/32.png", __ASSET__img_32_png);
		type.set ("img/32.png", AssetType.IMAGE);
		className.set ("img/background/level1/background-1.jpg", __ASSET__img_background_level1_background_1_jpg);
		type.set ("img/background/level1/background-1.jpg", AssetType.IMAGE);
		className.set ("img/background/level1/background-2.jpg", __ASSET__img_background_level1_background_2_jpg);
		type.set ("img/background/level1/background-2.jpg", AssetType.IMAGE);
		className.set ("img/background/level1/background-3.jpg", __ASSET__img_background_level1_background_3_jpg);
		type.set ("img/background/level1/background-3.jpg", AssetType.IMAGE);
		className.set ("img/Collectables/apple.png", __ASSET__img_collectables_apple_png);
		type.set ("img/Collectables/apple.png", AssetType.IMAGE);
		className.set ("img/Collectables/avocado.png", __ASSET__img_collectables_avocado_png);
		type.set ("img/Collectables/avocado.png", AssetType.IMAGE);
		className.set ("img/Collectables/badBasket.png", __ASSET__img_collectables_badbasket_png);
		type.set ("img/Collectables/badBasket.png", AssetType.IMAGE);
		className.set ("img/Collectables/burger.png", __ASSET__img_collectables_burger_png);
		type.set ("img/Collectables/burger.png", AssetType.IMAGE);
		className.set ("img/Collectables/carrot.png", __ASSET__img_collectables_carrot_png);
		type.set ("img/Collectables/carrot.png", AssetType.IMAGE);
		className.set ("img/Collectables/donut.png", __ASSET__img_collectables_donut_png);
		type.set ("img/Collectables/donut.png", AssetType.IMAGE);
		className.set ("img/Collectables/frenchFries.png", __ASSET__img_collectables_frenchfries_png);
		type.set ("img/Collectables/frenchFries.png", AssetType.IMAGE);
		className.set ("img/Collectables/goodBasket.png", __ASSET__img_collectables_goodbasket_png);
		type.set ("img/Collectables/goodBasket.png", AssetType.IMAGE);
		className.set ("img/Collectables/lettuce.png", __ASSET__img_collectables_lettuce_png);
		type.set ("img/Collectables/lettuce.png", AssetType.IMAGE);
		className.set ("img/Collectables/pizza.png", __ASSET__img_collectables_pizza_png);
		type.set ("img/Collectables/pizza.png", AssetType.IMAGE);
		className.set ("img/Collectables/sausage.png", __ASSET__img_collectables_sausage_png);
		type.set ("img/Collectables/sausage.png", AssetType.IMAGE);
		className.set ("img/Collectables/watermelon.png", __ASSET__img_collectables_watermelon_png);
		type.set ("img/Collectables/watermelon.png", AssetType.IMAGE);
		className.set ("img/kit_from_firefox.png", __ASSET__img_kit_from_firefox_png);
		type.set ("img/kit_from_firefox.png", AssetType.IMAGE);
		className.set ("img/objects/apple.png", __ASSET__img_objects_apple_png);
		type.set ("img/objects/apple.png", AssetType.IMAGE);
		className.set ("img/objects/avocado.png", __ASSET__img_objects_avocado_png);
		type.set ("img/objects/avocado.png", AssetType.IMAGE);
		className.set ("img/objects/badBasket.png", __ASSET__img_objects_badbasket_png);
		type.set ("img/objects/badBasket.png", AssetType.IMAGE);
		className.set ("img/objects/burger.png", __ASSET__img_objects_burger_png);
		type.set ("img/objects/burger.png", AssetType.IMAGE);
		className.set ("img/objects/carrot.png", __ASSET__img_objects_carrot_png);
		type.set ("img/objects/carrot.png", AssetType.IMAGE);
		className.set ("img/objects/donut.png", __ASSET__img_objects_donut_png);
		type.set ("img/objects/donut.png", AssetType.IMAGE);
		className.set ("img/objects/frenchFries.png", __ASSET__img_objects_frenchfries_png);
		type.set ("img/objects/frenchFries.png", AssetType.IMAGE);
		className.set ("img/objects/goodBasket.png", __ASSET__img_objects_goodbasket_png);
		type.set ("img/objects/goodBasket.png", AssetType.IMAGE);
		className.set ("img/objects/lettuce.png", __ASSET__img_objects_lettuce_png);
		type.set ("img/objects/lettuce.png", AssetType.IMAGE);
		className.set ("img/objects/pizza.png", __ASSET__img_objects_pizza_png);
		type.set ("img/objects/pizza.png", AssetType.IMAGE);
		className.set ("img/objects/sausage.png", __ASSET__img_objects_sausage_png);
		type.set ("img/objects/sausage.png", AssetType.IMAGE);
		className.set ("img/objects/watermelon.png", __ASSET__img_objects_watermelon_png);
		type.set ("img/objects/watermelon.png", AssetType.IMAGE);
		className.set ("img/player/character.png", __ASSET__img_player_character_png);
		type.set ("img/player/character.png", AssetType.IMAGE);
		className.set ("img/player/firefox.png", __ASSET__img_player_firefox_png);
		type.set ("img/player/firefox.png", AssetType.IMAGE);
		className.set ("img/player/hero.png", __ASSET__img_player_hero_png);
		type.set ("img/player/hero.png", AssetType.IMAGE);
		className.set ("img/player/set.png", __ASSET__img_player_set_png);
		type.set ("img/player/set.png", AssetType.IMAGE);
		className.set ("img/player/wormanim.json", __ASSET__img_player_wormanim_json);
		type.set ("img/player/wormanim.json", AssetType.TEXT);
		className.set ("img/player/WormAnim.png", __ASSET__img_player_wormanim_png);
		type.set ("img/player/WormAnim.png", AssetType.IMAGE);
		className.set ("img/ProgressBar/Background.png", __ASSET__img_progressbar_background_png);
		type.set ("img/ProgressBar/Background.png", AssetType.IMAGE);
		className.set ("img/ProgressBar/HealthProgress.png", __ASSET__img_progressbar_healthprogress_png);
		type.set ("img/ProgressBar/HealthProgress.png", AssetType.IMAGE);
		className.set ("img/set.png", __ASSET__img_set_png);
		type.set ("img/set.png", AssetType.IMAGE);
		className.set ("img/SpriteSheetData.png", __ASSET__img_spritesheetdata_png);
		type.set ("img/SpriteSheetData.png", AssetType.IMAGE);
		className.set ("img/SpriteSheetData.xml", __ASSET__img_spritesheetdata_xml);
		type.set ("img/SpriteSheetData.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "img/32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/background/level1/background-1.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/background/level1/background-2.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/background/level1/background-3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/apple.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/avocado.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/badBasket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/burger.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/carrot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/donut.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/frenchFries.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/goodBasket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/lettuce.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/pizza.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/sausage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Collectables/watermelon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/kit_from_firefox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/apple.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/avocado.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/badBasket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/burger.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/carrot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/donut.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/frenchFries.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/goodBasket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/lettuce.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/pizza.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/sausage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/objects/watermelon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/character.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/firefox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/hero.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/set.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/wormanim.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "img/player/WormAnim.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ProgressBar/Background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ProgressBar/HealthProgress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/set.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/SpriteSheetData.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/SpriteSheetData.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/32.png", __ASSET__img_32_png);
		type.set ("img/32.png", AssetType.IMAGE);
		
		className.set ("img/background/level1/background-1.jpg", __ASSET__img_background_level1_background_1_jpg);
		type.set ("img/background/level1/background-1.jpg", AssetType.IMAGE);
		
		className.set ("img/background/level1/background-2.jpg", __ASSET__img_background_level1_background_2_jpg);
		type.set ("img/background/level1/background-2.jpg", AssetType.IMAGE);
		
		className.set ("img/background/level1/background-3.jpg", __ASSET__img_background_level1_background_3_jpg);
		type.set ("img/background/level1/background-3.jpg", AssetType.IMAGE);
		
		className.set ("img/Collectables/apple.png", __ASSET__img_collectables_apple_png);
		type.set ("img/Collectables/apple.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/avocado.png", __ASSET__img_collectables_avocado_png);
		type.set ("img/Collectables/avocado.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/badBasket.png", __ASSET__img_collectables_badbasket_png);
		type.set ("img/Collectables/badBasket.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/burger.png", __ASSET__img_collectables_burger_png);
		type.set ("img/Collectables/burger.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/carrot.png", __ASSET__img_collectables_carrot_png);
		type.set ("img/Collectables/carrot.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/donut.png", __ASSET__img_collectables_donut_png);
		type.set ("img/Collectables/donut.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/frenchFries.png", __ASSET__img_collectables_frenchfries_png);
		type.set ("img/Collectables/frenchFries.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/goodBasket.png", __ASSET__img_collectables_goodbasket_png);
		type.set ("img/Collectables/goodBasket.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/lettuce.png", __ASSET__img_collectables_lettuce_png);
		type.set ("img/Collectables/lettuce.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/pizza.png", __ASSET__img_collectables_pizza_png);
		type.set ("img/Collectables/pizza.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/sausage.png", __ASSET__img_collectables_sausage_png);
		type.set ("img/Collectables/sausage.png", AssetType.IMAGE);
		
		className.set ("img/Collectables/watermelon.png", __ASSET__img_collectables_watermelon_png);
		type.set ("img/Collectables/watermelon.png", AssetType.IMAGE);
		
		className.set ("img/kit_from_firefox.png", __ASSET__img_kit_from_firefox_png);
		type.set ("img/kit_from_firefox.png", AssetType.IMAGE);
		
		className.set ("img/objects/apple.png", __ASSET__img_objects_apple_png);
		type.set ("img/objects/apple.png", AssetType.IMAGE);
		
		className.set ("img/objects/avocado.png", __ASSET__img_objects_avocado_png);
		type.set ("img/objects/avocado.png", AssetType.IMAGE);
		
		className.set ("img/objects/badBasket.png", __ASSET__img_objects_badbasket_png);
		type.set ("img/objects/badBasket.png", AssetType.IMAGE);
		
		className.set ("img/objects/burger.png", __ASSET__img_objects_burger_png);
		type.set ("img/objects/burger.png", AssetType.IMAGE);
		
		className.set ("img/objects/carrot.png", __ASSET__img_objects_carrot_png);
		type.set ("img/objects/carrot.png", AssetType.IMAGE);
		
		className.set ("img/objects/donut.png", __ASSET__img_objects_donut_png);
		type.set ("img/objects/donut.png", AssetType.IMAGE);
		
		className.set ("img/objects/frenchFries.png", __ASSET__img_objects_frenchfries_png);
		type.set ("img/objects/frenchFries.png", AssetType.IMAGE);
		
		className.set ("img/objects/goodBasket.png", __ASSET__img_objects_goodbasket_png);
		type.set ("img/objects/goodBasket.png", AssetType.IMAGE);
		
		className.set ("img/objects/lettuce.png", __ASSET__img_objects_lettuce_png);
		type.set ("img/objects/lettuce.png", AssetType.IMAGE);
		
		className.set ("img/objects/pizza.png", __ASSET__img_objects_pizza_png);
		type.set ("img/objects/pizza.png", AssetType.IMAGE);
		
		className.set ("img/objects/sausage.png", __ASSET__img_objects_sausage_png);
		type.set ("img/objects/sausage.png", AssetType.IMAGE);
		
		className.set ("img/objects/watermelon.png", __ASSET__img_objects_watermelon_png);
		type.set ("img/objects/watermelon.png", AssetType.IMAGE);
		
		className.set ("img/player/character.png", __ASSET__img_player_character_png);
		type.set ("img/player/character.png", AssetType.IMAGE);
		
		className.set ("img/player/firefox.png", __ASSET__img_player_firefox_png);
		type.set ("img/player/firefox.png", AssetType.IMAGE);
		
		className.set ("img/player/hero.png", __ASSET__img_player_hero_png);
		type.set ("img/player/hero.png", AssetType.IMAGE);
		
		className.set ("img/player/set.png", __ASSET__img_player_set_png);
		type.set ("img/player/set.png", AssetType.IMAGE);
		
		className.set ("img/player/wormanim.json", __ASSET__img_player_wormanim_json);
		type.set ("img/player/wormanim.json", AssetType.TEXT);
		
		className.set ("img/player/WormAnim.png", __ASSET__img_player_wormanim_png);
		type.set ("img/player/WormAnim.png", AssetType.IMAGE);
		
		className.set ("img/ProgressBar/Background.png", __ASSET__img_progressbar_background_png);
		type.set ("img/ProgressBar/Background.png", AssetType.IMAGE);
		
		className.set ("img/ProgressBar/HealthProgress.png", __ASSET__img_progressbar_healthprogress_png);
		type.set ("img/ProgressBar/HealthProgress.png", AssetType.IMAGE);
		
		className.set ("img/set.png", __ASSET__img_set_png);
		type.set ("img/set.png", AssetType.IMAGE);
		
		className.set ("img/SpriteSheetData.png", __ASSET__img_spritesheetdata_png);
		type.set ("img/SpriteSheetData.png", AssetType.IMAGE);
		
		className.set ("img/SpriteSheetData.xml", __ASSET__img_spritesheetdata_xml);
		type.set ("img/SpriteSheetData.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level1_background_1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level1_background_2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level1_background_3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_apple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_avocado_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_badbasket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_burger_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_carrot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_donut_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_frenchfries_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_goodbasket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_lettuce_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_pizza_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_sausage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_collectables_watermelon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_kit_from_firefox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_apple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_avocado_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_badbasket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_burger_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_carrot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_donut_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_frenchfries_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_goodbasket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_lettuce_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_pizza_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_sausage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_objects_watermelon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_character_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_firefox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_wormanim_json extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__img_player_wormanim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_progressbar_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_progressbar_healthprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spritesheetdata_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spritesheetdata_xml extends flash.utils.ByteArray { }


#elseif html5











































#else



#if (windows || mac || linux || cpp)


@:image("assets/img/32.png") #if display private #end class __ASSET__img_32_png extends lime.graphics.Image {}
@:image("assets/img/background/level1/background-1.jpg") #if display private #end class __ASSET__img_background_level1_background_1_jpg extends lime.graphics.Image {}
@:image("assets/img/background/level1/background-2.jpg") #if display private #end class __ASSET__img_background_level1_background_2_jpg extends lime.graphics.Image {}
@:image("assets/img/background/level1/background-3.jpg") #if display private #end class __ASSET__img_background_level1_background_3_jpg extends lime.graphics.Image {}
@:image("assets/img/Collectables/apple.png") #if display private #end class __ASSET__img_collectables_apple_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/avocado.png") #if display private #end class __ASSET__img_collectables_avocado_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/badBasket.png") #if display private #end class __ASSET__img_collectables_badbasket_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/burger.png") #if display private #end class __ASSET__img_collectables_burger_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/carrot.png") #if display private #end class __ASSET__img_collectables_carrot_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/donut.png") #if display private #end class __ASSET__img_collectables_donut_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/frenchFries.png") #if display private #end class __ASSET__img_collectables_frenchfries_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/goodBasket.png") #if display private #end class __ASSET__img_collectables_goodbasket_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/lettuce.png") #if display private #end class __ASSET__img_collectables_lettuce_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/pizza.png") #if display private #end class __ASSET__img_collectables_pizza_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/sausage.png") #if display private #end class __ASSET__img_collectables_sausage_png extends lime.graphics.Image {}
@:image("assets/img/Collectables/watermelon.png") #if display private #end class __ASSET__img_collectables_watermelon_png extends lime.graphics.Image {}
@:image("assets/img/kit_from_firefox.png") #if display private #end class __ASSET__img_kit_from_firefox_png extends lime.graphics.Image {}
@:image("assets/img/objects/apple.png") #if display private #end class __ASSET__img_objects_apple_png extends lime.graphics.Image {}
@:image("assets/img/objects/avocado.png") #if display private #end class __ASSET__img_objects_avocado_png extends lime.graphics.Image {}
@:image("assets/img/objects/badBasket.png") #if display private #end class __ASSET__img_objects_badbasket_png extends lime.graphics.Image {}
@:image("assets/img/objects/burger.png") #if display private #end class __ASSET__img_objects_burger_png extends lime.graphics.Image {}
@:image("assets/img/objects/carrot.png") #if display private #end class __ASSET__img_objects_carrot_png extends lime.graphics.Image {}
@:image("assets/img/objects/donut.png") #if display private #end class __ASSET__img_objects_donut_png extends lime.graphics.Image {}
@:image("assets/img/objects/frenchFries.png") #if display private #end class __ASSET__img_objects_frenchfries_png extends lime.graphics.Image {}
@:image("assets/img/objects/goodBasket.png") #if display private #end class __ASSET__img_objects_goodbasket_png extends lime.graphics.Image {}
@:image("assets/img/objects/lettuce.png") #if display private #end class __ASSET__img_objects_lettuce_png extends lime.graphics.Image {}
@:image("assets/img/objects/pizza.png") #if display private #end class __ASSET__img_objects_pizza_png extends lime.graphics.Image {}
@:image("assets/img/objects/sausage.png") #if display private #end class __ASSET__img_objects_sausage_png extends lime.graphics.Image {}
@:image("assets/img/objects/watermelon.png") #if display private #end class __ASSET__img_objects_watermelon_png extends lime.graphics.Image {}
@:image("assets/img/player/character.png") #if display private #end class __ASSET__img_player_character_png extends lime.graphics.Image {}
@:image("assets/img/player/firefox.png") #if display private #end class __ASSET__img_player_firefox_png extends lime.graphics.Image {}
@:image("assets/img/player/hero.png") #if display private #end class __ASSET__img_player_hero_png extends lime.graphics.Image {}
@:image("assets/img/player/set.png") #if display private #end class __ASSET__img_player_set_png extends lime.graphics.Image {}
@:file("assets/img/player/wormanim.json") #if display private #end class __ASSET__img_player_wormanim_json extends lime.utils.ByteArray {}
@:image("assets/img/player/WormAnim.png") #if display private #end class __ASSET__img_player_wormanim_png extends lime.graphics.Image {}
@:image("assets/img/ProgressBar/Background.png") #if display private #end class __ASSET__img_progressbar_background_png extends lime.graphics.Image {}
@:image("assets/img/ProgressBar/HealthProgress.png") #if display private #end class __ASSET__img_progressbar_healthprogress_png extends lime.graphics.Image {}
@:image("assets/img/set.png") #if display private #end class __ASSET__img_set_png extends lime.graphics.Image {}
@:image("assets/img/SpriteSheetData.png") #if display private #end class __ASSET__img_spritesheetdata_png extends lime.graphics.Image {}
@:file("assets/img/SpriteSheetData.xml") #if display private #end class __ASSET__img_spritesheetdata_xml extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)

#end

#end