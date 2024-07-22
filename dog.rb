# frozen_string_literal: true

require_relative 'animal'

class Dog < Animal

  def initialize(name, age, wool_color, weight)
    super(name, age)
    @wool_color = wool_color
    @weight = weight
  end

  def talk
    "woof"
  end

  def wool_color
    @wool_color
  end

  def weight
    @weight
  end
end
