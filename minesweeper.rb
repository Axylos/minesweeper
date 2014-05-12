#!/usr/bin/env ruby
require "debugger"
require "./tile.rb"
require "./board.rb"
require "yaml"

class Minesweeper
  
  def initialize(board)
    @board = board
  end
  
  def run
    puts "Welcome to Minesweeper!"
    over = false
    
    until over
      
      @board.print_board
      move = get_input
      
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
  
  def get_input
    puts "Please enter a position and a command. E.g. f 1, 2; u 2 1"
    puts "Enter s to break and save"
    input = gets.chomp
    
    command = input.scan(/[fus]/)
    pos = input.scan(/\d+/).map(&:to_i)
    
    command + pos
  end
  
end

if $PROGRAM_NAME == __FILE__
  
  board = Board.new(9)
  user = User.new
  Minesweeper.new(board, user).run
  
end

