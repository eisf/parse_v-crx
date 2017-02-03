# merge.coffee, parse_v-crx/src/s/p_dl/

log = require '../log'
util = require '../bg/util'

merge_sh = require './merge.sh'
merge_bat = require './merge.bat'


gen_merge_script = (info, prefix) ->
  raw_list = info.video[info.size].file
  main_name = raw_list[0].filename.split('.')[0]
  
  file_list = (i.filename for i in raw_list)
  output_file = "#{main_name}.out.mp4"
  
  # NOTE check platform (OS)
  chrome.runtime.getPlatformInfo( (p) ->
    # DEBUG
    log.d "p_dl/merge: os #{p.os}"
    if p.os is 'win'
      script_name = "合并.#{main_name}.parse_v-crx.bat"
      make_merge = merge_bat
    else
      script_name = "merge.#{main_name}.parse_v-crx.sh"
      make_merge = merge_sh
    
    script_text = make_merge file_list, output_file, script_name
    util.download_text prefix + '/' + script_name, script_text
    # DEBUG
    log.d "p_dl/merge: gen_merge_script: done. #{script_name}"
  )


module.exports = {
  gen_merge_script
}
# end merge.coffee

