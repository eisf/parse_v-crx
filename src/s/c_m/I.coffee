# I.coffee, parse_v-crx/src/s/c_m/
# c_m: content module

class I
  constructor: ->
    @site = '#unknow'
    return
  
  init: ->
    return
  
  get_info: ->
    {
      site: @site
      url: document.URL
      title: $('title').text()
      
      title_video: '#video_title'
      title_sub: '#sub_title'
      
      # video size (px) or quality
      size: '#unknow_size'
      # max value of video time_s
      max_time_s: '#unknow_max_time_s'
    }
  
  set_time: (time_s) ->
    return
  
  get_time: ->
    return -1
  
  pause: ->
    return

module.exports = I
# end I.coffee

