# 271.coffee, parse_v-crx/src/s/b_e/

url = require 'url'

log = require '../log'
config = require '../config'
early_catch = require '../bg/early_catch'
I = require './I'


class m271 extends I
  
  init: ->
    @_raw_url = {
      vms: null
      # raw file URLs
      file: {}
    }
    # vms JSON info
    @_vms = null
    # current video size, eg: `1280x720`
    @_video_size = null
  
  set_info: (info) ->
    super info
    @_video_size = info.size
    # FIXME
    log.d "b_e/271: set_info(), @_video_size == #{@_video_size}"
  
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
  
  # try to get _vms with early_catch
  _try_get_vms: ->
    vms_url = early_catch.get @_tab_id, 'vms'
    if vms_url != null
      $.getJSON vms_url, (data) =>
        @_set_vms data
  _set_vms: (info) ->
    @_vms = info
    # DEBUG
    log.d 'b_e/271: _set_vms()'
  
  # get clip info by current size
  _get_by_current_size: ->
    if (@_vms is null) or (@_video_size is null)
      return null
    
    list = @_vms.data.vp.tkl[0].vs
    for i in list
      if i.scrsz is @_video_size
        return i
    # TODO error process
    return null
  
  # `get_info()` with early_catch
  get_info: ->
    # check _vms
    if (@_vms is null) or (@_video_size is null)
      @_try_get_vms()
      return @_old_get_info()
    # FIXME TODO
    return @_old_get_info()
    
    # DEBUG
    log.d 'b_e/271: get_info(): with @_vms !'
    
    vms = @_vms
    o = {
      
      # TODO
    }
    
    # TODO
    return vms
  
  flush: (set_time, done) ->
    if (@_vms is null) or (@_video_size is null)
      super set_time, done
    else
      # DEBUG
      log.d 'b_e/271: flush with @_vms ! '
      
      i = @_get_by_current_size()
      wait_s = config.flush_wait_s
      
      get_flush_time_s = (index) ->
        {s, d} = i.fs[index]
        # random time
        time = s + Math.random() * d
        return (time / 1e3)
      
      count = {
        i: 0
      }
      i_max = i.fs.length
      
      start_flush = ->
        if count.i < i_max
          t = get_flush_time_s(count.i)
          count.i += 1
          # DEBUG
          log.d "b_e/271: flush: [#{count.i}] time_s == #{t}"
          
          setTimeout start_flush, wait_s * 1e3
          # FIXME try setTimeout first
          log.d "FIXME: b_e/271: after setTimeout, #{wait_s}"
          
          set_time t
        else
          # FIXME
          log.d "FIXME: b_e/271: flush done, i_max == #{i_max}, index = #{count.i}"
          
          done()
      
      start_flush()
      # TODO advanced reflect-based flush method
  
  # NOTE `get_info()` without early_catch
  _old_get_info: ->
    #o = super.get_info()
    o = m271.__super__.get_info.call this
    
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

