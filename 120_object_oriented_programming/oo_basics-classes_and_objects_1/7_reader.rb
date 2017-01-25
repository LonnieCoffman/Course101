# add a getter method attr_reader
# invoke it in the place of name within the greet method

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
p kitty.name
