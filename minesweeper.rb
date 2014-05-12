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
  
end

class Tile
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

