# frozen_string_literal: true

require './user'
require './card'
require './logger'

PATTERN_CARD_TEXT = <<-HEREDOC
 Please, input card number use patten
 Please use one of next patten:
 1. XXXX-XXXX-XXXX-XXXX
 2. XXXX XXXX XXXX XXXX
 3. XXXXXXXXXXXXXXXX'
HEREDOC

puts 'Enter your name press enter and enter your age'
logger = Logger.new
begin
  user = User.new(gets.chomp, gets.chomp)
  if !/^[0-9]*$/.match(user.age)
    logger.log(user.name, user.age, 'incorrect age, age must be a number')
  elsif user.age.to_i < 13
    logger.log(user.name, user.age, 'your to young for card')
  else
    puts PATTERN_CARD_TEXT
    card = Card.new(gets.chomp)
    logger.log(user.name, user.age, card.validate_or_raise)
  end
rescue StandardError => e
  logger.log(user.name, user.age, e.message)
end
