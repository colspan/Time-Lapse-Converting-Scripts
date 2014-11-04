#!/bin/sh

# cropping and resizing images on the folder given by the argument
# usage: resize.sh INPUT_DIR OUTPUT_DIR
# caution: each arguments need to include the last slash. eg. "images/"
#          this script depends on imagemagick's convert command

# target folder that contains images to crop and resize
input_dir=$1 # please include the last slash. eg. "images/"
input_file_list=`ls ${input_dir}`

# output directory. 
output_dir=$2

# settings to crop images
crop_width=4000
crop_height=2250
crop_offset_x=0
crop_offset_y=$2

# settings to resize imgaes
resize_x=1920
resize_y=1080

# processing
mkdir $output_dir
for i in $input_file_list ; do
echo $i
convert -crop ${crop_width}x${crop_height}+${crop_offset_x}+${crop_offset_y} -resize ${resize_x}x${resize_y} ${input_dir}${i} ${output_dir}${i}
done

