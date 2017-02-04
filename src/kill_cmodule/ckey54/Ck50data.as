package kill_cmodule.ckey54 {
  import flash.net.SharedObject;
  
  public class Ck50data {
    public static var name :String = 'ck50data';
    
    public static function load() :Object {
      try {
        var s :SharedObject = SharedObject.getLocal(name, null);
        return s.data;
      } catch(e :Error) {
        // TODO
      }
      return null;
    }
    
    public static function save(data :Object) :void {
      var s :SharedObject = SharedObject.getLocal(name, null);
      // save data
      for (var k :* in data) {
        s.data[k] = data[k];
      }
      
      s.flush(10000);
    }
  }
}
