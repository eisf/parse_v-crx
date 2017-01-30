# popup.coffee, parse_v-crx/src/s/

log = require './log'
msg = require './msg'


get_current_tab_id = ->
  chrome.tabs.query {
    active: true
    currentWindow: true
  }, (result) ->
    tab_id = result[0].id
    get_current_state tab_id

get_current_state = (tab_id) ->
  # DEBUG
  log.d "current tab_id == #{tab_id} "
  
  msg.send msg.t.get_state, {
    tab_id: tab_id
  }, (result) ->
    draw_ui result, tab_id

draw_ui = (info, tab_id) ->
  # DEBUG
  log.d "current state == #{JSON.stringify info} "
  
  # hide init text
  $('#main_init_place_holder').remove()
  div = $('#popup_main_ui')
  
  # add retry button
  b = $('<button type="button" >重新检测</button>')
  div.append b
  b.on 'click', ->
    # send check_support msg
    msg.send_to_content msg.t.check_support, null, null, tab_id
    log.d 'popup: send check_support msg to content.js '
  
  # check null info
  if info is null
    return div.append $('<p>错误: 不支持此页面 :-( </p>')
  
  # page info
  div.append $('<h2>当前页面</h2>')
  
  p = $('<p></p>')
  p.text "site: #{info.site}"
  div.append p
  p = $('<p></p>')
  p.text "标题: #{info.title}"
  div.append p
  p = $('<p></p>')
  p.text "URL: #{info.url}"
  div.append p
  
  # check playing
  if ! info.playing
    div.append $('<hr />')
    div.append $('<p>请等待视频开始正常播放 .. . </p>')
  else
    # video info
    div.append $('<h2>视频信息</h2>')
    
    p = $('<p></p>')
    p.text "视频标题: #{info.title_video}_#{info.title_sub}"
    div.append p
    
    p = $('<p></p>')
    p.text "清晰度: #{info.size}"
    div.append p
    
    p = $('<p></p>')
    p.text "总时长: #{info.max_time_s} 秒"
    div.append p
    
    # add start button
    b = $('<button type="button" >开始</button>')
    div.append b
    b.on 'click', ->
      start_flush tab_id, div

start_flush = (tab_id, div) ->
  # init msg
  msg.on (info) ->
    switch info.type
      when msg.t.flush_done
        div.append $('<hr /><p>获取分段文件, 结束. </p>')
        b = $('<button type="button" >更多</button>')
        div.append b
        b.on 'click', ->
          log.d 'open (more) window '
          
          window.open 'dl.html', '_blank'
      else
        # TODO
  # send start_flush msg
  msg.send msg.t.start_flush, {
    tab_id: tab_id
  }


# TODO update state while popup page is open
# TODO make a better GUI with react
popup_init = ->
  log.d 'popup.js: start init '
  
  get_current_tab_id()

popup_init()
# end popup.coffee

