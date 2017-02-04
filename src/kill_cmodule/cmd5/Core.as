package kill_cmodule.cmd5 {
  import flash.utils.ByteArray;
  
  import kill_cmodule._common.Log;
  import kill_cmodule._common.CoreLoader;
  import kill_cmodule._common.External;
  
  
  // load and call swf player core
  public class Core extends CoreLoader {
    // the swf player to load
    [Embed(source="../../player/cmd5-1.swf", mimeType="application/octet-stream")]
    private static const _core_bin :Class;
    
    private var _ei :External;
    public var f_xcalc :Function = null;
    
    
    public function Core(log :Log, ei :External) {
      super(log);
      _ei = ei;
    }
    
    protected override function _get_core_bin() :ByteArray {
      return new _core_bin() as ByteArray;
    }
    protected override function _on_load_done() :void {
      // get f_xcalc
      f_xcalc = get_def('cmd5.xcalc') as Function;
      
      // TODO error process
      _ei.callback('load_core', 'OK');
    }
  }
}
