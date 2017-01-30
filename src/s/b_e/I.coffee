# I.coffee, parse_v-crx/src/s/b_e/
# b_e: background extractor

class I
  constructor: (raw) ->
    @url = raw.url
    @site = raw.site
    
    @_title = raw.title
    
    @_info = null
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
      }
    {
      playing: true
      
      # from @_info
      site: @_info.site
      url: @_info.url
      title: @_info.title
      
      title_video: @_info.title_video
      title_sub: @_info.title_sub
      size: @_info.size
      max_time_s: @_info.max_time_s
      
      # TODO
    }
  
  # get download url of one file
  get_url: (raw) ->
    {}

module.exports = I
# end I.coffee

