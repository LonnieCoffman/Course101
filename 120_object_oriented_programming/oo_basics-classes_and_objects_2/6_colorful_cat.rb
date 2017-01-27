# Create a class named Cat
# Constant named COLOR that has value of purple
# instance method named greet that prints:
#   "Hello! My name is Sophie and I'm a #{COLOR} cat!"

class Cat
  COLOR = 'purple'

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
