package kill_cmodule.ckey54 {
  import flash.utils.ByteArray;
  
  import kill_cmodule._common.Log;
  import kill_cmodule._common.CoreLoader;
  import kill_cmodule._common.External;
  
  
  // load and call swf player core
  public class Core extends CoreLoader {
    // the swf player to load
    [Embed(source="../../player/ckey54-1.swf", mimeType="application/octet-stream")]
    private static const _core_bin :Class;
    
    private var _ei :External;
    
    
    public function Core(log :Log, ei :External) {
      super(log);
      _ei = ei;
    }
    
    protected override function _get_core_bin() :ByteArray {
      return new _core_bin() as ByteArray;
    }
    protected override function _on_load_done() :void {
      // get f
      Ckey54.instance.f_native_echo_ckeyv3 = get_def('com.tencent.encryptModule.native_echo_ckeyv3') as Function;
      // get class
      Ckey54.instance.c_cmodule = get_def('com.tencent.encryptModule.CModule') as Class;
      
      // TODO error process
      _ei.callback('load_core', 'OK');
    }
    
    // ei: rtoken
    public function get rtoken() :String {
      return Ckey54.instance._ck50data.rtoken;
    }
    public function set rtoken(text :String) :void {
      Ckey54.instance._ck50data.rtoken = text;
    }
    
    public function get_ckey(info :Object) :Object {
      return Ckey54.instance.getCKey(info);
    }
  }
}
