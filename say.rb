require 'catpix'
require_relative 'printer'


message = ARGV[0]
print Printer.baloon(message)

Catpix::print_image Dir["./images/*"].sample,
  limit_x: 0.7,
  limit_y: 0.7,
  resolution: "high"
