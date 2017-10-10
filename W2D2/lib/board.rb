class Board
  attr_accessor :cups
  
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times {cup << :stone}
    end
  end
  
  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Invalid starting cup" if @cups[start_pos].empty?    
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until stones.empty?
      i+=1
      i = 0 if i > 13
      if i == 6
        @cups[i] << stones.pop if current_player_name == @name1          
      elsif i == 13
        @cups[i] << stones.pop if current_player_name == @name2          
      else
        @cups[i] << stones.pop
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all? {|cup| cup.empty?}  || @cups[7..13].all? {|cup| cup.empty?}
  end

  def winner
    player_1 = @cups[6].length
    player_2 = @cups[13].length
    if player_1 == player_2
      :draw
    else
      if player_1 > player_2 
        @name1
      else
          @name2
      end
    end
  end 
end
