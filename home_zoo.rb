# frozen_string_literal: true

require_relative 'cat'
require_relative 'dog'
require_relative 'animal_utils'
require_relative 'services/create_animal_service'
require_relative 'animal_manager'

cats = [
  Cat.new(name: 'Amely', age: 2, wool_color: 'white', weight: 6, passport_number: '12345'),
  Cat.new(name: 'Blake', age: 4, wool_color: 'black', weight: 5, passport_number: '67890')
]
dogs = [
  Dog.new(name: 'Rex', age: 2, wool_color: 'ginger', weight: 20, passport_number: '54321'),
  Dog.new(name: 'Din', age: 6, wool_color: 'white', weight: 25, passport_number: '09876')
]

def find_animal(cats, dogs)
  puts "Enter the passport number of the animal to search:"
  passport = gets.chomp
  animal = AnimalManager.find_animal_by_passport(cats, dogs, passport)
  if animal
    AnimalUtils.animal_info(animal)
  else
    puts "Animal with #{passport} ID was not found."
  end
end

def all_passport_numbers(cats, dogs)
  (cats + dogs).map(&:passport_number)
end

loop do
  puts "Welcome to the Home Zoo!\n" \
  "What do you want to do?\n" \
  "1. Add a new animal\n" \
  "2. Show all animals\n" \
  "3. Find animal by passport number\n" \
  "4. Remove animal by passport number\n" \
  "5. Change information about the animal\n" \
  "6. Exit"
  choice = gets.chomp.to_i

  case choice
  when 1
    existing_passports = all_passport_numbers(cats, dogs)
    Services::CreateAnimalService.new(cats: cats, dogs: dogs, existing_passports: existing_passports).call
  when 2
    AnimalUtils.show_all_animals(cats, dogs)
  when 3
    find_animal(cats, dogs)
  when 4
    AnimalManager.delete_animal(cats, dogs)
  when 5
    AnimalManager.edit_animal(cats, dogs)
  when 6
    break
  else
    puts "Wrong choice, please try again."
  end
end
