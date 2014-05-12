#!/usr/bin/env ruby
require "debugger"
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
    x = pos[0]
    y = pos[1]
    @board[x][y]
  end
    
  def make_board(size)
    
    @board = Array.new(size) do 
      Array.new(size) do         
        Tile.new
      end
    end
    
    determine_adjacencies
    
    print_board
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
      b= pos[1] + y
      on_board = a.between?(0, @board.count) && b.between?(0, @board.count)
      neighs << [a, b] if on_board
    end
    
    neighs
  end
end

class Tile
  attr_reader :status, :bombed
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


if $PROGRAM_NAME == __FILE__
  
  board = Board.new(9)
  
end

