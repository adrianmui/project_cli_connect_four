
# Pseudocode
  # Set up the game initially 
  #     Create a game board
  #     Create Players(2)
  # Start the game loop
  #     Render the board
  #     Ask for and validate current player move
  #     Update board 
  #     Check for game over conditions
  #       if the game should end 
  #         Display the proper victory/loss message
  #         break looping
  #       else
  #           Switch to the ne[_]t player and keep looping

  # Classes:
  #     1. Game (itself)
  #     2. Player 
  #         2.5.  Human < Player
  #         2.6.  Computer < Player
  #     3. Board

#board.rb
class Board

 #   [_] [_] [_] [_] [_] [_] [_]  
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #    1   2   3   4   5   6   7    

#data = {  1 => [ :o, :o, :clear ,  :clear,  _ , _  ] ,  2 => [].... }

  def initialize
    @NUM_ROWS = 6
    @NUM_COLS = 7
    #set up data structure
    @game_board = {}
    create_board_structure
    # set up a hash (keys: 1-7) to contain arrays
    # assign 7 arrays of length 6 into hash
    #   fill the array with key:value ( clear => [_] )
   
  end

  def render
    render_hash = { :o => "[o]", :x => "[x]", :clear => "[_]" }
    # loop through data structure
    @NUM_ROWS.downto(1) do |row|
      @NUM_COLS.times do |col|
        print "#{render_hash[ @game_board[col + 1][row - 1] ]} "
      end
      puts
    end

    @NUM_COLS.times { |col| print " #{col + 1}  " }
    puts
  end

  def add_piece(column, piece)
    return false if column_full?(column)

    row = nil

    @game_board[column].each_index do |index|
      row ||= index if @game_board[column][index] == :clear  
    end
    
    @game_board[column][row] = piece
    true
  end

  def column_full?(column)
    @game_board[column][-1] != :clear
  end

  def full?
    @NUM_COLS.times do |col|
      return false unless column_full?(col + 1)
    end

    true
  end

  def winning_combination?
    four_in_a_row?(diagonals) ||
    four_in_a_row?(verticals) ||
    four_in_a_row?(horizontals)
  end

  def four_in_a_row?(sequences)

  end

  def diagonals
    # return array of diagnols
  end

  def verticals
    @game_board.
  end

  def horizontals
    horizontals = []
    @NUM_ROWS.downto(1) do |row|
      row_array = []
      @NUM_COLS.times do |col|
        row_array << @game_board[col + 1][row - 1]
      end
      horizontals << row_array
    end
    horizontals
  end

  def create_board_structure
    7.times do |count|
      @game_board[count + 1] = Array.new(6, :clear)
    end
  end
end

#### testing
class Board
  attr_reader :game_board
  
end


