// ckey54_main.as, swf_core/src/
package {
  import flash.display.Sprite;
  
  import kill_cmodule._common.Log;
  
  import kill_cmodule.ckey54.Core;
  import kill_cmodule.ckey54.EI;
  
  
  public class ckey54_main extends Sprite {
    private var _l :Log;
    private var _c :Core;
    private var _ei :EI;
    
    public function ckey54_main() {
      _l = new Log(this);
      _l.init();
      
      _ei = new EI(_l);
      _c = new Core(_l, _ei);
      _ei.set_core(_c);
      
      _ei.init();
    }
  }
}
