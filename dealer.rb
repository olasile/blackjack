class Dealer < Player
	def must_hit?
		score < Game::FORCE_DEALER_HIT_THRESHOLD
	end

	def to_s
		'Dealer'
	end

	def valid_command?(command)
		if must_hit?
			command == COMMANDS[0]
		else
			super
		end
	end
end