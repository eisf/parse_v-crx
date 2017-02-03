# I.coffee, parse_v-crx/src/s/b_e/
# b_e: background extractor

config = require '../config'


class I
  constructor: (raw, tab_id) ->
    @url = raw.url
    @site = raw.site
    
    @_title = raw.title
    
    @_info = null
    @_tab_id = tab_id
    return
  
  init: ->
    return
  
  set_info: (info) ->
    @_info = info
    return
  
  on_request: (info) ->
    return
  
  cleanup: ->
    return
  
  get_info: ->
    if @_info is null
      return {
        site: @site
        url: @url
        title: @_title
        
        # video play status
        playing: false
        flush_done: false
      }
    o = {
      playing: true
      flush_done: false
      
      # from @_info
      site: @_info.site
      url: @_info.url
      title: @_info.title
      
      title_video: @_info.title_video
      title_sub: @_info.title_sub
      size: @_info.size
      max_time_s: @_info.max_time_s
      
      video: {}
    }
    o.video[@_info.size] = {
      size: @_info.size
      file: []
    }
    return o
  
  # get download url of one file
  get_url: (raw) ->
    raw
  
  # make one filename for download
  _make_filename: (i, i_max, time_s) ->
    m = Math.round(time_s / 60)
    main = "#{@_info.title_video}_#{@_info.title_sub}_#{@_info.size}_#{@_info.site}_.part.#{m}min.#{i}.of.#{i_max}"
    return main.split(' ').join('-')
  
  # default (clip) time flush method
  flush: (set_time, done) ->
    delta = config.flush_delta_s
    reserve = config.flush_reserve_s
    max_s = @_info.max_time_s

    for i in [0..(max_s - reserve)] by delta
      set_time i
    # flush done
    done()


module.exports = I
# end I.coffee

