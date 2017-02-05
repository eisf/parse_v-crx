package kill_cmodule._common {
  import flash.events.Event;
  
  public class DataEvent extends Event {
    private var _d :Object;
    
    public function DataEvent(event_type :String, d :Object) {
      super(event_type);
      _d = d;
    }
    
    public function get data() :Object {
      return _d;
    }
  }
}
