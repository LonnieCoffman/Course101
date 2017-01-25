# add attribute writer to Cat class
# instantiate a new Cat object and assign it to the kitty variable
# call greet method
# reassign the name instance variable to 'Luna'
# call greet method

class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
