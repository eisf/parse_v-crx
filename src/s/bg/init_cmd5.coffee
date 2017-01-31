# init_cmd5.coffee, parse_v-crx/src/s/bg/

# init cmd5 (swf_core)
init_cmd5 = ->
  console.log 'init_cmd5: start init '
  
  cmd5['set_callback'] 'init_cmd5_core_loaded'
  cmd5['load_core']()

# FIX wrapper
window.init_cmd5_core_loaded = (event_type, data) ->
  console.log "init_cmd5: DEBUG: #{event_type} => #{data}"

window.cmd5_calc = (raw) ->
  cmd5['xcalc'] raw

# wait 5s before init
setTimeout init_cmd5, 5 * 1e3

# for DEBUG
window.cmd5_about = ->
  info = JSON.parse cmd5['about']()
  # DEBUG print
  console.log JSON.stringify(info, '', '    ')

# end init_cmd5.coffee

