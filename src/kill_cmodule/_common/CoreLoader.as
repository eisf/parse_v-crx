package kill_cmodule._common {
  import flash.utils.ByteArray;
  import flash.display.Loader;
  import flash.system.LoaderContext;
  import flash.system.ApplicationDomain;
  import flash.events.Event;
  
  
  public class CoreLoader {
    protected var _l :Log;
    
    private var _loader :Loader;
    private var _domain :ApplicationDomain;
    private var _core_loaded :Boolean = false;
    
    public function CoreLoader(log :Log) :void {
      _l = log;
    }
    
    public function load() :void {
      _start_load();
    }
    
    private function _start_load() :void {
      var data :ByteArray = _get_core_bin();
      
      _loader = new Loader();
      _loader.contentLoaderInfo.addEventListener('init', _on_core_load_init);
      _loader.contentLoaderInfo.addEventListener('complete', _on_core_load_done);
      
      var c :LoaderContext = new LoaderContext();
      c.allowCodeImport = true;
      // TODO
      c.parameters = null;
      
      _loader.loadBytes(data, c);
    }
    
    public function get_def(name :String) :Object {
      if (_domain != null) {
        return _domain.getDefinition(name);
      }
      return null;
    }
    
    // for override
    protected function _get_core_bin() :ByteArray {
      return null;
    }
    // for override
    protected function _on_load_done() :void {
    }
    
    private function _on_core_load_init(e :Event) :void {
      // TODO
    }
    private function _on_core_load_done(e :Event) :void {
      _domain = _loader.contentLoaderInfo.applicationDomain;
      
      // callback
      _on_load_done();
      _core_loaded = true;
    }
    
    public function get core_loaded() :Boolean {
      return _core_loaded;
    }
  }
}
