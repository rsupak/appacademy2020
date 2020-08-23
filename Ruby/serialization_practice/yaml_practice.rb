require 'yaml'

class Cat
  attr_reader :name, :age, :breed
  def initialize(name, age, breed)
    @name = name
    @age = age
    @breed = breed
  end
end

c = Cat.new("Fluffykins", 2, "Main Coone")
p c

serialize_c = c.to_yaml
p serialize_c

c2 = YAML::load(serialize_c)
p c2
