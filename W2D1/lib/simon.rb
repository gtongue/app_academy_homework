class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1
  end

  def play
    until(@game_over)
      take_turn 
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      @sequence_length += 1      
      round_success_message unless @game_over     
    end
  end

  def show_sequence
    add_random_color        
    system('clear')
    @seq.each do |color|
      puts color.to_s
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    puts "Please enter each color ('r', 'g', 'b', 'y')in the order they appeared (hit enter after every input)"
    @sec.each do |color|
      input = gets.chomp
      if input[0] != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    color = COLORS.sample
    @seq << color
  end

  def round_success_message
    "Round successfull!"
  end

  def game_over_message
    "You lost!"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
