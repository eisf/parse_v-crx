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
    # flag: flush_done
    @_flush_done = false
  
  set_info: (info) ->
    super info
    @_video_size = info.size
  
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
  
  _get_info_file_with_vms: ->
    r = @_get_by_current_size()
    
    get_key_from_raw_url = (raw) ->
      raw.split('?')[0].split('/').pop().split('.')[0]
    # build index from known got urls
    s = {}
    for i in Object.values(@_raw_url.file)
      s[get_key_from_raw_url(i)] = i
    # make output
    o = []
    for i in [0..(r.fs.length - 1)]
      f = r.fs[i]
      time_s = f.s / 1e3
      
      k = get_key_from_raw_url f.l
      if s[k]?
        before = s[k]
      else
        before = '<unknow_before_url>'
      o.push {
        time_s: time_s
        before: before
        filename: @_make_filename (i + 1), r.fs.length, time_s
      }
    return o
  
  # `get_info()` with early_catch
  get_info: ->
    # check _vms
    if (@_info is null) or (@_vms is null) or (@_video_size is null)
      @_try_get_vms()
      return @_old_get_info()
    # DEBUG
    log.d 'b_e/271: get_info(): with @_vms !'
    
    o = {
      playing: true
      flush_done: @_flush_done
      site: @_info.site
      url: @_info.url
      title: @_info.title
      max_time_s: @_info.max_time_s
      
      title_video: @_vms.data.vi.vn
      title_sub: @_vms.data.vi.subt
      size: @_video_size
      
      video: {}
    }
    o.video[o.size] = {
      size: @_video_size
      file: @_get_info_file_with_vms()
    }
    return o
  
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
        # NOTE improve random time
        rd = config.auto_flush_reserve_s
        # random time (except time_s before and after)
        time = s + rd * 1e3 + Math.random() * (d - rd * 1e3)
        return (time / 1e3)
      
      count = {
        i: 0
      }
      i_max = i.fs.length
      
      # FIXME
      that = this
      start_flush = ->
        if count.i < i_max
          t = get_flush_time_s(count.i)
          count.i += 1
          # DEBUG
          log.d "b_e/271: flush: [#{count.i}] time_s == #{t}"
          
          setTimeout start_flush, wait_s * 1e3
          set_time t
        else
          that._flush_done = true
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
    o.flush_done = @_flush_done
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

