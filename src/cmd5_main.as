// cmd5_main.as, swf_core/src/
package {
  import flash.display.Sprite;
  import flash.events.Event;
  
  import kill_cmodule._common.Log;
  
  import kill_cmodule.cmd5.Core;
  import kill_cmodule.cmd5.EI;
  
  
  public class cmd5_main extends Sprite {
    private var _l :Log;
    private var _c :Core;
    private var _ei :EI;
    
    public function cmd5_main() {
      _l = new Log(this);
      _l.init();
      
      _ei = new EI(_l);
      _c = new Core(_l, _ei);
      _ei.set_core(_c);
      
      _ei.addEventListener('load_core', _on_load_core);
      _ei.init();
    }
    
    private function _on_load_core(e :Event) :void {
      _c.init();
    }
  }
}
