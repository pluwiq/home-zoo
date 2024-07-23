# frozen_string_literal: true
require_relative 'base_service'

module Services
  class ValidateAgeService < BaseService
    def call
      ask_with_validation(
        "Enter the age of the animal (digits only):",
        /\A\d+\z/,
        "Error: Age should contain only digits."
      ).to_i
    end
  end
end
