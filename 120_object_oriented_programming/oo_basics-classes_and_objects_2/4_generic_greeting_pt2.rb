# add a class method named generic_greeting
# -- print greeting that's generic to the class
# add an instance method named personal_greeting
# -- print a custom generic_greeting
#
# expected output
# "Hello! I'm a cat!"
# "Hello! My name is Sophie!"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
