# frozen_string_literal: true

require_relative 'animal'

class Cat < Animal
  def initialize(name:, age:, wool_color:, weight:, passport_number:)
    super(name: name, age: age, passport_number: passport_number)
    self.wool_color = wool_color
    self.weight = weight
  end

  def talk
    'meow'
  end
end
