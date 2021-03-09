# frozen_string_literal: true

# Card number info and validation card
class Card
  REGEXP = /(?<!\d)\d{16}(?!\d)|(?<!\d[ _-])(?<!\d)\d{4}(?=([_ -]))(?:\1\d{4}){3}(?![_ -]?\d)/.freeze
  def initialize(card_number)
    @card_number = card_number
  end

  def validate_or_raise
    raise 'Empty card' if @card_number.empty?

    raise 'Wrong card format' unless REGEXP.match(@card_number)

    @card_number = @card_number.gsub(' ', '').gsub('-', '')
    raise 'wrong checksum' unless check_sum

    "check successful for #{transform_card_number}"
  end

  def check_sum
    sum = 0
    @card_number.chars.each_with_index { |el, i| sum += calculate_sum(el.to_i, i) }
    (sum % 10).zero?
  end

  def calculate_sum(element, index)
    if (index % 2).zero?
      element * 2 > 9 ? element * 2 - 9 : element * 2
    else
      element
    end
  end

  def transform_card_number
    @card_number.scan(/.{4}/).join('-')
  end
end
