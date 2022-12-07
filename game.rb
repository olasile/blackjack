require_relative './card.rb'
require_relative './deck.rb'
require_relative './player.rb'
require_relative './dealer.rb'

class Game
	BLACKJACK_VALUE = 21
	FORCE_DEALER_HIT_THRESHOLD = 17

	attr_accessor :deck, :player, :dealer, :players, :game_over

	def initialize
		@deck = Deck.new
		@player = Player.new(self)
		@dealer = Dealer.new(self)
		@players = [@player, @dealer]
		@game_over = false
	end

	def play
		@deck.shuffle
		deal_initial_cards
		# check_for_initial_winner

		# return if @game_over

		puts "@player about to play turn"

		@player.play_turn
		puts "player has finished playing turn. game_over: #{@game_over}"
		return if @game_over


		puts "@dealer about to play turn"
		@dealer.play_turn
		puts "dealer has finished playing turn. game_over: #{@game_over}"
		return if @game_over

		end_game
	end

	def deal_initial_cards
		puts "Dealing initial cards to players"
		@players.each do |player|
			player.hit(@deck.cards.slice!(0, 2))
		end
	end

	def end_game
		@players.each { |player| puts "#{player.to_s} has a score of #{player.score}" }

		winner = @players.max_by(&:score)
		puts "#{winner.to_s} wins with a score of #{winner.score}"
		@game_over = true
	end

	# def check_for_initial_winner
	# 	@players.each do |player|
	# 		player.update_status
	# 		return if player.game_over?
	# 	end
	# end
end


