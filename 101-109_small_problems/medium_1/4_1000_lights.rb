def lights_on(num)
  lights = Array.new(num, 0)
  (1..num).each do |pass|
    (1..num).each do |light|
      if (light % pass).zero?
        lights[light - 1] = (lights[light - 1]).zero? ? 1 : 0
      end
    end
  end
  lights.each_with_index.map { |val, idx| idx + 1 if val == 1 }.compact
end

p lights_on(1000)
