# 271.coffee, parse_v-crx/src/s/c_m/

log = require '../log'
I = require './I'


class m271 extends I
  init: ->
    @site = '271'
    # get flash player
    @_p = window.flash
    
    # DEBUG
    log.c 'c_m/271: init done. '
  
  get_info: ->
    o = super()
    
    vi = @_video_info()
    pi = @_player_info()
    
    o.title_video = vi.vn
    o.title_sub = vi.subt
    o.size = "#{pi.width}x#{pi.height}"
    o.max_time_s = (pi.totalDuration / 1e3)
    return o
  
  get_time: ->
    pi = @_player_info()
    (pi.currentTime / 1e3)
  
  set_time: (time_s) ->
    @_player_seek time_s
  
  pause: ->
    @_player_pause()
  
  # call flash player
  _video_info: ->
    JSON.parse @_p['getQiyiVideoInfo']()
  _player_info: ->
    JSON.parse @_p['getQiyiPlayerInfo']()
  _player_log: ->
    @_p['getQiyiPlayerLog']()
  _player_seek: (time_s) ->
    @_p['seekQiyiVideo'](time_s)
  _player_pause: ->
    @_p['pauseQiyiVideo']()

module.exports = m271
# end 271.coffee

