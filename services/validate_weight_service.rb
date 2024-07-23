# frozen_string_literal: true
require_relative 'base_service'

module Services
  class ValidateWeightService < BaseService
    def call
      ask_with_validation(
        "Enter the animal's weight in pounds (digits only):",
        /\A\d+\z/,
        "Error: Weight should contain only digits."
      ).to_i
    end
  end
end
