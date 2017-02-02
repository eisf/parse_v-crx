# config.coffee, parse_v-crx/src/s/
# internal config


module.exports = {
  # content.js: time for page to init (max second)
  check_init_max_wait_s: 20
  
  # content.js: check video play, count second
  check_video_play_count_s: 5
  
  # background.js: flush: delta seconds
  flush_delta_s: 60
  # background.js: flush: reserved seconds
  flush_reserve_s: 120
  
  # wait between flush video clips
  flush_wait_s: 1
  
  # auto flush: time before and after seconds
  auto_flush_reserve_s: 5
}
# end config.coffee

