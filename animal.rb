# frozen_string_literal: true

class Animal
  attr_reader :name, :passport_number
  attr_accessor :age, :wool_color, :weight

  def initialize(name:, age:, passport_number:)
    @name = name
    @age = age
    @passport_number = passport_number
  end

  def talk
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def info
    "#{@name}, age: #{@age}"
  end
end
