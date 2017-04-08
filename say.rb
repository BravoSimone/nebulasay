require 'catpix'
require 'asciiart'
require_relative 'printer'


mode = ARGV[0]
message = ARGV[1]
print Printer.baloon(message)
if mode == "ascii"
  print AsciiArt.new(Dir["./images/*"].sample).to_ascii_art(width: 60)
else
  Catpix::print_image Dir["./images/*"].sample, limit_x: 0.7,
                                                limit_y: 0.7,
                                                resolution: "high"
end
