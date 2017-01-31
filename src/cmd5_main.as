// cmd5_main.as, swf_core/src/
package {
  import flash.utils.ByteArray;
  import flash.utils.setTimeout;
  import flash.display.Sprite;
  import flash.display.Loader;
  import flash.system.LoaderContext;
  import flash.system.ApplicationDomain;
  import flash.events.Event;
  import flash.external.ExternalInterface;
  // for DEBUG
  import flash.text.TextField;
  
  import kill_cmodule.cmd5.Xcalc;
  
  
  public class cmd5_main extends Sprite {
    
    public function cmd5_main() {
      _init_log();
      _ei_init();
    }
    
    // for DEBUG
    private var _t :TextField;
    
    private function _init_log() :void {
      _t = new TextField();
      _t.x = 0;
      _t.y = 0;
      _t.width = 720;
      _t.height = 450;
      _t.multiline = true;
      _t.wordWrap = true;
      _t.border = true;
      _t.background = true;
      _t.text = "\n";
      addChild(_t);
    }
    
    private function _log(text :String) :void {
      // TODO better prefix
      _t.appendText(":: " + text + "\n");
    }
    
    
    // PART lc: Load Core: load and call swf player core
    // lc: the swf player to load
    [Embed(source="player/cmd5-1.swf", mimeType="application/octet-stream")]
    private static const _lc_player :Class;
    private var _lc_loader :Loader = null;
    private var _lc_domain :ApplicationDomain = null;
    private var _lc_f_xcalc :Function = null;
    private var _lc_core_loaded :Boolean = false;
    
    private function _lc_load_player() :void {
      var data :ByteArray = new _lc_player() as ByteArray;
      _lc_loader = new Loader();
      _lc_loader.contentLoaderInfo.addEventListener('init', _lc_on_load_init);
      _lc_loader.contentLoaderInfo.addEventListener('complete', _lc_on_load_done);
      
      var c :LoaderContext = new LoaderContext();
      c.allowCodeImport = true;
      c.parameters = null;
      _lc_loader.loadBytes(data, c);
    }
    private function _lc_on_load_init(e :Event) :void {
      // TODO
    }
    private function _lc_on_load_done(e :Event) :void {
      _lc_domain = _lc_loader.contentLoaderInfo.applicationDomain;
      // get f_xcalc
      _lc_f_xcalc = _lc_domain.getDefinition('cmd5.xcalc') as Function;
      
      _lc_core_loaded = true;
      // TODO error process
      _ei_callback('load_core', 'OK');
    }
    
    
    // part ei: External Interface
    
    // ei: `_callback(event_type :String, data :String) :void`
    private var _ei_callback_function_name :String = "default_callback";
    private static const _ei_mark :String = "uuid=ee277d11-f7ba-422f-b122-13a20f5763b2";
    private static const _ei_version :String = "swf_core: kill_cmodule/cmd5 version 0.1.0-2 test20170131 2218";
    
    private function _ei_init() :void {
      if (ExternalInterface.available) {
        try {
          _ei_init_add_callback();
          _log("[ OK ] init done. ");
        } catch (e :Error) {
          _log("ERROR: ExternalInterface.addCallback() failed, " + e);
        }
      } else {
        _log("ERROR: ExternalInterface is not available");
      }
    }
    
    private function _ei_init_add_callback() :void {
      ExternalInterface.addCallback('about', _ei_about);
      ExternalInterface.addCallback('set_callback', _ei_set_callback);
      ExternalInterface.addCallback('load_core', _ei_load_core);
      ExternalInterface.addCallback('xcalc', _ei_xcalc);
    }
    
    private function _ei_callback(event_type :String, data :String) :void {
      if (ExternalInterface.available) {
        ExternalInterface.call(_ei_callback_function_name, event_type, data);
      } // else: TODO
    }
    // ei: export: `about() :String [JSON]`
    private function _ei_about() :String {
      var o :Object = {
        "mark": _ei_mark, 
        "version": _ei_version, 
        "core": "swf/cmd5 (271)", 
        
        "external_interface": {
          "function_list": [
            "about() :String // -> JSON", 
            "set_callback(callback_function_name :String) :void", 
            "load_core() :void // async, event: load_core", 
            "xcalc(raw :String) :String", 
            
            "_callback(event_type :String, data :String) :void"
          ], 
          "event_type": [
            "load_core"
          ], 
          "callback_function_name": _ei_callback_function_name
        }, 
        
        "debug": {
          "core_loaded": _lc_core_loaded, 
          "f_xcalc": "" + _lc_f_xcalc
        }
      };
      return JSON.stringify(o);
    }
    // ei: export: `set_callback(callback_function_name :String) :void`
    private function _ei_set_callback(callback_function_name :String) :void {
      _ei_callback_function_name = callback_function_name;
    }
    // ei: export: `load_core() :void`
    private function _ei_load_core() :void {
      _lc_load_player();
    }
    // ei: export: `xcalc(raw :String) :String`
    private function _ei_xcalc(raw :String) :String {
      return Xcalc.calc(raw, _lc_f_xcalc);
    }
  }
}
