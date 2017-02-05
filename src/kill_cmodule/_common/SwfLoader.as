package kill_cmodule._common {
  import flash.utils.ByteArray;
  import flash.display.Loader;
  import flash.system.LoaderContext;
  import flash.system.ApplicationDomain;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  
  
  public class SwfLoader extends EventDispatcher {
    // event_type in ['done', 'err']
    
    protected var _l :Log;
    
    private var _loader :Loader;
    private var _context :LoaderContext;
    private var _domain :ApplicationDomain;
    private var _loaded :Boolean = false;
    
    public function SwfLoader(log :Log) :void {
      _l = log;
    }
    public function get context() :LoaderContext {
      return _context;
    }
    public function set context(c :LoaderContext) :void {
      _context = c;
    }
    public function get loaded() :Boolean {
      return _loaded;
    }
    
    public function load(bin :ByteArray) :void {
      // TODO error process
      _start_load(bin);
    }
    
    private function _create_context() :LoaderContext {
      var c :LoaderContext = new LoaderContext();
      c.allowCodeImport = true;
      // TODO
      c.parameters = null;
      return c;
    }
    
    private function _start_load(data :ByteArray) :void {
      _loader = new Loader();
      _loader.contentLoaderInfo.addEventListener('init', _on_init);
      _loader.contentLoaderInfo.addEventListener('complete', _on_done);
      // error
      _loader.contentLoaderInfo.addEventListener('ioError', _on_err);
      _loader.contentLoaderInfo.addEventListener('securityError', _on_err);
      
      if (_context == null) {
        _context = _create_context();
      }
      // DEBUG
      _l.d('SwfLoader: start load .. . ');
      _loader.loadBytes(data, _context);
    }
    
    public function get_def(name :String) :Object {
      if (_domain != null) {
        return _domain.getDefinition(name);
      }
      return null;
    }
    
    private function _on_init(e :Event) :void {
      // DEBUG
      _l.d('SwfLoader: load init ');
    }
    
    private function _on_done(e :Event) :void {
      _domain = _loader.contentLoaderInfo.applicationDomain;
      _loaded = true;
      // DEBUG
      _l.d('SwfLoader: load done. ');
      
      dispatchEvent(new Event('done'));
    }
    
    private function _on_err(e :Event) :void {
      // DEBUG
      _l.d('SwfLoader: load err: ' + e);
      
      dispatchEvent(new DataEvent('err', e));
    }
  }
}
