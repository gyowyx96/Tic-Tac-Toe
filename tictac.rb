
class Tictactoe 

    
  public

  def initialize()    
    print "Enter first player username: "
    @player_one = gets.chomp.capitalize!
    print "Enter second player username: "
    @player_two = gets.chomp.capitalize!    
    check_username
  end

  def play_game
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_player = @player_one
    @win = "false"
    display_board
    play_round while @win == "false"
    replay        
  end

  private

  def display_board
    puts "\n"
    puts ["#{@board[0]} | #{@board[1]} | #{@board[2]}"]
    puts separator = "-----------"
    puts ["#{@board[3]} | #{@board[4]} | #{@board[5]}"]
    puts separator
    puts ["#{@board[6]} | #{@board[7]} | #{@board[8]}"]
    puts "\n"
  end

  def play_round
    if @current_player == @player_one
      player_input      
      @board[@index] = "X"
      @current_player = @player_two      
    else  
      player_input
      @board[@index] = "O"
      @current_player = @player_one
    end
    display_board      
    win? 
    check_draw 
  end

  def update_win_combination
    @win_combination = [[@board[0], @board[1], @board[2]], [@board[0], @board[3], @board[6]], 
                        [@board[0], @board[4], @board[8]], [@board[1], @board[4], @board[7]], 
                        [@board[2], @board[5], @board[8]], [@board[3], @board[4], @board[5]], 
                        [@board[6], @board[7], @board[8]], [@board[6], @board[4], @board[2]]
                       ]
  end

  def win?
    update_win_combination
    @win_combination.each do |combination|
      if combination.all? {|value| value == "X"}
        puts "#{@player_one} won, nice!"
        @win = "true"
        return
      end
      if combination.all? {|value| value == "O"}
        puts "#{@player_two} won, nice!"
        @win = "true"
        return
      end
    end
  end

  def player_input
    print "Choose where you wanna put your mark #{@current_player}: "
    index = gets.chomp.to_i
    if @board.include?(index)
      @index = index - 1
      
    else
      puts "Enter a valid spot #{@current_player}!"
      return player_input
    end
  end

  def check_username
    if @player_two == @player_one
      print "Enter a different username player two: " 
      @player_two = gets.chomp.capitalize!
      check_username
    end
  end

  def check_draw
    if @board.all? {|value| value.class == String}
      puts "IT'S A DRAW !" 
      @win = "true"
      return @win
    end
  end      

  def replay 
    puts "Do you wanna play again? Y/N"
    asked_input = gets.chomp.capitalize!
    play_game if asked_input == "Y"
    puts "It's been a pleasure to play with you bye bye !" if asked_input == "N"
  end
end

game = Tictactoe.new
game.play_game

