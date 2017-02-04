package kill_cmodule.ckey54 {
  
  public class Ckey54 {
    private static var _instance :Ckey54;
    
    // for implements
    public var _ck50data :Object = {};
    public var f_native_echo_ckeyv3 :Function;
    public var c_cmodule :Class;
    
    // raw
    private static const SO_NAME :String = "ck50data";
    public static const CKEY_VERTION :String = "5.4";
    private var _userid :String;
    private var _strappVer :String;
    private var _vid :String;
    private var _ckeyVer :String = "5.4";
    private var _timestamp :int;
    private var _rand :String;
    private var _sd :String;
    private var _appkey :String = "2DBB93AA1E51B5C35F65DD3FCAC03B4DC3B1FB0198EAF539399B4A9503C2BBA10D81F78CD6D62136FBD9203CC393F7B02DBB93AA1E51B5C35F65DD3FCAC03B4D";
    private var _playerplatform :int = 11;
    //private var _so:MySharedObject;
    //private var _cbdata:CallbackInfo;
    private var _ckey :String;
    
    
    public function Ckey54() :void {
      if (_instance != null) {
        throw new Error('please use `get instance()` ');
      }
    }
    
    public static function get instance() :Ckey54 {
      if (! _instance) {
        _instance = new Ckey54();
      }
      return _instance;
    }
    
    // raw
    public function getCKey(param1 :Object) :Object {
      if (!param1) {
        return {
          "ret": 1,
          "ckey": ""
        };
      }
      //closeSocket();
      var _loc3 :String = "";
      //_svrUrl = "rlog.video.qq.com";
      //_retryTimes = 0;
      
      _vid = !! param1.vid ? param1.vid:"";
      if (param1.platform && !isNaN(param1.platform)) {
        _playerplatform = Number(param1.platform);
      }
      _userid = !! param1.userid ? param1.userid:"";
      _strappVer = !! param1.playerVer ? param1.playerVer:"";
      _timestamp = !! param1.timestamp ? param1.timestamp:0;
      _rand = !! param1.rand ? param1.rand:"";
      _sd = !! param1.sd ? param1.sd:"";
      if (!_vid || !_ckeyVer || !_userid || !_strappVer) {
        return {
          "ret": 2,
          "ckey": ""
        };
      }
      
      //var _loc2:Object = _so.read("ck50data");
      var _loc2 :Object = _so_read();
      
      if (_loc2 && _loc2.rtoken) {
        _loc3 = getRegularCKey(_loc2.rtoken);
      } else {
        //_loc3 = getTmpCKey();
        // ERROR
        throw new Error('no rtoken: getTmpCKey()');
      }
      
      return {
        "ret": 0,
        "ckey": _loc3
      };
    }
    
    // raw
    private function getRegularCKey(param1 :String) :String {
      var _loc3 :String = "";
      var _loc2 :int = !! _timestamp ? _timestamp:Math.round(new Date().time / 1000);
      var _loc5 :* = [0];
      
      //var _loc4:int = CModule.malloc(_loc5.length);
      //CModule.write32(_loc4,_loc5[0]);
      //_loc3 = native_echo_ckeyv3(param1,_playerplatform,_ckeyVer,_strappVer,_vid,_loc2,_rand,_sd,"",_userid,_loc4,_loc5.length);
      //CModule.free(_loc4);
      var _loc4 :int = (c_cmodule.malloc as Function)(_loc5.length);
      (c_cmodule.write32 as Function)(_loc4, _loc5[0]);
      _loc3 = _native_echo_ckeyv3(param1, _playerplatform, _ckeyVer, _strappVer, _vid, _loc2, _rand, _sd, "", _userid, _loc4, _loc5.length);
      (c_cmodule.free as Function)(_loc4);
      
      return _loc3;
    }
    
    // implements
    private function _native_echo_ckeyv3(p1 :String, p2 :int, p3 :String, p4 :String, p5 :String, p6 :Number, p7 :String, p8 :String, p9 :String, p10 :String, p11 :int, p12 :int) :String {
      return f_native_echo_ckeyv3(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
    }
    
    private function _so_read() :Object {
      return _ck50data;
    }
  }
}
