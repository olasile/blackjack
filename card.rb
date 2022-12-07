class Card
	# CARD_TYPES = %w[face number ace].freeze
	SUITS = %w[Spades Hearts Diamonds Clubs].freeze
	FACE_CARDS = %w[Jack Queen King].freeze
	FACE_CARD_VALUE = 10
	NUMBERED_VALUES = (2..10).to_a

	attr_accessor :name, :value

	def initialize(name, value)
		@name = name
		@value = value
	end

	def to_s
		name
	end

	class << self
		def ace_number
			[1, 11].sample
		end

		def generate_numbered_card(suit, val)
			new("#{val} #{suit}", val)
		end

		def generate_face_card(suit, val)
			new("#{Card::FACE_CARD_VALUE} #{val} of #{suit}", Card::FACE_CARD_VALUE)
		end

		def generate_ace_card(suit)
			ace_value = ace_number
			new("#{ace_value} Ace of #{suit}", ace_value)
		end
	end
end