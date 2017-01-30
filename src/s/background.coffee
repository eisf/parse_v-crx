# background.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'


# tab (id) of supported sites (enabled tab set)
enable_tab_list = new Map()


# process msg
on_msg = (info) ->
  # FIXME
  log.d "background: got msg, type == #{info.type}, data == #{JSON.stringify info.data} "
  
  switch info.type
    when msg.t.found
      tab_id = info.sender.tab.id
      
      enable_tab tab_id, info.data
  
  # TODO


on_tab_change = (tab_id, info, tab) ->
  # TODO

on_tab_close = (tab_id, info) ->
  disable_tab tab_id

on_navigation = (info) ->
  disable_tab info.tabId


# enable and disable (try to) tab_id
enable_tab = (tab_id, info) ->
  enable_tab_list.set tab_id, info
  
  # show icon
  chrome.pageAction.show tab_id
  # DEBUG
  log.d "background: enable tab, id == #{tab_id}, site == #{info.site} "
  
  # TODO

disable_tab = (tab_id) ->
  if ! enable_tab_list.has tab_id
    return
  
  enable_tab_list.delete tab_id
  # DEBUG
  log.d "background: disable tab, id == #{tab_id}"
  
  # TODO other clean-up
  
  # hide icon, NOTE this maybe error (close tab)
  chrome.pageAction.hide tab_id


bg_init = ->
  msg.on on_msg
  # watch tabs changes
  chrome.tabs.onRemoved.addListener on_tab_close
  chrome.tabs.onUpdated.addListener on_tab_change
  chrome.webNavigation.onCommitted.addListener on_navigation
  
  # TODO

log.d 'background init .. . '
bg_init()
# end background.coffee

