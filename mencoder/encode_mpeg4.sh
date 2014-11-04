#!/bin/sh

# encoding the movie (mpeg4) from images on the folder given by argument
# usage : encode_mpeg4.sh INPUT_DIR CROP_OPTION OUTPUT_RESOLUTION OUTPUT_FILE
# caution : Please do not include the extension in the argument "OUTPUT_FILE".
#           This script depends on mencoder and ffmpeg.

# video settings
output_video_bitrate=8192
output_video_framerate=60

# file settings
input_dir=$1
crop_option=$2
output_resolution=$3
output_filename=$4
input_files="mf://${input_dir}*.JPG"
temp_file="${output_filename}_temp.avi"
output_file="${output_filename}.mp4"

mencoder ${input_files} -mf fps=${output_video_framerate} -ovc lavc -aspect 16:9 \
 -lavcopts vcodec=mpeg4:vbitrate=${output_video_bitrate}:threads=4 \
 -vf crop=${crop_option},scale=${output_resolution} \
 -o ${temp_file}

#ffmpeg -i ${temp_file} -vcodec copy ${output_file}
#rm ${temp_file}

