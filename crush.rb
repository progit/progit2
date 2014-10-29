#! /usr/bin/env ruby
require 'rubygems'
require 'oily_png'

Dir.glob("book/**/*.png").each do |file|
  puts file
  image = ChunkyPNG::Image.from_file(file)
  p image.width
  p image.height
  if image.width > 800 || image.height > 800
    if image.width > image.height
      `convert -resize 800x #{file} #{file}.smaller.png`
    else
      `convert -resize x800 #{file} #{file}.smaller.png`
    end
    `pngcrush #{file}.smaller.png #{file}`
    `rm #{file}.smaller.png`
  end
end


#  [2,0.5].each do |scale|
#    resized_image = ChunkyPNG::Image.new((image.width * scale).round, (image.height * scale).round)
#    resized_image.pixels.map!.with_index do |pixel, index|
#      x, y = index % resized_image.width, (index / resized_image.width).floor
#      image[x / scale, y / scale]
#    end
#    resized_image.save("bassie_resized_#{scale}.png")
#  end
