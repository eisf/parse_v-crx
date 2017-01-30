# 271.coffee, parse_v-crx/src/s/b_e/

url = require 'url'

log = require '../log'
I = require './I'

class m271 extends I
  
  init: ->
    @_raw_url = {
      vms: null
      # raw file URLs
      file: {}
    }
  
  on_request: (info) ->
    i = url.parse info.url, true
    
    switch i.host
      when 'cache.video.qiyi.com'
        # check vms URL
        if i.pathname is '/vms'
          @_raw_url.vms = info.url
          # DEBUG
          log.d "b_e/271: got vms URL #{info.url}"
      when 'data.video.qiyi.com'
        # check video URL
        if i.pathname.startsWith('/videos/v') and (i.query.qd_stert != null)
          @_raw_url.file[i.query.qd_stert] = info.url
          # DEBUG
          log.d "b_e/271: got one video URL #{info.url}"
  
  get_info: ->
    o = super()
    if ! o.playing
      return o
    # DEBUG
    if @_raw_url.vms != null
      o._vms = @_raw_url.vms
    
    count = 1
    f = o.video[o.size].file
    # sort time
    k = Object.keys(@_raw_url.file).sort((a, b) => (a - b))
    for i in k
      time_s = i / 1e3
      f.push {
        time_s: time_s
        before: @_raw_url.file[i]
        
        filename: @_make_filename count, k.length, time_s
      }
      count += 1
    return o
  
  get_url: (raw) ->
    raw_url = raw.before
    
    return new Promise (resolve, reject) ->
      $.getJSON raw_url, (data) ->
        raw.url = data.l
        resolve raw
    # TODO error process
  
  _make_filename: (i, i_max, time_s) ->
    return super(i, i_max, time_s) + '.flv'


module.exports = m271
# end 271.coffee

