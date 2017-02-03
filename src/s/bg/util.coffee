# util.coffee, parse_v-crx/src/s/bg/

log = require '../log'


second_to_time = (s) ->
  ns = (n) ->
    if n < 10
      '0' + n
    else
      '' + n
  
  m = Math.floor(s / 60)
  s = s - m * 60
  
  h = Math.floor(m / 60)
  m = m - h * 60
  
  s = Math.floor(s)
  o = "#{ns m}:#{ns s}"
  if h > 0
    o = "#{ns h}:#{o}"
  return o

download_text = (filename, text) ->
  b = new Blob [text], {
      type: 'text/plain'
    }
  file_url = URL.createObjectURL b
  
  chrome.downloads.download {
      url: file_url
      filename: filename
      conflictAction: 'uniquify'
  }, (download_id) ->
    # DEBUG
    log.d "bg/util: download_text: id #{download_id}, filename #{filename}, URL #{file_url}"


module.exports = {
  second_to_time
  download_text
}
# end util.coffee

