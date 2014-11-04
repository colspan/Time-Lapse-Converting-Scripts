#!/usr/bin/ruby -Ku

require "rubygems"
require "exifr"

input_dir=ARGV[0]

MOVIE_WIDTH=1920
MOVIE_HEIGHT=1080

if input_dir == nil then
  puts "no ARGV[0](input_dir)"
  exit
end

input_files = File.expand_path(input_dir) + "/TL%06d.JPG"
output_file = File.expand_path(input_dir) + "/output.mp4"

# Analyzing Image Size
analyzing_target_file = Dir.glob(sprintf(input_files,1)).first
exif_data = EXIFR::JPEG.new(analyzing_target_file)

resized_width = MOVIE_WIDTH
resized_height = (exif_data.height.to_f / exif_data.width.to_f * MOVIE_WIDTH).to_i
cropped_width = MOVIE_WIDTH
cropped_height = MOVIE_HEIGHT
crop_x = ((resized_width - cropped_width)/2).to_i
crop_y = ((resized_height - cropped_height)/2).to_i

command = "ffmpeg -i \"#{input_files}\" -vf scale=#{resized_width}:#{resized_height},crop=#{cropped_width}:#{cropped_height}:#{crop_x}:#{crop_y} -framerate 29.97 -c:v libx264 -b:v 2M -y -threads 4 #{output_file}"
`#{command}`
