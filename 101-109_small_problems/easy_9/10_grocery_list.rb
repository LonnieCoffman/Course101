def buy_fruit(list)
  list.map { |items| Array.new(items[1], items[0]) }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
