class Minesweeper
  
  def initialize(board, user)
    @board = board
    @user = user
  end
  
end

class Board
  
  def initialize(size)
    @board = make_board(size)
  end
  
  def make_board(size)
    
    board = Array.new(size) do 
      Array.new(size) do         
        Tile.new
      end
    end
    
    board
  end
  
  def print_board
    @board.each do |row|
      row.each_index do |element|
        
        if element.status == :covered
          "[ ]"
        elsif element.status == :revealed
        elsif
          
      end
    end
  end
  
end

class Tile
  attr_reader :status
  def initialize(bomb_present = false)
    @bomb_present = random unless bomb_present
    @status = :covered
  end
  
  def random
    rand(3) == 0
  end
  
end

class User
  
  
end

