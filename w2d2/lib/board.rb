require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, num|
      4.times { cup << :stone } unless num == 6 || num == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    curr_cup = start_pos
    until stones.empty?
      curr_cup += 1
      curr_cup = curr_cup % 14
      case curr_cup
      when 6
        @cups[curr_cup] << stones.pop if current_player_name == @name1
      when 13
        @cups[curr_cup] << stones.pop if current_player_name == @name2
      else
        @cups[curr_cup] << stones.pop
      end
    end

    render
    next_turn(curr_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
