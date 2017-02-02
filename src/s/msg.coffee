# msg.coffee, parse_v-crx/src/s

# msg mark
parse_v_mark = 'uuid=ec9680e6-da5e-4971-ac5f-25d971bf6366'
msg_version = '0.1.0-1'


# msg types

# send: content.js -> background.js
# content find a supported site
msg_type_found = 'content_found'
# send: content.js -> background.js
# content video is now playing
msg_type_playing = 'content_playing'

# send: background.js -> content.js (with callback)
# get video info from content
msg_type_get_info = 'content_get_info'
# send background.js -> content.js
# check supported site (reserved)
msg_type_check_support = 'content_check_support'
# send background.js -> content.js
# set video play time (current position)
msg_type_set_time = 'content_set_time'

# send popup.js -> background.js (with callback)
# get current tab info
msg_type_get_state = 'popup_get_state'
# send popup.js -> background.js
# start flush video files
msg_type_start_flush = 'popup_start_flush'

# send background.js -> popup.js
# flush done
msg_type_flush_done = 'popup_flush_done'
# refresh page
msg_type_popup_refresh = 'popup_refresh'

# send dl.js -> background.js (with callback)
# get all tab (page) info
msg_type_get_all = 'dl_get_all'
# send dl.js -> background.js (with callback)
# get one file url
msg_type_get_one_file = 'dl_get_one_file'


# set listener for chrome.runtime.onMessage
set_on_msg = (callback) ->
  chrome.runtime.onMessage.addListener (msg, sender, send_res) ->
    # check msg
    try
      if !((msg.mark is parse_v_mark) and (msg.version is msg_version))
        return
    catch e
      # ignore this msg
      return
    # NOTE async callback should return true
    callback {
      mark: msg.mark
      version: msg.version
      
      type: msg.type
      data: msg.data
      
      sender: sender
      callback: send_res
    }

send_msg = (msg_type, data, callback) ->
  msg = {
    mark: parse_v_mark
    version: msg_version
    
    type: msg_type
    data: data
  }
  chrome.runtime.sendMessage null, msg, callback

# send msg to content script
send_to_content = (msg_type, data, callback, tab_id) ->
  msg = {
    mark: parse_v_mark
    version: msg_version
    
    type: msg_type
    data: data
  }
  # FIXME
  chrome.tabs.sendMessage tab_id, msg, callback


module.exports = {
  mark: parse_v_mark
  version: msg_version
  
  # msg types
  t: {
    # content.js -> background.js
    found: msg_type_found
    playing: msg_type_playing
    
    # background.js -> content.js
    get_info: msg_type_get_info # with callback
    check_support: msg_type_check_support
    set_time: msg_type_set_time
    
    # popup.js -> background.js
    get_state: msg_type_get_state # with callback
    start_flush: msg_type_start_flush
    
    # background.js -> popup.js
    flush_done: msg_type_flush_done
    popup_refresh: msg_type_popup_refresh
    
    # dl.js -> background.js
    get_all: msg_type_get_all # with callback
    get_one_file: msg_type_get_one_file # with callback
  }
  
  on: set_on_msg
  send: send_msg
  send_to_content: send_to_content
}
# end msg.coffee

