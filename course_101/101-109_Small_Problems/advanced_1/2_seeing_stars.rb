def draw_top(space)
  pad = 0
  loop do
    puts "#{' ' * pad}*#{' ' * space}*#{' ' * space}*"
    space -= 1
    pad += 1
    break if space < 0
  end
end

def draw_bottom(pad)
  space = 0
  loop do
    puts "#{' ' * pad}*#{' ' * space}*#{' ' * space}*"
    space += 1
    pad -= 1
    break if pad < 0
  end
end

def star(int)
  space = int / 2 - 1
  draw_top(space)
  puts '*' * int
  draw_bottom(space)
end

star(31)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
