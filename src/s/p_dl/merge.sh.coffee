# merge.sh.coffee, parse_v-crx/src/s/p_dl/

config = require '../config'


make_ffmpeg_merge_sh = (file_list, output_file, sh_filename) ->
  output = []
  o = (line) ->
    output.push line
  
  o '#!/bin/sh'
  o "# #{sh_filename}: ffmpeg merge sh, generated by parse_v-crx at #{new Date()}"
  o ''
  o 'file_list="\\'
  for i in file_list
    o "#{i}\\"
    o '|\\'
  output.pop()
  o '"'
  o "output_file=\"#{output_file}\""
  o ''
  
  ffmpeg = config.merge_ffmpeg_bin
  o "echo \"-> #{ffmpeg} -i \\\"concat:${file_list}\\\" -c copy ${output_file}\""
  o "#{ffmpeg} -i \"concat:${file_list}\" -c copy ${output_file}"
  o ''
  o "# end #{sh_filename}"
  o ''
  # output
  output.join('\n') + '\n'

module.exports = make_ffmpeg_merge_sh
# end merge.sh.coffee

