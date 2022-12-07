require 'minitest/autorun'
require_relative './test_helper.rb'

class DealerTest < Minitest::Test
	def setup
		@game = Game.new
		@dealer = Dealer.new(@game)
	end

	def test_must_hit
		@dealer.hand = [Card.generate_numbered_card(Card::SUITS[0], 2), Card.generate_numbered_card(Card::SUITS[0], 3)]
		assert(@dealer.must_hit?)
		@dealer.hand = [Card.generate_numbered_card(Card::SUITS[0], 10), Card.generate_numbered_card(Card::SUITS[0], 9)]
		refute(@dealer.must_hit?)
	end

	def test_valid_command
		@dealer.hand = [Card.generate_numbered_card(Card::SUITS[0], 2), Card.generate_numbered_card(Card::SUITS[0], 3)]

		assert(@dealer.valid_command?(Player::COMMANDS[0]))
		refute(@dealer.valid_command?(Player::COMMANDS[1]))

		@dealer.hand = [Card.generate_numbered_card(Card::SUITS[0], 10), Card.generate_numbered_card(Card::SUITS[0], 9)]
		assert(@dealer.valid_command?(Player::COMMANDS[0]))
		assert(@dealer.valid_command?(Player::COMMANDS[1]))

		refute(@dealer.valid_command?('invalid_command'))
	end
end