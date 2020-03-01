# frozen_string_literal: true

REGEX_ESP_CHARS = /,|:|!|&|@|\$|%|\^|&|\.| \'|\' /.freeze

class Phrase
  attr_reader :word_count

  # def initialize(phrase)
  #   @word_count = {}

  #   phrase.gsub(REGEX_ESP_CHARS, ' ').downcase.split.each do |word|
  #     @word_count[word] = 0 unless @word_count.key?(word)
  #     @word_count[word] = @word_count[word] + 1
  #   end
  # end

  def initialize(phrase)
    @word_count = phrase.gsub(REGEX_ESP_CHARS, ' ')
                        .downcase
                        .split
                        .each_with_object({}) do |word, counter|
      counter[word] = 0 unless counter.key?(word)
      counter[word] = counter[word] + 1
    end
  end
end
