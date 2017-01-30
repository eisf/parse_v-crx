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
msg_type_check_supported = 'content_check_supported'

# send background.js -> content.js
# set video play time (current position)
msg_type_set_time = 'content_set_time'


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
  chrome.tabs.sendMessage tab_id, msg, null, callback


module.exports = {
  mark: parse_v_mark
  version: msg_version
  
  # msg types
  t: {
    found: msg_type_found
    playing: msg_type_playing
    get_info: msg_type_get_info
    check_supported: msg_type_check_supported
    set_time: msg_type_set_time
  }
  
  on: set_on_msg
  send: send_msg
  send_to_content: send_to_content
}
# end msg.coffee

