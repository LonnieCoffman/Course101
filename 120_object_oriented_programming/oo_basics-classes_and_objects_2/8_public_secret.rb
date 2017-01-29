# class named person
# -- instance variable: secret
# -- setter and getter
# expected Output
# "Shh.. this is a secret!"

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
