class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    @sequence_length += 1
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      p color
      sleep(0.5)
      system('clear')
      sleep(0.1)
    end
  end

  def require_sequence
    print "Type out entire sequence with spaces in between"
    print "Valid color names: red, blue, green, yellow"
    print "Your guess > "
    guess = gets.chomp.split(' ')
    @game_over = true unless guess == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Good job! AND NOW WE DO IT AGAIN"
  end

  def game_over_message
    "RIP, gg re"
  end

  def reset_game
    initialize
  end
end
