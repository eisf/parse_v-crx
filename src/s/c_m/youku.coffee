# youku.coffee, parse_v-crx/src/s/c_m/

log = require '../log'
I = require './I'


class m_youku extends I
  init: ->
    @site = 'youku'
    # get flash player
    # TODO
    #@_p = window.flash
    
    # DEBUG
    log.c 'c_m/youku: init done. '
  
  get_info: ->
    o = super()
    
    # TODO
    return o
  
  get_time: ->
    # TODO
  
  set_time: (time_s) ->
    # TODO
  
  pause: ->
    # TODO
  
  # call flash player
  # TODO

module.exports = m_youku
# end youku.coffee

