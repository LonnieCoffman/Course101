# initial solution
def count_occurrences(items)
  counted = {}
  items.each do |item|
    if counted.key? item.to_sym
      counted[item.to_sym] += 1
    else
      counted[item.to_sym] = 1
    end
  end
  counted.each { |k, v| puts "#{k} => #{v}" }
end

# modified solution after reading launch school discussion
def count_occurrences_1(items)
  items.uniq.each { |item| puts "#{item} => #{items.count(item)}" }
end

vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)

count_occurrences_1(vehicles)
