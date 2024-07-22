# frozen_string_literal: true

def animal_info(animal)
  puts "It's a #{animal.wool_color} " \
         "#{animal.class.name.downcase} " \
         "named #{animal.name}, #{animal.age} years old, " \
         "who weighs #{animal.weight} pounds and says \"#{animal.talk}\""
end

def show_all_animals(animals)
  animals.each do |animal|
    animal_info(animal)
  end
end

