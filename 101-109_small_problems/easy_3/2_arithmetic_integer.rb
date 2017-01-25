def calculate(num1, num2)
  operators = [:+, :-, :*, :/, :%, :**, :!=]
  operators.each do |op|
    puts "==> #{num1} #{op} #{num2} = #{num1.send(op, num2)}"
  end
end

calculate(13, 21)
