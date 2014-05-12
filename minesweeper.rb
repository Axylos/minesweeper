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
      
      if move[0] == "s"
        save_and_quit
        return
      end
      
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
  
  def save_and_quit
    
    File.open("minesweepergame.txt", "w") do |f|
      f.puts @board.to_yaml
    end
    
  end
  
end

if $PROGRAM_NAME == __FILE__
  load_file = YAML::load(File.open("minesweepergame.txt"))
  
  board = load_file || Board.new(9)

  Minesweeper.new(board).run
  
end

