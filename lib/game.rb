class Game
  attr_reader :board,
                   :player_input

  def initialize(board)
    @board = Board.new
    @player_input = player_input
  end

  def start
    welcome_message
    @board.render
  end

  def welcome_message
    puts "💥 Welcome to BATTLESHIP 💥"
    puts "Enter 'p' to play or 'q' to quit (but why would you??)"
    print "> "
    @player_input = $stdin.gets.chomp.downcase
    player_placement
  end

  def player_placement
    if @player_input == 'p'
      player_placement_instructions
      puts @board.render(true)
      cruiser_prompt
      @player_input = $stdin.gets.chomp.downcase
    elsif player_input == 'q'
      quit_message
    end
  end

  # Next: need a @player_input that accounts for the coordinates
  # must be able to tell if they are put in correctly - valid_placement?

  #Create a message/method for user to enter sub coordinates
  
  # Create a message/method for user entering an invalid sequence


  def player_placement_instructions
    puts " "
    puts "Alrighty, I've placed my ships on my board."
    puts "Now it's your turn!"
    puts " "
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "Please enter your coordinates alphabetically and sequencially."
    puts "Oh right! Also, your ships must lay on a horizontal or vertical axis."
    puts "             -Phew!- Almost forgot to tell you that!"
    puts " "
  end

  def cruiser_prompt
    puts " "
    puts "Enter the coordinates for the Cruiser (remember its three consecutive units)"
    print "> "
  end

  def quit_message
    puts "Oh bummer, you're all done."
  end
end
