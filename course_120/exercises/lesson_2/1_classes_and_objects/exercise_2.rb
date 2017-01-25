class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1] || ''
  end

  def name
    last_name.empty? ? first_name : "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
