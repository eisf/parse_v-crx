package kill_cmodule.ckey54 {
  import flash.utils.ByteArray;
  
  import kill_cmodule._common.Log;
  import kill_cmodule._common.External;
  import kill_cmodule._common.Base64;
  
  
  public class EI extends External {
    private var _core :Core;
    
    public function EI(log :Log) {
      super(log);
    }
    public function set_core(c :Core) :void {
      super.set_loader(c);
      _core = c;
    }
    public override function get version() :String {
      return 'swf_core: kill_cmodule/ckey54 version 0.1.0-1 test20170205 0729';
    }
    public override function about() :Object {
      var o :Object = super.about();
      
      o.core = 'swf/ckey54 (vqq)';
      
      var a :Function = function (text :String) :void {
        o.external_interface.function_list.push(text);
      };
      a('get_rtoken() :String');
      a('set_rtoken(rtoken :String) :void');
      a('load_ck50data() :String // -> JSON');
      a('save_ck50data(data :String) :void // data: JSON');
      
      a('get_ckey(info :String) :String // info: JSON, -> JSON');
      
      o.debug['f_native_echo_ckeyv3'] = '' + Ckey54.instance.f_native_echo_ckeyv3;
      o.debug['c_cmodule'] = '' + Ckey54.instance.c_cmodule;
      return o;
    }
    
    protected override function _add_callback() :void {
      add_callback('get_rtoken', _ei_get_rtoken);
      add_callback('set_rtoken', _ei_set_rtoken);
      
      add_callback('load_ck50data', _ei_load_ck50data);
      add_callback('save_ck50data', _ei_save_ck50data);
      
      add_callback('get_ckey', _ei_get_ckey);
    }
    
    // ei: export: `get_rtoken() :String`
    private function _ei_get_rtoken() :String {
      return _core.rtoken;
    }
    // ei: export: `set_rtoken(rtoken :String) :void`
    private function _ei_set_rtoken(rtoken :String) :void {
      _core.rtoken = rtoken;
    }
    
    // ei: export: `load_ck50data() :String // -> JSON`
    private function _ei_load_ck50data() :String {
      var data :Object = Ck50data.load();
      if (data != null) {
        return JSON.stringify(data);
      }
      return null;
    }
    // ei: export: `save_ck50data(data :String) :void // data: JSON`
    private function _ei_save_ck50data(data :String) :void {
      if (data != null) {
        // TODO error process
        var d :Object = JSON.parse(data);
        Ck50data.save(d);
      }
    }
    
    // ei: export `get_ckey(info :String) :String // info: JSON, -> JSON`
    private function _ei_get_ckey(info :String) :String {
      var i :Object = JSON.parse(info);
      // error process
      try {
        var o :Object = _core.get_ckey(i);
        return JSON.stringify(o);
      } catch (e :Error) {
        o = {
          "error": true, 
          "_error": '' + e
        };
        return JSON.stringify(o);
      }
      return null;
    }
  }
}
