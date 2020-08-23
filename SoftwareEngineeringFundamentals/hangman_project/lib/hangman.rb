class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size) { '_' }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.any?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |c, i|
      indices << i if c == char
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1 unless @secret_word.include?(char)
      fill_indices(char, get_matching_indices(char))
    end

    true
  end

  def ask_user_for_guess
    print 'Enter a char: '
    try_guess(gets.chomp)
  end

  def win?
    return false unless @guess_word.join == @secret_word

    puts 'WIN'
    true
  end

  def lose?
    return false unless @remaining_incorrect_guesses.zero?

    puts 'LOSE'
    true
  end

  def game_over?
    return false unless win? || lose?

    print @secret_word
    true
  end
end
