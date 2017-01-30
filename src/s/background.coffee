# background.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'
config = require './config'

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
    when msg.t.get_state
      tab_id = info.data.tab_id
      if ! enable_tab_list.has tab_id
        return info.callback null
      result = enable_tab_list.get(tab_id).get_info()
      info.callback result
    when msg.t.start_flush
      start_flush info.data.tab_id
    else
      # TODO
      log.d "background: unknow msg: type == #{info.type} "


on_tab_change = (tab_id, info, tab) ->
  # TODO

on_tab_close = (tab_id, info) ->
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
      enable_tab_list.set tab_id, new m271(info)
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
  
  worker.cleanup?()
  # hide icon, NOTE this maybe error (close tab)
  chrome.pageAction.hide tab_id


# flash video clip files
start_flush = (tab_id) ->
  if ! enable_tab_list.has tab_id
    return
  w = enable_tab_list.get tab_id
  
  delta = config.flush_delta_s
  reserve = config.flush_reserve_s
  max_s = w.get_info().max_time_s
  
  log.d "background: start flush, tab_id == #{tab_id} "
  
  # TODO better flush method
  for i in [0..(max_s - reserve)] by delta
    msg.send_to_content msg.t.set_time, {
      time_s: i
      pause: true
    }, null, tab_id
  
  log.d "background: flush done. "
  
  msg.send msg.t.flush_done, null


bg_init = ->
  msg.on on_msg
  # watch tabs changes
  chrome.tabs.onRemoved.addListener on_tab_close
  chrome.tabs.onUpdated.addListener on_tab_change
  chrome.webNavigation.onCommitted.addListener on_navigation

log.d 'background init .. . '
bg_init()
# end background.coffee

