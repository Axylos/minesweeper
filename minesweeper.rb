class Minesweeper
  
  def initialize(board, user)
    @board = board
    @user = user
  end
  
end

class Board
  
  ADJACENTS = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]
  def initialize(size)
    @board = make_board(size)
  end
  
  def [](pos)
    x, y = pos[0], pos[1]
    @board[x][y]
  end
    
  def make_board(size)
    
    board = Array.new(size) do 
      Array.new(size) do         
        Tile.new
      end
    end
    
    board.determine_adjacencies
    
    board
  end
  
  def print_board
    @board.each do |row|
      row.map do |element|
        
        if element.status == :covered
          "[*]"
        else
          if element.status == :interior
            "[_]"
          elsif element.status == :flagged
            "[F]"
          else
            "[#{element.num_adj}]"
          end  
        end
      
          
      end
      
      puts
    end
  end
  
  def determine_adjacencies
    @board.
  end
  
  def neighbors(pos)
    MOVES.map do |x, y| 
      pos[0] + x, pos[1] + y
    end
  end
end

class Tile
  attr_reader :status
  attr_accessor :num_adj
  
  def initialize(bomb_present = false)
    @bombed = random unless bomb_present
    @status = :covered
    
  end
  
  def random
    rand(3) == 0
  end
  

    
  
  
  
  
  
end

class User
  
  
end

