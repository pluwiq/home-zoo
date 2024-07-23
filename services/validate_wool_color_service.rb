# frozen_string_literal: true
require_relative 'base_service'

module Services
  class ValidateWoolColorService < BaseService
    def call
      ask_with_validation(
        "Enter the animal's wool color (letters only):",
        /\A[a-zA-Z]+\z/,
        "Error: Wool color should contain only letters."
      )
    end
  end
end
