class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		generate_deck
	end

	def generate_deck
		Card::SUITS.each do |suit|
			Card::NUMBERED_VALUES.each { |val| @cards << Card.generate_numbered_card(suit, val) }
			Card::FACE_CARDS.each { |val| @cards << Card.generate_face_card(suit, val) }
			@cards << Card.generate_ace_card(suit)
		end
	end

	def shuffle
		@cards.shuffle!
	end
end
