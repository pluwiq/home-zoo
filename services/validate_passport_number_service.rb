# frozen_string_literal: true

module Services
  class ValidatePassportNumberService < BaseService
    def initialize(existing_passport_numbers = [])
      @passport_numbers = existing_passport_numbers
    end

    def call
      loop do
        puts "Enter passport number (digits only):"
        passport_number = gets.chomp
        if valid_passport_number?(passport_number) && unique_passport_number?(passport_number)
          @passport_numbers << passport_number
          return passport_number
        end

        puts "Error: Passport number should contain only digits and must be unique."
      end
    end

    private

    def valid_passport_number?(passport_number)
      passport_number.match?(/\A\d+\z/)
    end

    def unique_passport_number?(passport_number)
      !@passport_numbers.include?(passport_number)
    end
  end
end
