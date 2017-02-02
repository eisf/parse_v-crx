# content.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'
config = require './config'

m271 = require './c_m/271'
m_vqq = require './c_m/vqq'
m_youku = require './c_m/youku'


# check site support: site_id -> check_function
check_list = {
  '271': ->
    try
      window.flash['getQiyiPlayerInfo']()
      return m271
    catch e
      return false
  
  'vqq': ->
    # NOTE require wait 5s before do check
    try
      i = $('object', $('#tenvideo_player')).attr('id')
      window[i]['getFPInfo']()
      return m_vqq
    catch e
      return false
  
  'youku': ->
    # NOTE require wait 5s before do check
    try
      window.movie_player['getPlayerState']()
      return m_youku
    catch e
      return false
}


etc = {
  m_worker: null
}

check_site_support = ->
  for i of check_list
    # DEBUG
    log.c "checking #{i} .. . "
    Worker = check_list[i]()
    if Worker != false
      log.c "[ OK ] yes! this is #{i} ;-) "
      # send msg to background.js
      setTimeout( () ->
        msg.send msg.t.found, {
          site: etc.m_worker.site
          
          # NOTE add URL info, and page title
          url: document.URL
          title: $('title').text()
        }
      , 0)
      
      etc.m_worker = new Worker()
      etc.m_worker.init()
      # start check video playing
      check_playing()
      # found one support
      return true
    #else
    #  log.c " NO, this isn't #{i} :-( "
  return false

# check support
start_check = ->
  count = {
    i: 0
  }
  check_max_s = config.check_init_max_wait_s
  
  _check = ->
    result = check_site_support()
    if result
      log.c "found supported site (page) after #{count.i}s"
    else
      # wait and try again
      count.i += 1
      if count.i > check_max_s
        log.c "give up, check support after #{count.i}s"
      else
        setTimeout _check, 1e3
  log.c 'start check page (site support)'
  setTimeout _check, 0


# check playing
check_playing = ->
  count = {
    i: 0
    # last current-time
    old: null
  }
  count_max = config.check_video_play_count_s
  w = etc.m_worker
  
  _check_play = ->
    now = w.get_time()
    if now != count.old
      count.i += 1
    else
      # pause, reset
      count.i = 0
    count.old = now
    
    if count.i > count_max
      log.c "video is now playing .. . (#{count_max}s)"
      # tell background.js
      msg.send msg.t.playing, w.get_info()
    else
      setTimeout _check_play, 1e3
  log.c 'start check video playing .. . '
  setTimeout _check_play, 0


init_msg = ->
  msg.on (info) ->
    # DEBUG
    log.c "DEBUG: got msg, type == #{info.type}, data == #{JSON.stringify info.data} "
    
    switch info.type
      when msg.t.check_support
        log.c 'check_support, again'
        
        start_check()
      when msg.t.get_info
        info.callback etc.m_worker.get_info()
      when msg.t.set_time
        setTimeout( () ->
          s = info.data.time_s
          log.c "set_time, s == #{s} "
          
          etc.m_worker.set_time s
          if info.data.pause
            etc.m_worker.pause()
        , 0)
      else
        log.c "FIXME: unknow msg, type == #{info.type} "
    return


content_init = ->
  init_msg()
  start_check()

content_init()
# end content.coffee

