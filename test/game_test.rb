require 'minitest/autorun'
require_relative './test_helper.rb'

class GameTest < Minitest::Test
	def setup
		@game = Game.new
		@players = @game.players
	end

	def test_initialize
		refute_nil(@game.instance_variable_get(:@deck))
		refute_nil(@game.instance_variable_get(:@player))
		refute_nil(@game.instance_variable_get(:@dealer))
		refute_nil(@game.instance_variable_get(:@players))

		refute(@game.game_over)
	end

	def test_deal_initial_cards
		@players.each { |player| assert_equal(0, player.hand.count) }
		@game.deal_initial_cards
		@players.each { |player| assert_equal(2, player.hand.count) }
	end

	def test_end_game
		@players.each do |player|
			assert_output(/#{"#{player.to_s} has a score of #{player.score}"}/) do
				@game.end_game
			end
		end
	end
end