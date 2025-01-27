# frozen_string_literal: true

require_relative 'base_service'
require_relative 'create_animal_service'

module Services
  class ValidatePassportNumberService < BaseService
    def initialize(existing_passport_numbers: [])
      @passport_numbers = existing_passport_numbers
    end

    def call
      loop do
        begin
          passport_number = get_field_with_validation(
            prompt: 'Enter passport number (digits only, at least 5 digits):',
            validation_regex: /\A\d{5,}\z/,
            error_message: 'Error: Passport number should contain only digits and be at least 5 digits long.'
          ).to_i
          validate_passport_number!(passport_number:)
          @passport_numbers << passport_number
          return passport_number
        rescue StandardError => e
          puts e.message
        end
      end
    end

    private

    def validate_passport_number!(passport_number:)
      raise 'Error: Passport number must be unique.' unless unique_passport_number?(passport_number:)
    end

    def unique_passport_number?(passport_number:)
      !@passport_numbers.include?(passport_number)
    end
  end
end
