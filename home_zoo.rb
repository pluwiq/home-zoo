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

AnimalManager.cats = cats
AnimalManager.dogs = dogs

loop do
  puts   "What do you want to do?\n" \
         "1. Add a new animal\n" \
         "2. Show all animals\n" \
         "3. Find animal by passport number\n" \
         "4. Remove animal by passport number\n" \
         "5. Change information about the animal\n" \
         "6. Exit"
  choice = gets.chomp.to_i

  case choice
  when 1
    Services::CreateAnimalService.new(cats: AnimalManager.cats, dogs: AnimalManager.dogs, existing_passports: AnimalManager.all_passport_numbers).call
  when 2
    AnimalUtils.show_all_animals(cats: AnimalManager.cats, dogs: AnimalManager.dogs)
  when 3
    AnimalManager.find_animal
  when 4
    AnimalManager.delete_animal_by
  when 5
    AnimalManager.edit_animal_by
  when 6
    break
  else
    puts 'Wrong choice, please try again.'
  end
end
