require 'minitest/autorun'
require_relative './test_helper.rb'

class DeckTest < Minitest::Test
	def setup
		@deck = Deck.new
	end

	def test_initialize
		assert_equal(52, @deck.cards.count)
	end
end