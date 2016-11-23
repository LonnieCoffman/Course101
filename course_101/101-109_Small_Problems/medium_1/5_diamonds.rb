def space(num)
  return '*' if num == 1
  "*#{' ' * (num - 2)}*"
end

def diamond(num)
  1.upto(num) { |n| puts space(n).center(num) if n.odd? }
  (num - 1).downto(1) { |n| puts space(n).center(num) if n.odd? }
end

diamond(50)
