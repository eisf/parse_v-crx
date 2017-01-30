# log.coffee, parse_v-crx/src/s/

log_p = (text) ->
  console.log module.exports.prefix + text


module.exports = {
  prefix: 'parse_v-crx: '
  
  d: (text) ->
    log_p 'DEBUG: ' + text
  
  c: (text) ->
    log_p 'content script: ' + text
}
# end log.coffee

