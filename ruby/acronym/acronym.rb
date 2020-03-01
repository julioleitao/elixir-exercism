# frozen_string_literal: true

class Acronym
  def self.abbreviate(phrase)
    phrase.gsub(/-/, ' ').split(' ')
          .map { |word| word[0].upcase }
          .join
  end
end
