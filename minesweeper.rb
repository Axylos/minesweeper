#!/usr/bin/env ruby
require "debugger"
require "./tile.rb"
require "./board.rb"
require "./user.rb"

class Minesweeper
  
  def initialize(board, user)
    @board = board
    @user = user
  end
  
  def run
    puts "Welcome to Minesweeper!"
    over = false
    
    until over
      
      @board.print_board
      move = @user.get_input
      
      @board.update_board(move)
      
      over = game_over?
      
    end
    
    if over == :lost 
      puts "You lost!" 
    else
      puts "You won!"
      @board.print_board
    end
    
    
  end
  
  def game_over?
    if @board.game_over
      return :lost
    elsif @board.all_uncovered?
      return :won
    else 
      false
    end
  end
  
    
  
end

if $PROGRAM_NAME == __FILE__
  
  board = Board.new(2)
  user = User.new
  Minesweeper.new(board, user).run
  
end

