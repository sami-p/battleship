require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/carl_computer'
require './lib/turn'

class Game
  attr_reader :cruiser,
                   :submarine,
                   :board,
                   :carl_computer
                   # :turn

  def initialize #(board)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    carl_board = Board.new
    @carl_computer = CarlComputer.new(carl_board)
    # @turn = Turn.new
    # @carls_shots = @carl_computer.cells.keys
    @player_shots = @board.cells.keys
  end

  def start
    welcome_message
    play_or_quit_input
    begin_or_end_game
    @board.render
  end

  def play_or_quit_input
    until @player_input == 'p' || @player_input == 'q'
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
# Have an else to catch if it doesn't catch anything, let the user know what it doesn't read that

  def player_placement
    @carl_computer.computer_place_ship(@cruiser)
    @carl_computer.computer_place_ship(@submarine)
    puts '' ''
    puts @carl_computer.carl_board.render(true)
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
    puts @board.render(true)
    ready_to_play
    take_turn
  end

  def take_turn
    carlcomputer_game_board
    players_game_board
    @player_shot = input.upcase
    carl_fires
    carlcomputer_game_board
    players_game_board
    player_fires

    until @player_shot == 'q'
      carl_fires
      carlcomputer_game_board
      players_game_board
      @player_shot = input.upcase
      player_fires
    end
  end

  def input
    gets.chomp
  end

  def placement_instructions
    puts " "
    puts "Alrighty, I've placed my ships on my board." #add Carl's name
    puts "Now it's your turn!"
    puts " "
    puts "Ahoy Captain !" # Insert method to take captain name. Move to sooner line
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

  def carl_fires
    guess = @carl_computer.carl_shots.sample
    @board.cells[guess].fire_upon
    @carl_computer.carl_shots.delete(guess)
  end

  def player_fires
    @carl_computer.carl_board.cells[@player_shot].fire_upon
    @player_shots.delete(@player_shot)
  end

  def carlcomputer_game_board
    puts " "
    puts "🔥" " CARL THE COMPUTER'S BOARD " "🔥"
    puts @carl_computer.carl_board.render(true)
    puts " "
  end

  def players_game_board
    puts "🔥" " CAPTAIN (player_name's) BOARD " "🔥"
    puts @board.render(true)
    puts " "
    puts "Take your shot at Carl's ships!"
    print "> "
  end
end
