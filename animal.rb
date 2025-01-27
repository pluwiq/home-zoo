# frozen_string_literal: true

require 'securerandom'

class Animal
  attr_reader :name, :passport_number

  def initialize(name:, age:, passport_number:, wool_color: 'bald', weight: SecureRandom.random_number(10..40))
    @name = name
    @age = age
    @passport_number = passport_number
    @wool_color = wool_color
    @weight = weight
  end

  def talk
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def animal_info
    return puts 'This is not a valid Animal object.' unless is_a?(Animal)

    puts "It's a #{wool_color}" \
           " #{self.class.name} " \
           "named #{name}, #{age} years old," \
           "who weighs #{weight} pounds and says \"#{talk}\""
  end

  private

  attr_accessor :age, :wool_color, :weight
end
