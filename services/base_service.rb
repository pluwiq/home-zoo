# frozen_string_literal: true

module Services
  class BaseService
    def perform
      raise NotImplementedError, "Subclasses must implement the call method"
    end

    private

    def get_field_with_validation(prompt:, validation_regex:, error_message:)
      puts prompt
      until (input = gets.chomp).match?(validation_regex)
        puts error_message
      end

      input
    end
  end
end
