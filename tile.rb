class Tile
  
  attr_reader :bombed
  attr_accessor :num_adj, :status
  
  def initialize(bomb_present = false)
    @bombed = random unless bomb_present
    @status = :covered
    # other statuses include :flagged, :interior, and :uncovered
    # num_adj is the number of adjacent bombs
  end
  
  def random
    rand(9) == 0
  end
   
end
