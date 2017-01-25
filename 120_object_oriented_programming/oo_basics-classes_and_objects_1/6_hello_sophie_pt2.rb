# remove puts greeting from initialize method
# create new method named greet
# -- puts a greeting when invoked

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
