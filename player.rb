class Player
	COMMANDS = %w[hit stay].freeze
	STATUSES = %w[playing won lost].freeze

	attr_accessor :hand

	def initialize(game)
		@hand = []
		@turn_ended = false
		@game = game
		@status = STATUSES[0]
	end

	def hit(cards)
		puts "Hitting #{to_s}"
		@hand += cards
		display_hand
	end

	def blackjack?
		score == Game::BLACKJACK_VALUE
	end

	def bust?
		score > Game::BLACKJACK_VALUE
	end

	def won?
		@status == STATUSES[1]
	end

	def lost?
		@status == STATUSES[2]
	end

	def update_status
		if blackjack?
			puts "#{to_s} has won by blackjack!"
			@status = STATUSES[1]
		elsif bust?
			puts "#{to_s} has busted!"
			@status = STATUSES[2]
		end
	end

	def score
		@hand.inject(0){|sum, card| sum + card.value }
	end

	def play_turn
		loop do
			update_status
			break if game_over?

			display_instructions
			process_input_command
			break if @turn_ended
		end
	end

	def game_over?
		cond = won? || lost?
		@game.game_over = true if cond

		cond
	end

	def to_s
		'Player'
	end

	def display_instructions
		puts "#{to_s}'s turn'"
		puts "Type 'hit' to be dealt a card or 'stay' to end your turn."
	end

	def display_hand
		puts "#{to_s} hand: #{@hand.map(&:name).to_s}"
		puts "#{to_s} score: #{score}"
	end

	def process_input_command
		command = gets.chomp

		loop do
			break if valid_command?(command)
			puts "Invalid command. Type 'hit' or 'stay'. If you are a dealer and your score is less than #{Game::FORCE_DEALER_HIT_THRESHOLD}, you must hit."
			command = gets.chomp
		end

		if command == COMMANDS[0]
			# Hit
			hit(@game.deck.cards.slice!(0, 1))
		elsif command == COMMANDS[1]
			# Stay
			@turn_ended = true
		end
	end

	def valid_command?(command)
		COMMANDS.include?(command)
	end
end