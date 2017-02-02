# background.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'
config = require './config'

hook = require './bg/hook'
early_catch = require './bg/early_catch'

m271 = require './b_e/271'



# tab (id) of supported sites (enabled tab set)
enable_tab_list = new Map()


# process msg
on_msg = (info) ->
  # DEBUG
  log.d "background: got msg, type == #{info.type}, data == #{JSON.stringify info.data} "
  
  switch info.type
    when msg.t.found
      tab_id = info.sender.tab.id
      
      enable_tab tab_id, info.data
    when msg.t.playing
      tab_id = info.sender.tab.id
      
      enable_tab_list.get(tab_id).set_info info.data
      
      # refresh popup after 1s
      setTimeout( () ->
        msg.send msg.t.popup_refresh, null
        log.d "background: request popup to refresh "
      , 1e3)
    when msg.t.get_state
      tab_id = info.data.tab_id
      if ! enable_tab_list.has tab_id
        return info.callback null
      result = enable_tab_list.get(tab_id).get_info()
      info.callback result
    when msg.t.start_flush
      start_flush info.data.tab_id
      # NOTE async callback
      return true
    when msg.t.get_all
      result = {}
      for i from enable_tab_list.keys()
        try
          w = enable_tab_list.get i
          result[i] = w.get_info()
      info.callback result
    when msg.t.get_one_file
      {tab_id, raw} = info.data
      # NOTE fix a BUG here: tab_id is int type
      tab_id = Number.parseInt tab_id
      if ! enable_tab_list.has tab_id
        # DEBUG
        log.d "background: get_one_file: no tab_id == #{tab_id}"
        return info.callback null
      w = enable_tab_list.get tab_id
      # NOTE .get_url() return a Promise
      w.get_url(raw).then( (result) ->
        log.d "FIXME: background: get_one_file: result = #{JSON.stringify result}"
        
        info.callback result
      )
      # TODO error process
      
      # NOTE async callback
      return true
    else
      log.d "background: unknow msg: type == #{info.type} "
  return


on_tab_change = (tab_id, info, tab) ->
  # TODO

on_tab_close = (tab_id, info) ->
  return
  # FIXME NOTE now keep data after tab close
  log.d "background: disable_tab: tab_close: tab_id == #{tab_id} "
  
  disable_tab tab_id

on_navigation = (info) ->
  tab_id = info.tabId
  if ! enable_tab_list.has tab_id
    return
  frame_id = info.frameId
  if frame_id != 0
    return  # ignore sub frame navigation
  # check URL changed
  new_url = info.url
  old_url = enable_tab_list.get(tab_id).url
  
  log.d "navigation: old_url == #{old_url}, new_url == #{new_url}"
  if old_url is new_url
    log.d "background: navigation with same URL, tab_id == #{tab_id}, URL == #{old_url}"
  else
    disable_tab tab_id


# enable and disable (try to) tab_id
enable_tab = (tab_id, info) ->
  enable_tab_list.set tab_id, info
  
  # show icon
  chrome.pageAction.show tab_id
  # DEBUG
  log.d "background: enable tab, id == #{tab_id}, site == #{info.site} "
  
  # create worker
  switch info.site
    when '271'
      w = new m271(info, tab_id)
      w.init()
      enable_tab_list.set tab_id, w
    else
      # TODO

disable_tab = (tab_id) ->
  if ! enable_tab_list.has tab_id
    return
  # try to check support again
  msg.send_to_content msg.t.check_support, null, null, tab_id
  
  worker = enable_tab_list.get tab_id
  enable_tab_list.delete tab_id
  # DEBUG
  log.d "background: disable tab, id == #{tab_id}"
  
  # FIXME this cleanup maybe not executed
  worker.cleanup?()
  # hide icon, NOTE this maybe error (close tab)
  chrome.pageAction.hide tab_id


# flash video clip files
start_flush = (tab_id) ->
  if ! enable_tab_list.has tab_id
    return
  w = enable_tab_list.get tab_id
  
  set_time = (time_s) ->
    msg.send_to_content msg.t.set_time, {
      time_s: time_s
      pause: true
    }, null, tab_id
  done = ->
    log.d "background: flush done. "
    msg.send msg.t.flush_done, null
  
  log.d "background: start flush, tab_id == #{tab_id} "
  # use worker's own time flush method
  w.flush set_time, done


# record http request
on_request = (info) ->
  o = {
    req_id: info.requestId
    url: info.url
    method: info.method
    tab_id: info.tabId
    header: info.requestHeaders
  }
  # DEBUG
  #log.d "background: http request, info == #{JSON.stringify o}"
  early_catch.on_req o
  
  # feed request to m_worker
  if enable_tab_list.has o.tab_id
    w = enable_tab_list.get o.tab_id
    w.on_request o

# check and change request URL
on_hook = (info) ->
  o = {
    req_id: info.requestId
    url: info.url
    method: info.method
    tab_id: info.tabId
    
    # TODO add more info
  }
  
  hook.check_vms o
  # FIXME TODO


bg_init = ->
  log.d 'background init .. . '
  
  msg.on on_msg
  # watch tabs changes
  chrome.tabs.onRemoved.addListener on_tab_close
  chrome.tabs.onUpdated.addListener on_tab_change
  chrome.webNavigation.onCommitted.addListener on_navigation
  
  chrome.webRequest.onSendHeaders.addListener on_request, {
    urls: ['<all_urls>']
  }
  # modify headers or URLs
  # NOTE `blocking` here
  chrome.webRequest.onBeforeRequest.addListener on_hook, {
    urls: ['<all_urls>']
  }, ['blocking']

bg_init()
# end background.coffee

