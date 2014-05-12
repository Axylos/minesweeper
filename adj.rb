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

@board = Array.new(9)

def neighbors(pos)
  neighs = []
  ADJACENTS.each do |x, y| 
    a = pos[0] + x
    b = pos[1] + y
    
    range = (0 ... @board.count)
    
    on_board = range.include?(a) && range.include?(b)
    p [a, b]
    p on_board
    neighs << [a, b] if on_board
  end
  
  neighs
end

p neighbors([0, 0])