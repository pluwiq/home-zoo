# frozen_string_literal: true
require_relative 'base_service'

module Services
  class ValidateNameService < BaseService
    def call
      ask_with_validation(
        "Enter animal name (letters only):",
        /\A[a-zA-Z]+\z/,
        "Error: Name should contain only letters."
      )
    end
  end
end
