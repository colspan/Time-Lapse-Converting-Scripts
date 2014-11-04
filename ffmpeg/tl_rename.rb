#!/usr/bin/ruby -Ku

input_dir=ARGV[0]
output_dir=ARGV[1]


if input_dir == nil then
  puts "no ARGV[0](input_dir)"
  exit
end
if output_dir == nil then
  puts "no ARGV[1](output_dir)"
  exit
end

jpg_files=Dir.glob( File.expand_path(input_dir) + "/**/*.JPG")

jpg_files.each_with_index do |jpg_file, i|
   output_file = output_dir + "/" + sprintf("TL%06d.JPG",i)
   File.rename( jpg_file, output_file )
   # File.dirname(jpg_file)
end
