# popup.coffee, parse_v-crx/src/s/
log = require './log'
msg = require './msg'
gui = require './p_popup/gui'

popup_init = ->
  log.d 'popup.js: start init '
  
  msg.on gui.on_msg
  gui.init()

popup_init()
# end popup.coffee

