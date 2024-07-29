# frozen_string_literal: true

require_relative 'services/create_animal_service'
require_relative 'services/find_animal_service'

module AnimalManager
  @cats = []
  @dogs = []

  class << self
    attr_accessor :cats, :dogs

    def get_passport
      Services::FindAnimalService.new(cats: @cats, dogs: @dogs).get_valid_passport
    end

    def delete_animal_by(passport:)
      passport ||= get_passport
      Services::FindAnimalService.new(cats: @cats, dogs: @dogs).find_and_execute(passport:) do |animal|
        @cats.delete(animal) || @dogs.delete(animal)
        puts "Animal with passport number #{animal.passport_number} has been removed."
      end
    end

    def all_passport_numbers
      (@cats + @dogs).map(&:passport_number)
    end

    def edit_animal_by(passport:)
      passport ||= get_passport
      Services::FindAnimalService.new(cats: @cats, dogs: @dogs).find_and_execute(passport:) do |animal|
        create_service = Services::CreateAnimalService.new(cats: @cats, dogs: @dogs, existing_passports: [])

        animal.instance_variable_set(:@age, create_service.send(:validate_field, field: :age).to_i)
        animal.instance_variable_set(:@weight, create_service.send(:validate_field, field: :weight).to_i)
        puts 'Animal information has been updated.'
      end
    end
  end
end
