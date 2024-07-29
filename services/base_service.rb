# frozen_string_literal: true

module Services
  class BaseService
    def perform
      raise NotImplementedError, 'Subclasses must implement the call method.'
    end

    private

    def get_field_with_validation(prompt:, validation_regex:, error_message:)
      puts prompt
      puts error_message until (input = gets.chomp).match?(validation_regex)

      input
    end
  end
end
