# frozen_string_literal: true

MEM = { black: 0, brown: 1, orange: 3, yellow: 4, green: 5, violet: 7, blue: 6, grey: 8 }.freeze

module ResistorColorDuo
  def self.value(colors)
    colors[0..1]
      .map { |color| MEM[color.to_sym] }
      .join
      .to_i
  end
end
