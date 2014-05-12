class Board
  attr_reader :game_over
  
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
    @game_over = false
  end
    
  def [](pos)
    x = pos[0]
    y = pos[1]
    @board[x][y]
  end
    
  def update_board(move)
    x, y = move[1..2]
    cmd = move[0]
    
    if cmd == "f"
      @board[x][y].status = @board[x][y].status == :flagged ?  :covered : :flagged 
    end
    
    if cmd == "u"
      uncover([x, y])
    end
  end
  
  def uncover(pos)
    
    if @board[pos[0]][pos[1]].bombed
      uncover_all
      @game_over = true
      
    else
      queue = [pos]
      all_seen_tiles = [pos]
      
      until queue.empty?
        a, b = queue.shift
        current_tile = @board[a][b]
        if current_tile.num_adj.zero?
          current_tile.status = :interior
        else
          current_tile.status = :uncovered
        end
        current_neighbors = neighbors(pos).select do |pos|
          !all_seen_tiles.include?(pos)
        end
        if current_neighbors.all? { |a, b| !@board[a][b].bombed }
          queue += current_neighbors
          all_seen_tiles += current_neighbors
        end
      end
      
      neighbors(pos)
      
      
    end
    
  end
  
  def all_uncovered?
    @board.flatten.none? { |tile| tile.status == :covered }
  end
  
  def uncover_all
    puts "   0  1  2  3  4  5  6  7  8 "
    @board.each_with_index do |row, row_num|
      row.map! do |element|
        
        if element.bombed
          
          if element.status == :flagged
            
            "[F]"
            
          else
            
            "[!]"
            
          end
      
       
        elsif element.num_adj.zero?
         
           "[_]"
         
         else
         
           "[#{element.num_adj}]"
         
         end

      end     
      
      print row_num, " ", row.join(""), "\n" 
    end
  end


  
  def make_board(size)
    
    @board = Array.new(size) do 
      Array.new(size) do         
        Tile.new
      end
    end
    
    determine_adjacencies
    
    
  end
  
  def print_board
    pr_row = []
    puts "   0  1  2  3  4  5  6  7  8 "
    @board.each_with_index do |row, row_num|
      pr_row = row.map do |element|
        
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
      print row_num, " ", pr_row.join(""), "\n" 
      
    end
  end
  
  def determine_adjacencies
    @board.each_with_index do |line, row| 
      line.each_index do |col| 
        bomb_num = neighbors([row, col]).count { |a, b| @board[a][b].bombed}
        @board[row][col].num_adj = bomb_num
      end
    end
  end
  
  def neighbors(pos)
    neighs = []
    ADJACENTS.each do |x, y| 
      a = pos[0] + x
      b = pos[1] + y
      range = (0 ... @board.count)
      on_board = range.include?(a) && range.include?(b)
      neighs << [a, b] if on_board
    end
    
    neighs
  end
end
