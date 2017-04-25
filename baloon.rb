class Baloon
  def self.generate(message)
    @string = ""
    lines = message.scan(/.{1,50}\b|.{1,50}/).map(&:strip)

    if message.length <= 50
      oneliner(message)
    else
      multiliner(lines)
    end
    close_baloon

    @string
  end

  private

  def self.oneliner(message)
    @string += ' '
    (message.length + 2).times { @string += '_' }
    @string += "\n< #{message} >\n "
    (message.length + 2).times { @string += '-' }
    @string += "\n"
  end

  def self.multiliner(lines)
    max_length = lines.max_by(&:length).length

    @string += " "
    (max_length + 2).times { @string += '_' }
    @string += "\n"

    lines.each_with_index do |line, index|
      difference = max_length - line.length

      if index == 0
        @string += "/ #{line}"
        difference.times { @string += " " }
        @string += " \\"
      elsif index == lines.length - 1
        @string += "\\ #{line}"
        difference.times { @string += " " }
        @string += " /"
      else
        @string += "| #{line}"
        difference.times { @string += " " }
        @string += " |"
      end
      @string += "\n"
    end
    @string += " "
    (max_length + 2).times { @string += '-' }
    @string += "\n"
  end

  def self.close_baloon
    @string += "| /\n" +
               "|/\n"
  end
end
