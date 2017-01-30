# content.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'
config = require './config'


# check site support: site_id -> check_function
check_list = {
  '271': ->
    try
      window.flash['getQiyiPlayerInfo']()
      return true
    catch e
      return false
  
  'vqq': ->
    # NOTE require wait 5s before do check
    try
      i = $('object', $('#tenvideo_player')).attr('id')
      window[i]['getFPInfo']()
      return true
    catch e
      return false
  
  'youku': ->
    # NOTE require wait 5s before do check
    try
      window.movie_player['getPlayerState']()
      return true
    catch e
      return false
  
  # TODO
}


check_site_support = ->
  for i of check_list
    # DEBUG
    log.c "checking #{i} .. . "
    is_support = check_list[i]()
    if is_support
      log.c "[ OK ] yes! this is #{i} ;-) "
      # FIXME send msg
      msg.send msg.t.found, {
        site: i
      }
    else
      log.c " NO, this isn't #{i} :-( "
  # TODO


# DEBUG
log.c "wait #{config.before_check_wait_s}s before check supported sites .. . "
setTimeout check_site_support, config.before_check_wait_s * 1e3


# TODO
init_msg = ->
  msg.on (info) ->
    # DEBUG
    log.c "DEBUG: got msg, type == #{info.type}, data == #{JSON.stringify info.data} "
    
    # TODO

# TODO content_init
init_msg()

# end content.coffee

