require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/carl_computer'
require './lib/turn'

class Game
  attr_reader :cruiser,
              :submarine,
              :board,
              :carl_board
              # :turn

  def initialize(board)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @carl_board = Board.new
    @carl_computer = CarlComputer.new(carl_board)
    # @turn = Turn.new
  end

  def start
    welcome_message
    play_or_quit_input
    begin_or_end_game
    @board.render
  end

  def play_or_quit_input
    until @player_input == 'p' || @player_input == 'q'
      game_start_error
      welcome_message
    end
  end

  def begin_or_end_game
    if @player_input == 'p'
      player_placement
    elsif @player_input == 'q'
      quit_message
    end
  end

  def welcome_message
    puts "💥 Welcome to BATTLESHIP 💥"
    puts "Enter 'p' to play or 'q' to quit (but why would you??)"
    print "> "
    @player_input = input.downcase #trim? This get's rid of white space as if there's a space after 'q'
  end

  def game_start_error
    puts " "
    puts "❌⛔️ Please try again. Did you mean 'p' for play or 'q' for quit? ⛔️❌"
    puts " "
  end

  def player_placement
    @carl_computer.computer_place_ship(@cruiser)
    @carl_computer.computer_place_ship(@submarine)
    puts '' ''
    puts @carl_board.render(true)
    puts @carls_placed_board

    placement_instructions
    unless board.valid_placement?(cruiser, @player_input)
      invalid_coordinates
    end

    until board.valid_placement?(cruiser, @player_input)
      placement_instructions
      unless board.valid_placement?(cruiser, @player_input)
        invalid_coordinates
      end
    end

    board.place(cruiser, @player_input)

    submarine_prompt
    unless board.valid_placement?(submarine, @player_input)
      invalid_coordinates
    end

    until board.valid_placement?(submarine, @player_input)
      submarine_prompt
      unless board.valid_placement?(submarine, @player_input)
        invalid_coordinates
      end
    end

    board.place(submarine, @player_input)
    @players_layout = @board.render(true)
    puts @players_layout

    ready_to_play
    take_turn
  end

  def input
    gets.chomp
  end
  #
  # def name_input
  #   gets.chomp
  # end

  # def player_name
  #   puts " "
  #   puts "That's the spirit! Now enter your name to get started."
  #   print ">  "
  #   @name_input = name_input.upcase.split
  # end

  def placement_instructions
    puts " "
    puts "Ahoy Captain !" # Insert player name
    puts " "
    puts "Alrighty, I've placed my ships on my board." #add Carl's name
    puts "Now it's your turn!"
    puts " "
    puts "Your ships are The Cruiser and The Submarine."
    puts "The Cruiser takes 3 coordinates, and The Submarine takes 2 coordinates."
    puts "Please enter your coordinates as such: A1 B1 C1"
    puts "(Alphabetically or sequentially, and with a space in between.)"
    puts "Oh right! Also, your ships must lay on a horizontal or vertical axis."
    puts "             -Phew!- Almost forgot to tell you that!"
    puts " "
    puts @board.render(true)
    cruiser_prompt
  end

  def cruiser_prompt
    puts " "
    puts "Enter the coordinates for the Cruiser (remember its 3 consecutive units)"
    print "> "
    @player_input = input.upcase.split
  end

  def submarine_prompt
    puts " "
    puts @board.render(true)
    puts " "
    puts "Enter the coordinates for the Submarine (remember its 2 consecutive units)"
    print "> "
    @player_input = input.upcase.split
    puts " "
  end

  def invalid_coordinates
    puts " "
    puts "Whoops! Those coordinates aren't valid, please try again!"
  end

  def quit_message
    puts "Oh bummer, you're all done."
  end

  def ready_to_play
    puts " "
    puts "~ " * 14
    puts "⛵️ 💣 " "NOW LET'S PLAY!" " 💣 ⛵️"
    puts "~ " * 14
  end

  def take_turn
      carlcomputer_game_board
      players_game_board
      @player_shot = input.downcase

      until @player_shot == 'q'
     carl_fires
     puts @board.render(true)
     @player_shot = input.upcase
     player_fires
   end
  end

  def carlcomputer_game_board
    puts " "
    puts "🔥" " CARL THE COMPUTER'S BOARD " "🔥"
    puts @carl_board.render
    puts " "
  end

  def players_game_board
    puts "🔥" " CAPTAIN (player_name's) BOARD " "🔥"
    @players_layout
    puts @board.render(true)
    puts " "
    puts "Take your shot at Carl's ships!"
    print "> "
  end
end
  # pick a winner from a list
