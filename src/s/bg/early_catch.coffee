# early_catch.coffee, parse_v-crx/src/s/bg/

url = require 'url'

log = require '../log'


catch_info = new Map()

on_req = (info) ->
  if catch_info.has info.tab_id
    o = catch_info.get info.tab_id
  else
    o = new Map()
  
  i = url.parse info.url, true
  # check vms
  switch i.host
    when 'cache.video.qiyi.com'
      if i.pathname is '/vms'
        o.set 'vms', info.url
        # DEBUG
        log.d "bg/early_catch: got vms #{info.url}"
  # else: ignore
  catch_info.set info.tab_id, o

get_info = (tab_id, key) ->
  if ! catch_info.has tab_id
    return null
  o = catch_info.get tab_id
  if ! o.has key
    return null
  return o.get key


module.exports = {
  on_req: on_req
  get: get_info
}
# end early_catch.coffee

