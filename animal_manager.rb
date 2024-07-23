# frozen_string_literal: true
require_relative 'services/validate_age_service'
require_relative 'services/validate_weight_service'

module AnimalManager
  def self.find_animal_by_passport(cats, dogs, passport)
    (cats + dogs).find { |animal| animal.passport_number == passport }
  end

  def self.delete_animal(cats, dogs)
    puts "Enter the passport number of the animal to delete:"
    passport = gets.chomp
    animal = find_animal_by_passport(cats, dogs, passport)
    if animal
      cats.delete(animal) || dogs.delete(animal)
      puts "Animal with passport number #{passport} has been removed."
    else
      puts "Animal with passport number #{passport} was not found."
    end
  end

  def self.edit_animal(cats, dogs)
    puts "Enter the passport number of the animal to edit:"
    passport = gets.chomp
    animal = find_animal_by_passport(cats, dogs, passport)
    if animal
      new_age = Services::ValidateAgeService.new.call
      new_weight = Services::ValidateWeightService.new.call

      animal.instance_variable_set(:@age, new_age)
      animal.instance_variable_set(:@weight, new_weight)

      puts "Animal information has been updated."
    else
      puts "Animal with passport number #{passport} was not found."
    end
  end
end
