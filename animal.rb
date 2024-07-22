# frozen_string_literal: true

class Animal
  attr_reader :name
  attr_accessor :age, :wool_color, :weight

  def initialize(name, age)
    @name = name
    @age = age
  end

  def talk
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def wool_color
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def weight
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def info
    "#{@name}, age: #{@age}"
  end
end
