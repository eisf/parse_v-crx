package kill_cmodule._common {
  import flash.external.ExternalInterface;
  
  
  // ei: External Interface
  public class External {
    protected var _l :Log;
    protected var _c :CoreLoader;
    
    // ei: `_callback(event_type :String, data :String) :void`
    private var _callback_function_name :String = 'default_callback';
    
    
    public function External(log :Log) {
      _l = log;
    }
    public function set_loader(c :CoreLoader) :void {
      _c = c;
    }
    
    public function get mark() :String {
      return 'uuid=ee277d11-f7ba-422f-b122-13a20f5763b2';
    }
    // for override
    public function get version() :String {
      return 'swf_core: kill_cmodule/_UNKNOW version 0.2.0-2 test20170205 0504';
    }
    // for override
    public function about() :Object {
      var core_loaded :Boolean = false;
      if ((_c != null) && (_c.core_loaded)) {
        core_loaded = true;
      }
      
      var o :Object = {
        "mark": mark, 
        "version": version, 
        // (for override)
        "core": "swf/_UNKNOW (UNKNOW)", 
        
        "external_interface": {
          "function_list": [
            "about() :String // -> JSON", 
            "set_callback(callback_function_name :String) :void", 
            "load_core() :void // async, event: load_core", 
            
            "_callback(event_type :String, data :String) :void"
            // NOTE add description of custom functions here
          ], 
          "event_type": [
            "load_core"
          ], 
          "callback_function_name": _callback_function_name
        }, 
        
        "debug": {
          "core_loaded": core_loaded
          // custom DEBUG info
        }
      };
      return o;
    }
    
    public function init() :void {
      if (ExternalInterface.available) {
        try {
          _init_add_callback();
          _l.p('[ OK ] init done. ');
        } catch (e :Error) {
          _l.p('ERROR: ExternalInterface.addCallback() failed, ' + e);
        }
      } else {
        _l.p('ERROR: ExternalInterface is not available');
      }
    }
    
    public function add_callback(name :String, f :Function) :void {
      ExternalInterface.addCallback(name, f);
    }
    
    private function _init_add_callback() :void {
      add_callback('about', _ei_about);
      add_callback('set_callback', _ei_set_callback);
      add_callback('load_core', _ei_load_core);
      
      _add_callback();
    }
    // for override
    protected function _add_callback() :void {
    }
    
    
    public function callback(event_type :String, data :String) :void {
      if (ExternalInterface.available) {
        ExternalInterface.call(_callback_function_name, event_type, data);
      } // else: TODO
    }
    
    // ei: export: `about() :String // -> JSON`
    private function _ei_about() :String {
      var o :Object = about();
      return JSON.stringify(o);
    }
    // ei: export: `set_callback(callback_function_name :String) :void`
    private function _ei_set_callback(callback_function_name :String) :void {
      _callback_function_name = callback_function_name;
    }
    // ei: export: `load_core() :void`
    private function _ei_load_core() :void {
      _c.load();
    }
  }
}
