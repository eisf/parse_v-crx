# gui.coffee, parse_v-crx/src/s/p_popup/

Immutable = require 'immutable'
Redux = require 'redux'
ReduxThunk = require 'redux-thunk'
# NOTE use global: React, ReactDOM, ReactRedux
createLogger = require 'redux-logger'

log = require '../log'
config = require '../config'
msg = require '../msg'

action = require './action'
reducer = require './reducer'
part = require './part'

# module global var
etc = {
  store: null
  
  tab_id: null
}


init = ->
  logger = createLogger()
  etc.store = Redux.createStore(
    reducer.root
    reducer.init_state
    Redux.applyMiddleware ReduxThunk.default, logger
  )
  
  {
    createClass: cC
    createElement: cE
    createFactory: cF
  } = React
  
  get_tab_id = ->
    etc.tab_id
  
  ReactDOM.render(
    (cE ReactRedux.Provider, {
        store: etc.store
      }, 
      (cE part.App, {
        start_init: gui_main_init
        get_tab_id: get_tab_id
        })
    )
    $('#popup_main_ui')[0]
  )

on_msg = (info) ->
  switch info.type
    when msg.t.popup_refresh
      get_bg_state etc.tab_id
    when msg.t.flush_done
      etc.store.dispatch action.flush(action.FLUSH_DONE)
    else
      log.d "unknow msg, type == #{info.type}"
  return

get_bg_state = (tab_id) ->
  msg.send msg.t.get_state, {
    tab_id: tab_id
  }, (result) ->
    etc.store.dispatch action.set_bg_state(result)

gui_main_init = ->
  log.d 'popup: gui_main_init .. . '
  
  get_current_tab_id = ->
    chrome.tabs.query {
      active: true
      currentWindow: true
    }, (result) ->
      tab_id = result[0].id
      # save tab_id
      etc.tab_id = tab_id
      # DEBUG
      log.d "current tab_id == #{tab_id} "
      get_bg_state tab_id
  get_current_tab_id()


module.exports = {
  init
  on_msg
}
# end gui.coffee

