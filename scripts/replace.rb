#! /usr/bin/env ruby

require 'awesome_print'

files = "git grep -l -e '``' --and -e \"''\""

output = IO.popen(files)
file_names = output.readlines
puts file_names.size
file_names.each do |file|
  file = file.chomp
  next if file.split('.').last != 'asc'
  puts file
  content = File.read(file)
  content = content.gsub(/``(.*?)''/, '"`\1`"')
  File.open(file, 'w') { |f| f.write(content) }
end
