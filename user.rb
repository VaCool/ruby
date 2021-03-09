# frozen_string_literal: true

# User with name and age info
class User
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
