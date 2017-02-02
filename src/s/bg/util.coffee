# util.coffee, parse_v-crx/src/s/bg/


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


module.exports = {
  second_to_time
}
# end util.coffee

