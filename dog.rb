# frozen_string_literal: true

require_relative 'animal'

class Dog < Animal
  def initialize(name:, age:, wool_color:, weight:, passport_number:)
    super(name:, age:, passport_number:)
    @wool_color = wool_color
    @weight = weight
  end

  def talk
    'woof'
  end
end
