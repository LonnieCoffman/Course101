class Banner
  def initialize(message, width = 0)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * max_width}-+"
  end

  def empty_line
    "| #{' ' * max_width} |"
  end

  def message_line
    "| #{@message.center(max_width)} |"
  end

  def max_width
    [@message.length, @width].max
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 800)
puts banner
banner = Banner.new('')
puts banner
