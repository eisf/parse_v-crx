# merge.coffee, parse_v-crx/src/s/p_dl/

log = require '../log'
util = require '../bg/util'
merge_sh = require './merge.sh'


gen_merge_script = (info, prefix) ->
  raw_list = info.video[info.size].file
  main_name = raw_list[0].filename.split('.')[0]
  
  file_list = (i.filename for i in raw_list)
  
  # TODO check platform (support OS: Windows)
  
  output_file = "#{main_name}.out.mp4"
  script_name = "merge.#{main_name}.parse_v-crx.sh"
  
  script_text = merge_sh file_list, output_file, script_name
  util.download_text prefix + '/' + script_name, script_text
  # DEBUG
  log.d 'p_dl/merge: gen_merge_script: done. '


module.exports = {
  gen_merge_script
}
# end merge.coffee

