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
		
		className.set ("img/2dtoolkit.png", __ASSET__img_2dtoolkit_png);
		type.set ("img/2dtoolkit.png", AssetType.IMAGE);
		className.set ("img/32.png", __ASSET__img_32_png);
		type.set ("img/32.png", AssetType.IMAGE);
		className.set ("img/AC-DC-Logo-5-600x270.png", __ASSET__img_ac_dc_logo_5_600x270_png);
		type.set ("img/AC-DC-Logo-5-600x270.png", AssetType.IMAGE);
		className.set ("img/arR80xV_700b.jpg", __ASSET__img_arr80xv_700b_jpg);
		type.set ("img/arR80xV_700b.jpg", AssetType.IMAGE);
		className.set ("img/aVXLppO_460sv.mp4", __ASSET__img_avxlppo_460sv_mp4);
		type.set ("img/aVXLppO_460sv.mp4", AssetType.BINARY);
		className.set ("img/aWO9jDn_460sv.mp4", __ASSET__img_awo9jdn_460sv_mp4);
		type.set ("img/aWO9jDn_460sv.mp4", AssetType.BINARY);
		className.set ("img/Cell_Blue.png", __ASSET__img_cell_blue_png);
		type.set ("img/Cell_Blue.png", AssetType.IMAGE);
		className.set ("img/Cell_Green.png", __ASSET__img_cell_green_png);
		type.set ("img/Cell_Green.png", AssetType.IMAGE);
		className.set ("img/Cell_Grey.png", __ASSET__img_cell_grey_png);
		type.set ("img/Cell_Grey.png", AssetType.IMAGE);
		className.set ("img/Cell_Move.png", __ASSET__img_cell_move_png);
		type.set ("img/Cell_Move.png", AssetType.IMAGE);
		className.set ("img/Cell_Purple.png", __ASSET__img_cell_purple_png);
		type.set ("img/Cell_Purple.png", AssetType.IMAGE);
		className.set ("img/Cell_Red.png", __ASSET__img_cell_red_png);
		type.set ("img/Cell_Red.png", AssetType.IMAGE);
		className.set ("img/Cell_Yellow.png", __ASSET__img_cell_yellow_png);
		type.set ("img/Cell_Yellow.png", AssetType.IMAGE);
		className.set ("img/Grass.jpg", __ASSET__img_grass_jpg);
		type.set ("img/Grass.jpg", AssetType.IMAGE);
		className.set ("img/image.png", __ASSET__img_image_png);
		type.set ("img/image.png", AssetType.IMAGE);
		className.set ("img/kit_from_firefox.png", __ASSET__img_kit_from_firefox_png);
		type.set ("img/kit_from_firefox.png", AssetType.IMAGE);
		className.set ("img/set.png", __ASSET__img_set_png);
		type.set ("img/set.png", AssetType.IMAGE);
		className.set ("img/SpriteSheetData.png", __ASSET__img_spritesheetdata_png);
		type.set ("img/SpriteSheetData.png", AssetType.IMAGE);
		className.set ("img/SpriteSheetData.xml", __ASSET__img_spritesheetdata_xml);
		type.set ("img/SpriteSheetData.xml", AssetType.TEXT);
		className.set ("img/Voyager-records-631.jpg__800x600_q85_crop.jpg", __ASSET__img_voyager_records_631_jpg__800x600_q85_crop_jpg);
		type.set ("img/Voyager-records-631.jpg__800x600_q85_crop.jpg", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "img/2dtoolkit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/AC-DC-Logo-5-600x270.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/arR80xV_700b.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/aVXLppO_460sv.mp4";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "img/aWO9jDn_460sv.mp4";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "img/Cell_Blue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Green.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Grey.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Move.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Purple.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Red.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Cell_Yellow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Grass.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/image.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/kit_from_firefox.png";
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
		id = "img/Voyager-records-631.jpg__800x600_q85_crop.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
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
		
		className.set ("img/2dtoolkit.png", __ASSET__img_2dtoolkit_png);
		type.set ("img/2dtoolkit.png", AssetType.IMAGE);
		
		className.set ("img/32.png", __ASSET__img_32_png);
		type.set ("img/32.png", AssetType.IMAGE);
		
		className.set ("img/AC-DC-Logo-5-600x270.png", __ASSET__img_ac_dc_logo_5_600x270_png);
		type.set ("img/AC-DC-Logo-5-600x270.png", AssetType.IMAGE);
		
		className.set ("img/arR80xV_700b.jpg", __ASSET__img_arr80xv_700b_jpg);
		type.set ("img/arR80xV_700b.jpg", AssetType.IMAGE);
		
		className.set ("img/aVXLppO_460sv.mp4", __ASSET__img_avxlppo_460sv_mp4);
		type.set ("img/aVXLppO_460sv.mp4", AssetType.BINARY);
		
		className.set ("img/aWO9jDn_460sv.mp4", __ASSET__img_awo9jdn_460sv_mp4);
		type.set ("img/aWO9jDn_460sv.mp4", AssetType.BINARY);
		
		className.set ("img/Cell_Blue.png", __ASSET__img_cell_blue_png);
		type.set ("img/Cell_Blue.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Green.png", __ASSET__img_cell_green_png);
		type.set ("img/Cell_Green.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Grey.png", __ASSET__img_cell_grey_png);
		type.set ("img/Cell_Grey.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Move.png", __ASSET__img_cell_move_png);
		type.set ("img/Cell_Move.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Purple.png", __ASSET__img_cell_purple_png);
		type.set ("img/Cell_Purple.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Red.png", __ASSET__img_cell_red_png);
		type.set ("img/Cell_Red.png", AssetType.IMAGE);
		
		className.set ("img/Cell_Yellow.png", __ASSET__img_cell_yellow_png);
		type.set ("img/Cell_Yellow.png", AssetType.IMAGE);
		
		className.set ("img/Grass.jpg", __ASSET__img_grass_jpg);
		type.set ("img/Grass.jpg", AssetType.IMAGE);
		
		className.set ("img/image.png", __ASSET__img_image_png);
		type.set ("img/image.png", AssetType.IMAGE);
		
		className.set ("img/kit_from_firefox.png", __ASSET__img_kit_from_firefox_png);
		type.set ("img/kit_from_firefox.png", AssetType.IMAGE);
		
		className.set ("img/set.png", __ASSET__img_set_png);
		type.set ("img/set.png", AssetType.IMAGE);
		
		className.set ("img/SpriteSheetData.png", __ASSET__img_spritesheetdata_png);
		type.set ("img/SpriteSheetData.png", AssetType.IMAGE);
		
		className.set ("img/SpriteSheetData.xml", __ASSET__img_spritesheetdata_xml);
		type.set ("img/SpriteSheetData.xml", AssetType.TEXT);
		
		className.set ("img/Voyager-records-631.jpg__800x600_q85_crop.jpg", __ASSET__img_voyager_records_631_jpg__800x600_q85_crop_jpg);
		type.set ("img/Voyager-records-631.jpg__800x600_q85_crop.jpg", AssetType.IMAGE);
		
		
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
			#elseif (ios || tvos)
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
								
								#if (ios || tvos)
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

@:keep @:bind #if display private #end class __ASSET__img_2dtoolkit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ac_dc_logo_5_600x270_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_arr80xv_700b_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_avxlppo_460sv_mp4 extends null { }
@:keep @:bind #if display private #end class __ASSET__img_awo9jdn_460sv_mp4 extends null { }
@:keep @:bind #if display private #end class __ASSET__img_cell_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_green_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_grey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_move_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_purple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_red_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_cell_yellow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_grass_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_image_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_kit_from_firefox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spritesheetdata_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spritesheetdata_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__img_voyager_records_631_jpg__800x600_q85_crop_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5























#else



#if (windows || mac || linux || cpp)


@:image("assets/img/2dtoolkit.png") #if display private #end class __ASSET__img_2dtoolkit_png extends lime.graphics.Image {}
@:image("assets/img/32.png") #if display private #end class __ASSET__img_32_png extends lime.graphics.Image {}
@:image("assets/img/AC-DC-Logo-5-600x270.png") #if display private #end class __ASSET__img_ac_dc_logo_5_600x270_png extends lime.graphics.Image {}
@:image("assets/img/arR80xV_700b.jpg") #if display private #end class __ASSET__img_arr80xv_700b_jpg extends lime.graphics.Image {}
@:file("assets/img/aVXLppO_460sv.mp4") #if display private #end class __ASSET__img_avxlppo_460sv_mp4 extends lime.utils.ByteArray {}
@:file("assets/img/aWO9jDn_460sv.mp4") #if display private #end class __ASSET__img_awo9jdn_460sv_mp4 extends lime.utils.ByteArray {}
@:image("assets/img/Cell_Blue.png") #if display private #end class __ASSET__img_cell_blue_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Green.png") #if display private #end class __ASSET__img_cell_green_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Grey.png") #if display private #end class __ASSET__img_cell_grey_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Move.png") #if display private #end class __ASSET__img_cell_move_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Purple.png") #if display private #end class __ASSET__img_cell_purple_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Red.png") #if display private #end class __ASSET__img_cell_red_png extends lime.graphics.Image {}
@:image("assets/img/Cell_Yellow.png") #if display private #end class __ASSET__img_cell_yellow_png extends lime.graphics.Image {}
@:image("assets/img/Grass.jpg") #if display private #end class __ASSET__img_grass_jpg extends lime.graphics.Image {}
@:image("assets/img/image.png") #if display private #end class __ASSET__img_image_png extends lime.graphics.Image {}
@:image("assets/img/kit_from_firefox.png") #if display private #end class __ASSET__img_kit_from_firefox_png extends lime.graphics.Image {}
@:image("assets/img/set.png") #if display private #end class __ASSET__img_set_png extends lime.graphics.Image {}
@:image("assets/img/SpriteSheetData.png") #if display private #end class __ASSET__img_spritesheetdata_png extends lime.graphics.Image {}
@:file("assets/img/SpriteSheetData.xml") #if display private #end class __ASSET__img_spritesheetdata_xml extends lime.utils.ByteArray {}
@:image("assets/img/Voyager-records-631.jpg__800x600_q85_crop.jpg") #if display private #end class __ASSET__img_voyager_records_631_jpg__800x600_q85_crop_jpg extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)

#end

#end