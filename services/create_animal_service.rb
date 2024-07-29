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
      return unless %w[cat dog].include?((animal_type = validate_field(field: :type).downcase))

      animal = create_animal(animal_type: animal_type, attributes: gather_animal_attributes)

      puts "#{animal_type.downcase} named #{animal.name} added successfully!"

      animal
    end

    private

    VALIDATION_PARAMS = {
      type: {
        prompt: 'What animal would you like to add? (cat/dog)',
        validation_regex: /\A(cat|dog)\z/i,
        error_message: "Error: Animal type must be 'cat' or 'dog'."
      },
      name: {
        prompt: 'Enter animal name (letters only):',
        validation_regex: /\A[a-zA-Z]+\z/,
        error_message: 'Error: Name should contain only letters.'
      },
      age: {
        prompt: 'Enter the age of the animal (digits only, greater than 0):',
        validation_regex: /\A[1-9]\d*\z/,
        error_message: 'Error: Age should be a positive number greater than 0.'
      },
      wool_color: {
        prompt: "Enter the animal's wool color (letters only):",
        validation_regex: /\A[a-zA-Z]+\z/,
        error_message: 'Error: Wool color should contain only letters.'
      },
      weight: {
        prompt: "Enter the animal's weight in pounds (positive number greater than 0):",
        validation_regex: /\A(?:0\.\d{1,}|[1-9]\d*(?:\.\d{1,})?)\z/,
        error_message: 'Error: Weight should be a positive number greater than 0.'
      }
    }.freeze

    def gather_animal_attributes
      {
        name: validate_field(field: :name),
        age: validate_field(field: :age).to_i,
        wool_color: validate_field(field: :wool_color),
        weight: validate_field(field: :weight).to_f,
        passport_number: Services::ValidatePassportNumberService.new(existing_passport_numbers: @existing_passports).call
      }
    end

    def validate_field(field:)
      get_field_with_validation(
        prompt: VALIDATION_PARAMS[field][:prompt],
        validation_regex: VALIDATION_PARAMS[field][:validation_regex],
        error_message: VALIDATION_PARAMS[field][:error_message]
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
