package kill_cmodule._common {
  import flash.display.Sprite;
  import flash.text.TextField;
  
  public class Log {
    public var prefix :String = 'kill_cmodule:: ';
    
    private var _host :Sprite;
    private var _t :TextField;
    
    
    public function Log(host :Sprite) {
      _host = host;
    }
    
    public function init() :void {
      _t = new TextField();
      _t.x = 0;
      _t.y = 0;
      _t.width = 720;
      _t.height = 450;
      _t.multiline = true;
      _t.wordWrap = true;
      _t.border = true;
      _t.background = true;
      _t.text = '\n';
      _host.addChild(_t);
    }
    
    // base text append (log) function
    private function _p(text :String) :void {
      _t.appendText(text);
    }
    
    // raw print
    public function p(text :String) :void {
      _p(prefix + text + '\n');
    }
    
    // DEBUG
    public function d(text :String) :void {
      p('DEBUG: ' + text);
    }
  }
}
