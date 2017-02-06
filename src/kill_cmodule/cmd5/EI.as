package kill_cmodule.cmd5 {
  import kill_cmodule._common.Log;
  import kill_cmodule._common.External;
  
  
  public class EI extends External {
    private var _core :Core;
    
    public function EI(log :Log) {
      super(log);
    }
    public function set_core(c :Core) :void {
      _core = c;
    }
    public override function get version() :String {
      return 'swf_core: kill_cmodule/cmd5 version 0.2.0-1 test20170206 1840';
    }
    public override function about() :Object {
      var o :Object = super.about();
      
      o.core = 'swf/cmd5 (271)';
      o.external_interface.function_list.push('xcalc(raw :String) :String');
      
      o.debug['core_loaded'] = _core.loaded;
      o.debug['f_xcalc'] = '' + _core.f_xcalc;
      return o;
    }
    
    protected override function _add_callback() :void {
      add_callback('xcalc', _ei_xcalc);
    }
    
    // ei: export: `xcalc(raw :String) :String`
    private function _ei_xcalc(raw :String) :String {
      return _core.xcalc(raw);
    }
  }
}
