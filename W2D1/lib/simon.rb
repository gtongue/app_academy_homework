class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    add_random_color
  end

  def play

  end

  def take_turn

  end

  def show_sequencesdad
    
  end

  def require_sequence

  end

  def add_random_color
    color = COLORS.sample
    seq << color
    sequence_length += 1
  end

  def round_success_message
    
  end

  def game_over_message

  end

  def reset_game

  end
end
