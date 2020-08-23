class GuessingGame
  attr_accessor :num_attempts
  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    puts 'too big' if num > @secret_num
    puts 'too small' if num < @secret_num
    return unless num == @secret_num

    @game_over = true
    puts 'you win'
  end

  def ask_user
    print 'enter a number: '
    check_num(gets.chomp.to_i)
  end
end
