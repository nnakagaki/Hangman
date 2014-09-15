class Hangman
  MAX_GUESSES = 8
  def initialize(guesser,referee)
    @guesser, @refereee = guesser, referee
		@remaining_guesses = MAX_GUESSES
  end
	
	def play
		secret_word = @referee.choose_word
		@guesser.give_length(secret_word)
		
		until guesser.won? || @remaining_guesses < 0
			guess = @guesser.make_guess
			check = @referee.check_guess(guess)
			@remaining_gues -= 1
		end
	end
end

class HumanPlayer
	def initialize
		@progress = ""
	end
	
	def choose_word
		puts "Choose a word!"
		word = gets.chomp
	end
	
	def give_length(word)
		l = word.length
		@progress = "_" * l
		puts "Length of the word is #{l}: #{@progress}"
	end
	
	def make_guess
		puts "Guess a letter!"
		letter = gets.chomp
	end
	
	def check_guess(guess)
		puts "Is #{guess} in your word? (y/n)"
		exists = gets.chomp.downcase
		if exists == y
			puts "In which locations?"
			location = gets.chomp
		else
			[]
		end
	end
end

class ComputerPlayer
	def initialize
		@dictionary = File.readlines("dictionary.txt").map(&:chomp)
		@progress = ""
	end
	
	def choose_word
		@dictionary.sample
	end
	
	def give_length
		l = word.length
		@progress = "_" * l
	end
	
	def make_guess
		("a".."z").sample
	end
	
end