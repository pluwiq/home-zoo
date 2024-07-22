# frozen_string_literal: true

require_relative 'animal'

class Cat < Animal

  def initialize(name, age, wool_color, weight)
    super(name, age)
    @wool_color = wool_color
    @weigh = weight
  end

  def talk
    "meow"
  end

  def wool_color
    @wool_color
  end

  def weight
    @weight
  end
end
