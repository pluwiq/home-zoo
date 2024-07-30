# frozen_string_literal: true

module Services
  class FindAnimalService
    def initialize(cats:, dogs:)
      @cats = cats
      @dogs = dogs
    end

    def call(passport:)
      (@cats + @dogs).find { |animal| animal.passport_number == passport }
    end

    def with_animal(passport:)
      animal = call(passport:)
      animal && block_given? ? yield(animal) : puts("Animal with passport number #{passport} was not found.")
    end

    def find_and_execute(passport:, &block)
      with_animal(passport:) do |animal|
        block.call(animal)
      end
    end

    def get_valid_passport
      loop do
        puts 'Enter a passport number (digits only, at least 5 digits):'
        input = gets.chomp

        error_message = validate_passport(input)
        return input.to_i unless error_message

        puts error_message
      end
    end

    private

    def validate_passport(input)
      return 'Error: Passport number cannot be empty.' if input.empty?
      return 'Error: Passport number should contain only digits.' if input.match(/\D/)
      return 'Error: Passport number should contain at least 5 digits.' if input.length < 5
      nil
    end
  end
end
