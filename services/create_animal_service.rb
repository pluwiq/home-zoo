# frozen_string_literal: true
require_relative 'base_service'
require_relative 'validate_name_service'
require_relative 'validate_age_service'
require_relative 'validate_wool_color_service'
require_relative 'validate_weight_service'
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

      name = Services::ValidateNameService.new.call
      age = Services::ValidateAgeService.new.call
      wool_color = Services::ValidateWoolColorService.new.call
      weight = Services::ValidateWeightService.new.call
      passport_number = Services::ValidatePassportNumberService.new(@existing_passports).call

      case animal_type
      when 'cat'
        @cats << Cat.new(name: name, age: age, wool_color: wool_color, weight: weight, passport_number: passport_number)
      when 'dog'
        @dogs << Dog.new(name: name, age: age, wool_color: wool_color, weight: weight, passport_number: passport_number)
      end

      puts "#{animal_type.downcase} named #{name} added successfully!"
    end

    private

    def ask_animal_type
      puts "What animal would you like to add? (cat/dog)"
      gets.chomp.downcase
    end
  end
end
