class User
  
  def get_input
    puts "Please enter a position and a command [f 1, 2]"
    input = gets.chomp
    
    command = input.scan(/[fu]/)
    pos = input.scan(/\d+/).map(&:to_i)
    
    command + pos
  end
  
end
