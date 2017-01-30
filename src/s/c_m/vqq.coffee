# vqq.coffee, parse_v-crx/src/s/c_m/

log = require '../log'
I = require './I'


class m_vqq extends I
  init: ->
    @site = 'vqq'
    # get flash player
    # TODO
    #@_p = window.flash
    
    # DEBUG
    log.c 'c_m/vqq: init done. '
  
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

module.exports = m_vqq
# end vqq.coffee

