class Game
  attr_accessor :board

  def initialize
    @board = ["","","","","","","","",""]
    @human = nil
    @computer = nil
  end

  def choose
    array = []
    puts "Choose X or O"
    mark = gets.chomp 
    if mark == "X"
      @human = mark
    else
      @human = "O"
    end

    if mark == "O"
      @computer = "X"
    else
      @computer = "O"
    end

    array << mark
    array.join
  end

  def move
   array = []
   choose
   puts "Would like to go first"
   first = gets.chomp
   if first == "Yes"
    array << @computer
  else
    if first == "No"
      array << @human
    end
  end
    while array.length >= 9 || !winner 
      if array[-1] == @computer
        puts "Your move #{@human}"
        array << @human
        num = gets.chomp.to_i
        @board[num] << @human
        display
      else
        if array[-1] == @human
          puts "Your move #{@computer}"
          array << @computer
          ai(@computer)
          display
        end
      end
    end
  end

  def ai(player)
    #choose random number
    #check if random number is available on board
    #if not choose another random number
    num1 = rand(0...10)
    while @board[num1] != ""
      num1 = rand(0...10)
    end
    while @board[num1] == ""
      @board[num1] << player
    end
  end

  def display
    puts "\n"
        @board.each_slice(3) { |row| puts row.join(' | ') }
    puts "\n"
  end

  def winner
    if @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != ""
      puts "#{@board[0]} You won!" 
      exit
    elsif @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != ""
      puts "#{@board[3]} You won!" 
      exit
    elsif @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != ""
      puts "#{@board[6]} You won!"
      exit
    elsif @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != ""
      puts "#{@board[0]} You won!"
      exit
    elsif @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != ""
      puts "#{@board[1]} You won!"
      exit
    elsif @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != ""
      puts "#{@board[2]} You won!"
      exit
    elsif @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != ""
      puts "#{@board[0]} You won!"
      exit
    else
      if @board[2] == @board[4] && @board[4] == @board[6] && @board[2] != ""
        puts "#{@board[2]} You won!"
        exit
      end
    end
  end
end

a = Game.new
a.move



