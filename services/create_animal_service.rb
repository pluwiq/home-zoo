# frozen_string_literal: true
require_relative 'base_service'
require_relative 'validate_passport_number_service'

module Services
  class CreateAnimalService < BaseService
    def initialize(cats:, dogs:, existing_passports:)
      @cats = cats
      @dogs = dogs
      @existing_passports = existing_passports
    end

    def call
      return unless %w[cat dog].include?((animal_type = ask_animal_type))

      attributes = gather_animal_attributes
      animal = create_animal(animal_type: animal_type, attributes: attributes)

      puts "#{animal_type.downcase} named #{animal.name} added successfully!"

      animal
    end

    private

    def ask_animal_type
      get_field_with_validation(
        prompt: 'What animal would you like to add? (cat/dog)',
        validation_regex: /\A(cat|dog)\z/i,
        error_message: "Error: Animal type must be 'cat' or 'dog'."
      ).downcase
    end

    def gather_animal_attributes
      {
        name: validate_field(field: :name),
        age: validate_field(field: :age).to_i,
        wool_color: validate_field(field: :wool_color),
        weight: validate_field(field: :weight).to_i,
        passport_number: Services::ValidatePassportNumberService.new(existing_passport_numbers: @existing_passports).call
      }
    end

    VALIDATION_PARAMS = {
      name: {
        prompt: 'Enter animal name (letters only):',
        regex: /\A[a-zA-Z]+\z/,
        error_message: 'Error: Name should contain only letters.'
      },
      age: {
        prompt: 'Enter the age of the animal (digits only):',
        regex: /\A\d+\z/,
        error_message: 'Error: Age should contain only digits.'
      },
      wool_color: {
        prompt: "Enter the animal's wool color (letters only):",
        regex: /\A[a-zA-Z]+\z/,
        error_message: 'Error: Wool color should contain only letters.'
      },
      weight: {
        prompt: "Enter the animal's weight in pounds (digits only):",
        regex: /\A\d+\z/,
        error_message: 'Error: Weight should contain only digits.'
      }
    }.freeze

    def validate_field(field:)
      params = VALIDATION_PARAMS[field]
      get_field_with_validation(
        prompt: params[:prompt],
        validation_regex: params[:regex],
        error_message: params[:error_message]
      )
    end

    def create_animal(animal_type:, attributes:)
      case animal_type
      when 'cat'
        cat = Cat.new(**attributes)
        @cats << cat
        cat
      when 'dog'
        dog = Dog.new(**attributes)
        @dogs << dog
        dog
      end
    end
  end
end
