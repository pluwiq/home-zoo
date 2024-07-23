# frozen_string_literal: true

module AnimalUtils
  def self.animal_info(animal)
    puts "It's a #{animal.wool_color} " \
           "#{animal.class.name.downcase} " \
           "named #{animal.name}, #{animal.age} years old, " \
           "who weighs #{animal.weight} pounds and says \"#{animal.talk}\""
  end

  def self.show_all_animals(cats, dogs)
    animals = cats + dogs
    animals.each { |animal| animal_info(animal) }
  end
end
