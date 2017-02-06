package kill_cmodule.cmd5 {
  import flash.utils.ByteArray;
  import flash.events.Event;
  
  import kill_cmodule._common.Log;
  import kill_cmodule._common.SwfLoader;
  import kill_cmodule._common.External;
  
  
  // load and call swf player core
  public class Core {
    // the swf player to load
    [Embed(source="../../../player/cmd5-1.swf", mimeType="application/octet-stream")]
    private static const _core_bin :Class;
    
    private var _ei :External;
    private var _l :Log;
    private var _core :SwfLoader;
    private var _loaded :Boolean = false;
    
    public var f_xcalc :Function = null;
    
    
    public function Core(log :Log, ei :External) {
      _l = log;
      _ei = ei;
    }
    public function get loaded() :Boolean {
      return _loaded;
    }
    
    public function init() :void {
      _core = new SwfLoader(_l);
      _core.addEventListener('done', _on_load_done);
      
      _core.load(new _core_bin() as ByteArray);
    }
    
    private function _on_load_done(e :Event) :void {
      // get f_xcalc
      f_xcalc = _core.get_def('cmd5.xcalc') as Function;
      
      _loaded = true;
      _ei.callback('load_core', 'OK');
    }
    
    public function xcalc(raw :String) :String {
      return Xcalc.calc(raw, f_xcalc);
    }
  }
}
