require 'minitest/autorun'
require_relative './test_helper.rb'

class CardTest < Minitest::Test
	def setup
		@card = Card.new("2 Spades", 2)
	end

	def test_initialize
		assert_equal("2 Spades", @card.name)
		assert_equal(2, @card.value)
	end

	def test_to_s
		assert_equal("2 Spades", @card.to_s)
	end

	def test_generate_numbered_card
		assert_equal("3 Hearts", Card.generate_numbered_card("Hearts", 3).to_s)
	end

	def test_generate_face_card
		assert_equal("10 Jack of Hearts", Card.generate_face_card("Hearts", "Jack").to_s)
	end

	def test_generate_ace_card
		assert_includes(["1 Ace of Hearts", "11 Ace of Hearts"], Card.generate_ace_card("Hearts").to_s)
	end
end