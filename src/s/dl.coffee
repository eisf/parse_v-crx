# dl.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'


get_all_info = ->
  msg.send msg.t.get_all, null, (info) ->
    # DEBUG
    log.d "dl: get_all: result = #{JSON.stringify info}"
    render_page info

render_page = (info) ->
  if info is null
    return
  # remove place holder
  $('#main_place_holder').remove()
  div = $('#dl_main_ui')
  
  for i, v of info
    render_one_tab i, v, div

render_one_tab = (tab_id, one, host) ->
  div = $("<div id=\"tab_id_#{tab_id}\" ></div>")
  host.append div
  
  h = $('<h2></h2>')
  h.text "id #{tab_id} : #{one.title}"
  div.append h
  p = $('<p></p>')
  p.text "[#{one.site}] #{one.url}"
  div.append p
  
  h = $('<h3></h3>')
  h.text "视频: #{one.title_video}_#{one.title_sub} [ #{one.size} ] 时长 #{Math.round(one.max_time_s / 60)} 分钟 (#{one.max_time_s} 秒) "
  div.append h
  
  # render file list
  f = one.video[one.size].file
  
  p = $('<p></p>')
  p.text "文件列表 (共 #{f.length} 个分段)"
  div.append p
  
  ol = $('<ol></ol>')
  div.append ol
  
  for i in f
    li = $('<li></li>')
    ol.append(li)
    
    {time_s, before, filename} = i
    p = $('<p></p>')
    p.text "[ #{Math.round(time_s / 60)} 分钟 (#{time_s} 秒) ] #{filename}"
    li.append p
    
    a = $('<a></a>')
    a.text before
    a.attr 'href', before
    li.append a
  
  # TODO


dl_init = ->
  log.d 'dl: init '
  
  get_all_info()

dl_init()
# end dl.coffee

