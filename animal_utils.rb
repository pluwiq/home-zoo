# frozen_string_literal: true
module AnimalUtils
  def self.show_all_animals(cats:, dogs:)
    return puts('Invalid input: cats and dogs should be arrays.') if !cats.is_a?(Array) || !dogs.is_a?(Array)

    (cats + dogs).each do |animal|
      animal.is_a?(Animal) ? animal.animal_info : puts("Invalid object: #{animal.inspect} is not an Animal")
    end
  end
end
