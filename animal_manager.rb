# frozen_string_literal: true

require_relative 'services/create_animal_service'
require_relative 'services/validate_passport_number_service'

module AnimalManager
  @cats = []
  @dogs = []

  class << self
    attr_accessor :cats, :dogs

    def find_animal_by_passport(passport:)
      (@cats + @dogs).find { |animal| animal.passport_number == passport }
    end

    def get_passport
      puts "Enter a passport number:"
      gets.chomp
    end

    def with_animal(passport: nil)
      passport ||= get_passport
      unless (animal = find_animal_by_passport(passport: passport))
        puts "Animal with passport number #{passport} was not found."
      end
      yield(animal) if animal && block_given?
    end

    def delete_animal_by(passport: nil)
      with_animal(passport: passport) do |animal|
        @cats.delete(animal) || @dogs.delete(animal)
        puts "Animal with passport number #{animal.passport_number} has been removed."
      end
    end

    def find_animal
      passport = AnimalManager.get_passport
      animal = AnimalManager.find_animal_by_passport(passport: passport)
      if animal
        animal.animal_info
      else
        puts "Animal with #{passport} ID was not found."
      end
    end

    def all_passport_numbers
      (AnimalManager.cats + AnimalManager.dogs).map(&:passport_number)
    end

    def edit_animal_by(passport: nil)
      with_animal(passport: passport) do |animal|
        service = Services::CreateAnimalService.new(cats: @cats, dogs: @dogs, existing_passports: [])

        animal.instance_variable_set(:@age, service.send(:validate_field, field: :age).to_i)
        animal.instance_variable_set(:@weight, service.send(:validate_field, field: :weight).to_i)
        puts "Animal information has been updated."
      end
    end
  end
end
