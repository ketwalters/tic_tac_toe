class Game

def initialize
    @board = ["","","","","","","","",""]
end    

def first
    first = ["X", "Y"].sample
    return first
end

def move
   array = []
   array << first
    while array.length >= 9 || !winner 
      if array[-1] == "O"
        puts "Your move X"
        array << "X"
        num  = gets.chomp.to_i
        @board[num] << "X"
        display
      else
        if array[-1] == "X"
          puts "Your move O"
          array << "O"
          num  = gets.chomp.to_i
          @board[num] << "O"
          display
        end
      end
    end
end

def display
    puts "\n"
        @board.each_slice(3) { |row| puts row.join(' | ') }
    puts "\n"
end

def winner
  if @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != ""
    puts "#{@board[0]} won!" 
    exit
  elsif @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != ""
    puts "#{@board[3]} won!" 
    exit
  elsif @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != ""
    puts @board[6] 
    exit
  elsif @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != ""
    puts @board[0] 
    exit
  elsif @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != ""
    puts @board[1] 
    exit
  elsif @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != ""
    puts @board[2] 
    exit
  elsif @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != ""
    puts @board[0] 
    exit
  else
    if @board[2] == @board[4] && @board[4] == @board[6] && @board[2] != ""
      puts @board[2] 
      exit
    end
  end
end

end


a = Game.new
a.move




