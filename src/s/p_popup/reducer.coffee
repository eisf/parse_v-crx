# reducer.coffee, parse_v-crx/src/s/p_popup/

Immutable = require 'immutable'

log = require '../log'

action = require './action'


$$init_state = Immutable.fromJS {
  # loading state
  loading: true
  
  # state info from background.js
  bg_state: null
  
  # flush state
  flush_doing: false
  flush_done: false
}

root_reducer = ($$state, ac) ->
  switch ac.type
    when action.SET_BG_STATE
      $$o = $$state.set 'loading', false
      
      $$o = $$o.set 'bg_state', ac.payload
      # NOTE check already flush done
      if ac.payload.flush_done
        $$o = $$o.set 'flush_done', true
        $$o = $$o.set 'flush_doing', false
      return $$o
    when action.FLUSH
      switch ac.payload
        when action.FLUSH_DOING
          $$o = $$state.set 'flush_doing', true
          
          $$o = $$o.set 'flush_done', false
          return $$o
        when action.FLUSH_DONE
          $$o = $$state.set 'flush_doing', false
          
          $$o = $$o.set 'flush_done', true
          return $$o
        else
          log.d "p_popup/root_reducer: FLUSH: unknow act.state #{ac.payload}"
          return $$state
    else
      log.d "p_popup/root_reducer: unknow act.type #{ac.type}"
      return $$state


module.exports = {
  root: root_reducer
  init_state: $$init_state
}
# end reducer.coffee

