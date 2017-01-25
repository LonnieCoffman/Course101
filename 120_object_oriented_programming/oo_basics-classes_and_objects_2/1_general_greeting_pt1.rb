# Expected Output
# "Hello! I'm a cat!" is printed by the generic_greeting method with the Cat class
##
# add generic_greeting class method to the Cat class
# -- method puts "Hello! I'm a cat" on the screen
# invoke the method on the Cat class

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

p (Cat.generic_greeting === kitty.class.generic_greeting)
p (Cat == kitty.class)
