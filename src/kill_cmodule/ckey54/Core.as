package kill_cmodule.ckey54 {
  import flash.utils.ByteArray;
  import flash.events.Event;
  
  import kill_cmodule._common.Log;
  import kill_cmodule._common.SwfLoader;
  import kill_cmodule._common.External;
  
  
  // load and call swf player core
  public class Core {
    // the swf player to load
    [Embed(source="../../../player/ckey54-core-4.swf", mimeType="application/octet-stream")]
    private static const _core_bin :Class;
    // NOTE should load host .swf first
    [Embed(source="../../../player/ckey54-host-4.swf", mimeType="application/octet-stream")]
    private static const _host_bin :Class;
    
    private var _l :Log;
    private var _ei :External;
    private var _host :SwfLoader;
    private var _core :SwfLoader;
    private var _loaded :Boolean = false;
    
    
    public function Core(log :Log, ei :External) {
      _l = log;
      _ei = ei;
    }
    public function get loaded() :Boolean {
      return _loaded;
    }
    
    public function reset() :void {
      _host = null;
      _core = null;
      _loaded = false;
    }
    
    public function init() :void {
      // NOTE reset core before load (support re-load)
      reset();
      
      _l.d('Core: start load host .swf .. . ');
      // load host
      _host = new SwfLoader(_l);
      _host.addEventListener('done', _on_load_done);
      _host.load(new _host_bin() as ByteArray);
    }
    
    private function _on_load_done(e :Event) :void {
      // check core loaded
      if (_core == null) {
        _l.d('Core: host .swf load done, start load core .swf .. . ');
        
        _core = new SwfLoader(_l);
        _core.addEventListener('done', _on_load_done);
        // NOTE use the same context
        _core.context = _host.context;
        
        _core.load(new _core_bin() as ByteArray);
        return;
      }
      // DEBUG
      _l.d('Core: core .swf load done. ');
      
      _init_ckey54();
      
      _loaded = true;
      _ei.callback('load_core', 'OK');
    }
    
    private function _init_ckey54() :void {
      // get f
      Ckey54.instance.f_native_echo_ckeyv3 = _core.get_def('com.tencent.encryptModule.native_echo_ckeyv3') as Function;
      // get class
      Ckey54.instance.c_cmodule = _core.get_def('com.tencent.encryptModule.CModule') as Class;
    }
    
    
    // ei: rtoken
    public function get rtoken() :String {
      return Ckey54.instance._ck50data.rtoken;
    }
    public function set rtoken(text :String) :void {
      Ckey54.instance._ck50data.rtoken = text;
    }
    
    public function get_ckey(info :Object) :Object {
      // NOTE auto-set rtoken
      if (info.rtoken != null) {
        Ckey54.instance._ck50data.rtoken = info.rtoken;
      }
      return Ckey54.instance.getCKey(info);
    }
  }
}
