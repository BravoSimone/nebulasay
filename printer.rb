require 'catpix'
require 'asciiart'
require_relative 'baloon'

class Printer
  def initialize(options)
    print Baloon.generate(options[:message]) if options.key? :message

    if options[:mode] == "ascii"
      print AsciiArt.new(Dir["./images/*"].sample).to_ascii_art(width: 60)
    else
      Catpix::print_image Dir["./images/*"].sample, limit_x: 0.7,
                                                    limit_y: 0.7,
                                                    resolution: "high"
    end
  end
end
