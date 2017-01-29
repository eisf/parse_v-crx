# content.coffee, parse_v-crx/src/s/


log = (text) ->
  console.log 'parse_v-crx: content script: ' + text


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
    log "checking #{i} .. . "
    is_support = check_list[i]()
    if is_support
      log "[ OK ] yes! this is #{i} ;-) "
    else
      log " NO, this isn't #{i} :-( "
  # TODO


_before_check_wait_s = 5
# DEBUG
log "wait #{_before_check_wait_s}s before check supported sites .. . "
# FIXME
setTimeout check_site_support, _before_check_wait_s * 1e3


# end content.coffee

