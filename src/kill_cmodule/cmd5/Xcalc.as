package kill_cmodule.cmd5 {
  import flash.utils.ByteArray;
  
  public class Xcalc {
    
    public static function calc(raw :String, f_xcalc :Function) :String {
      
      var _loc8 :String = raw;
      
      var _loc9 :ByteArray = new ByteArray();
      _loc9.writeUTFBytes(_loc8);
      var _loc10 :int = _loc9.length;
      var _loc11 :int = _loc10 / 2;
      var _loc12 :int = 0;
      while (_loc12 < _loc11) {
        _loc9[_loc12] = _loc9[_loc12] - (_loc12 % 4 * 3 + 2 * _loc12 + 4) % 5;
        _loc12 ++;
      }
      while (_loc12 < _loc10) {
        _loc9[_loc12] = _loc9[_loc12] - (_loc12 % 5 * 7 + 3 * _loc12 + 8) % 5;
        _loc12 ++;
      }
      var _loc13 :int = _loc9[0];
      _loc12 = 0;
      while (_loc12 < _loc10 - 1) {
        _loc9[_loc12] = _loc9[_loc12 + 1];
        _loc12 ++;
      }
      _loc9[_loc12] = _loc13;
      _loc9.position = 0;
      _loc8 = _loc9.readUTFBytes(_loc9.length);
      
      var out :String = raw + "&vf=" + f_xcalc(_loc8, _loc8);
      return out;
    }
  }
}
