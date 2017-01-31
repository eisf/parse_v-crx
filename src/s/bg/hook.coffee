# hook.coffee, parse_v-crx/src/s/bg/

url = require 'url'

log = require '../log'


# replace all text
replace = (raw, rm, to) ->
  raw.split(rm).join(to)

# FIXME TODO
check_vms = (info) ->
  i = url.parse info.url, true
  if (i.host is 'cache.video.qiyi.com') and (i.pathname is '/vms')
    return change_vms info
  return null

change_vms = (info) ->
  # DEBUG
  log.d "bg/hook: DEBUG: got vms URL #{info.url}"
  i = url.parse info.url
  # remove &vf=
  raw = i.path.split('&vf=')[0]
  
  # change raw url
  new_part = replace raw, '&um=0&', '&um=1&'
  # NOTE use cmd5
  new_url = 'http://' + i.host + cmd5_calc(new_part)
  # DEBUG
  log.d "bg/hook: DEBUG: new vms URL #{new_url}"
  
  # redirect
  return {
    redirectUrl: new_url
  }


# TODO

module.exports = {
  
  check_vms: check_vms
}
# end hook.coffee

