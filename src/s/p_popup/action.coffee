# action.coffee, parse_v-crx/src/s/p_popup/

log = require '../log'
config = require '../config'
msg = require '../msg'


# action types

# set state (info) from background.js
SET_BG_STATE = 'SET_BG_STATE'

# flush action
FLUSH = 'FLUSH'


set_bg_state = (data) ->
  {
    type: SET_BG_STATE
    payload: data
  }

flush = (state) ->
  # payload: state in ['doing', 'done']
  {
    type: FLUSH
    payload: state
  }


# no action actions

page_re_check = (tab_id) ->
  (dispatch) ->
    # send check_support msg
    msg.send_to_content msg.t.check_support, null, null, tab_id
    log.d 'popup: send check_support msg to content.js '

page_start = (tab_id) ->
  (dispatch) ->
    # send start_flush msg
    msg.send msg.t.start_flush, {
      tab_id: tab_id
    }
    # NOTE change doing state
    dispatch flush('doing')

page_more = ->
  (dispatch) ->
    log.d 'open (more) window '
    window.open 'dl.html', '_blank'


module.exports = {
  SET_BG_STATE
  FLUSH
  
  FLUSH_DOING: 'doing'
  FLUSH_DONE: 'done'
  
  set_bg_state
  flush
  
  page_re_check
  page_start
  page_more
}
# end action.coffee

