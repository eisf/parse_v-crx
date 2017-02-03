# part.coffee, parse_v-crx/src/s/p_popup/

Immutable = require 'immutable'
Redux = require 'redux'
# NOTE use global: React, ReactRedux, ReactBootstrap

util = require '../bg/util'

action = require './action'


{
  createClass: cC
  createElement: cE
  createFactory: cF
} = React


PageInfo = cC {
  displayName: 'PageInfo'
  
  _re_check: ->
    @props.action.page_re_check @props.tab_id
  
  render: ->
    {
      div
      h2
      tbody
      tr
      td
      strong
    } = React.DOM
    {
      Button
      Table
      Alert
    } = ReactBootstrap
    
    info = @props.bg_state
    
    (div null, 
      (h2 {
          className: 'page-header'
        }, 
        '当前页面'
        (cE Button, {
            className: 'pull-right'
            onClick: @_re_check
          }, '重新检测')
      )
      if info is null
        (cE Alert, {
            bsStyle: 'warning'
          }, 
          (strong null, '错误: ')
          '不支持此页面 :-( '
        )
      else
        (cE Table, {
          
          }, 
          (tbody null, 
            (tr null, 
              (td null, 'site')
              (td null, info.site)
            )
            (tr null, 
              (td null, '标题')
              (td null, info.title)
            )
            (tr null, 
              (td null, 'URL')
              (td null, info.url)
            )
          )
        )
    )
}

VideoInfo = cC {
  displayName: 'VideoInfo'
  
  render: ->
    {
      div
      h2
      tbody
      tr
      td
    } = React.DOM
    {
      Table
    } = ReactBootstrap
    
    info = @props.bg_state
    
    (div null, 
      (h2 {
          className: 'page-header'
        }, 
        '视频信息'
      )
      
      (cE Table, {
        
        }, 
        (tbody null, 
          (tr null, 
            (td null, '视频标题')
            (td null, "#{info.title_video}_#{info.title_sub}")
          )
          (tr null, 
            (td null, '清晰度')
            (td null, info.size)
          )
          (tr null, 
            (td null, '总时长')
            (td null, "#{util.second_to_time info.max_time_s} (#{info.max_time_s} 秒)")
          )
        )
      )
    )
}

Control = cC {
  displayName: 'Control'
  
  _start: ->
    @props.action.page_start @props.tab_id
  
  _more: ->
    @props.action.page_more()
  
  render: ->
    {
      div
    } = React.DOM
    {
      Button
      Alert
    } = ReactBootstrap
    
    info = @props.bg_state
    if @props.flush_doing
      (cE Alert, {
        }, 
        '正在获取分段信息 .. . '
      )
    else if @props.flush_done
      (div null, 
        (cE Alert, {
            bsStyle: 'success'
          }, 
          '获取分段信息已完成 ! '
        )
        (cE Button, {
            bsStyle: 'primary'
            block: true
            onClick: @_more
          }, 
          '更多'
        )
      )
    else
      (cE Button, {
          bsStyle: 'primary'
          block: true
          onClick: @_start
        }, 
        '开始'
      )
}


Popup = cC {
  displayName: 'Popup'
  
  componentDidMount: ->
    @props.start_init()
  
  render: ->
    {
      div
      img
      p
    } = React.DOM
    {
      PageHeader
      Alert
    } = ReactBootstrap
    
    $$state = @props.state
    if $$state.get 'loading'
      return (p {
            className: 'text-center'
          }, 
        'Loading .. . '
      )
    bg_state = $$state.get 'bg_state'
    
    (div {
        className: 'popup_gui well'
      }, 
      (cE PageInfo, {
          bg_state: bg_state
          
          tab_id: @props.get_tab_id()
          action: @props.action
        })
      if bg_state != null
        if bg_state.playing
          (div null, 
            (cE VideoInfo, {
                bg_state: bg_state
                action: @props.action
              })
            (cE Control, {
                tab_id: @props.get_tab_id()
                flush_doing: $$state.get 'flush_doing'
                flush_done: $$state.get 'flush_done'
                
                action: @props.action
              })
          )
        else
          (cE Alert, null, 
            '请等待视频开始正常播放 .. . '
          )
      # title at bottom
      (cE PageHeader, null, 
        '怕死V'
        (img {
          className: 'pull-right'
          src: '../img/logo/64.png'
        })
      )
    )
}

# App: connect with react-redux
map_state_to_props = (state) ->
  {
    state
  }

map_dispatch_to_props = (dispatch) ->
  {
    action: Redux.bindActionCreators action, dispatch
  }

App = ReactRedux.connect(
  map_state_to_props
  map_dispatch_to_props
)(Popup)


module.exports = {
  App
  
  Popup
  PageInfo
  VideoInfo
  Control
}
# end part.coffee

