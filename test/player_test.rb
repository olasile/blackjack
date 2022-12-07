require 'minitest/autorun'
require_relative './test_helper.rb'

class PlayerTest < Minitest::Test
	def setup
		@game = Game.new
		@player = Player.new(@game)
	end

	def test_valid_command
		assert(@player.valid_command?(Player::COMMANDS[0]))
		assert(@player.valid_command?(Player::COMMANDS[1]))
		refute(@player.valid_command?('invalid_command'))
	end
end