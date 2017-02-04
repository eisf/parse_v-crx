package kill_cmodule._common {
  import flash.utils.ByteArray;
  
  import mx.utils.Base64Encoder;
  import mx.utils.Base64Decoder;
  
  
  public class Base64 {
    
    public static function encode(data :ByteArray) :String {
      var e :Base64Encoder = new Base64Encoder();
      e.insertNewLines = false;
      
      data.position = 0;
      e.encodeBytes(data, 0, data.length);
      return e.toString();
    }
    
    public static function decode(text :String) :ByteArray {
      var d :Base64Decoder = new Base64Decoder();
      
      d.decode(text);
      return d.toByteArray();
    }
  }
}
