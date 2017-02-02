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
  
  create_get_addr_ui div, one, tab_id
  create_dl_ui div, one, tab_id

create_dl_ui = (div, info, tab_id) ->
  # simple title
  div.append $('<h3>简单下载功能</h3>')
  # download button
  b = $('<button type="button" >下载全部分段</button>')
  div.append b
  # pre: log text area
  pre = $('<pre></pre>')
  div.append pre
  
  ll = (text) ->
    # local log
    pre.text pre.text() + ':: ' + text + '\n'
  
  # TODO config
  dl_dir_prefix = 'parse_v-crx-dl'
  
  f = info.video[info.size].file
  count = {
    # current file index
    i: 0
  }
  i_max = f.length
  
  b.on 'click', ->
    ll "开始下载共 #{i_max} 个文件 .. . "
    
    start_download()
  
  start_download = ->
    # check current index
    if count.i >= i_max
      return ll "所有文件下载完毕 ! "
    ll "下载第 #{count.i + 1} 个文件 "
    
    get_one_final_url tab_id, f[count.i]
  
  get_one_final_url = (tab_id, raw) ->
    msg.send msg.t.get_one_file, {
      tab_id: tab_id
      raw: raw
    }, (result) ->
      # FIXME
      log.d "FIXME: dl: get_one_final_url: result = #{JSON.stringify result}"
      
      # FIXME TODO
      file_path = dl_dir_prefix + '/' + raw.filename
      download_one_file result.url, file_path
  
  download_one_file = (file_url, file_path) ->
    # chrome download API
    chrome.downloads.download {
      url: file_url
      filename: file_path
      conflictAction: 'uniquify'
    }, (download_id) ->
      ll "文件 #{file_path} 已开始下载, 等待下载完成 .. . "
      # DEBUG
      log.d "download start: id == #{info.id}, file_path = #{file_path}, url == #{file_url} "
      
      # TODO remove listeners
      chrome.downloads.onChanged.addListener (info) ->
        if info.id is download_id
          # DEBUG
          log.d "download changed: id == #{info.id}, state == #{JSON.stringify info.state} "
          if info.state? and (info.state.current is 'complete')
            ll "[ OK ] 文件 #{file_path} 下载完成 ! "
            
            download_next()
  
  download_next = ->
    count.i += 1
    start_download()

create_get_addr_ui = (div, info, tab_id) ->
  # get_addr button
  b = $('<button type="button" >获取全部文件下载地址</button>')
  div.append b
  # textarea: result
  t = $('<textarea></textarea>')
  d = $('<div></div>')
  d.append t
  div.append d
  
  f = info.video[info.size].file
  count = {
    # current file index
    i: 0
    first_result: true
  }
  i_max = f.length
  
  b.on 'click', ->
    t.text '正在获取 .. . '
    start_get()
  
  start_get = ->
    # check current index
    if count.i < i_max
      get_one_final_url tab_id, f[count.i]
  
  get_one_final_url = (tab_id, raw) ->
    msg.send msg.t.get_one_file, {
      tab_id: tab_id
      raw: raw
    }, (result) ->
      log.d "dl: get_one_final_url: result = #{JSON.stringify result}"
      # add result
      if count.first_result
        count.first_result = false
        t.text ''
      t.text "#{t.text()}#{result.url}\n"
      get_next()
  
  get_next = ->
    count.i += 1
    start_get()


dl_init = ->
  log.d 'dl: init '
  
  get_all_info()

dl_init()
# end dl.coffee

