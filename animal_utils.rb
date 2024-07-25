# frozen_string_literal: true

module AnimalUtils
  def self.show_all_animals(cats:, dogs:)
    unless cats.is_a?(Array) && dogs.is_a?(Array)
      puts "Invalid input: cats and dogs should be arrays."
      return
    end

    (cats + dogs).each do |animal|
      unless animal.is_a?(Animal)
        puts "Invalid object: #{animal.inspect} is not an Animal."
        next
      end
      animal.animal_info
    end
  end
end