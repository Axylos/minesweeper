class Minesweeper
  
  def initialize(board, user)
    @board = board
    @user = user
  end
  
end

class Board
  
  def initialize(size)
    
  end
  
  
end

class Tile
  def initialize(bomb_present = false)
    @bomb_present = bomb_present
    @status = :covered
  end
  
end

class User
  
  
end

