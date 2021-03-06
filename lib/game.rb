require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/carl_computer'

class Game
  attr_reader :cruiser,
              :submarine,
              :board,
              :carl_computer,
              :player_shots,
              :last_shot_player,
              :last_shot_carl,
              :name_input,
              :cheat

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    carl_board = Board.new
    @carl_computer = CarlComputer.new(carl_board)
    @player_shots = @board.cells.keys
    @cheat = false
  end

  def restart
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    carl_board = Board.new
    @carl_computer = CarlComputer.new(carl_board)
    @player_shots = @board.cells.keys
    start
  end

  def start
    starting_message
    play_or_quit_input
    begin_or_end_game
    @board.render
  end


  def starting_message
    puts "💥 Welcome to BATTLESHIP 💥"
    puts "Hi! I'm Carl the Computer, want to play?"
    puts "Enter 'p' to play or 'q' to quit (but why would you??)"
    print "> "
    @player_input = input.downcase
  end

  def player_placement
    @carl_computer.computer_place_ship(@carl_computer.ship_3)
    @carl_computer.computer_place_ship(@carl_computer.ship_2)

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

    until carlcomputer_ships_sunk || player_ships_sunk
      player_prompt
      @player_shot = input.upcase
      invalid_shot = true

      while invalid_shot == true
        if @player_shot == "CHEATER"
          @cheat = true
          puts "Okay FINE, you can cheat now."
          puts "Put another coordinate in:"
          print "> "
          @player_shot = input.upcase
        elsif @carl_computer.carl_board.valid_coordinate?(@player_shot) == false
          invalid_coordinates
          @player_shot = input.upcase
        elsif @carl_computer.carl_board.cells[@player_shot].fired_upon? == true
          puts "Oops! You've already fired there. Try again and pick a new coordinate!"
          @player_shot = input.upcase
        else
          invalid_shot = false
        end
      end

      player_fires
      carlcomputer_fires
      carlcomputer_game_board
      players_game_board
      carlcomputer_shot_messages
      player_shot_messages
    end
    end_game
  end

  def end_game
    puts " "
    if carlcomputer_ships_sunk
      puts "✨🦊✨" " Captain #{@name_input}! You WON you sly fox, you! " "✨🦊✨"
      puts " "
    elsif player_ships_sunk
      puts "🩸💀🩸" "Welp, I'm the winner. Bummer for you. " "🩸💀🩸"
      puts " "
    end
    restart
  end

  def play_or_quit_input
    until @player_input == 'p' || @player_input == 'q'
      game_start_error
      starting_message
    end
  end

  def input
    gets.chomp
  end

  def begin_or_end_game
    if @player_input == 'p'
      player_name
      player_placement
    elsif @player_input == 'q'
      quit_message
    end
  end

  def quit_message
    puts "Oh bummer, you don't want to play with me."
  end

  def game_start_error
    puts " "
    puts "❌⛔️ERROR: Please try again. Did you mean 'p' to play or 'q' to quit?⛔️❌"
    puts " "
  end

  def player_name
    puts " "
    puts "That's the spirit! Enter your name to get started:"
    print "> "
    @name_input = input.upcase
    puts " "
  end

  def placement_instructions
    puts " "
    puts "Ahoy Captain #{@name_input}!"
    puts " "
    puts "Alrighty, I've moved my ships into position."
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
    puts "❌ Whoops! Those coordinates aren't valid, please try again! ❌"
    print "> "
  end

  def ready_to_play
    puts " "
    puts "🌊" * 19
    puts "⛵️ 💣 " "NOW IT'S TIME FOR BATTLE!" " 💣 ⛵️"
    puts "🌊" * 19
  end

  def carlcomputer_game_board
    puts " "
    puts "☠️ " " CARL THE COMPUTER'S BOARD " "☠️"
    puts @carl_computer.carl_board.render(@cheat)
    puts " "
  end

  def players_game_board
    puts "🏴‍☠️" " CAPTAIN #{name_input} BOARD " "🏴‍☠️"
    puts @board.render(true)
    puts " "
  end

  def player_prompt
    puts " "
    puts "Take your shot at Carl's ships!"
    print "> "
  end

  def player_shot_messages
    if @carl_computer.carl_board.cells[@last_shot_player].render == "Ⓜ️ "
      puts "Your shot at #{@last_shot_player} was a MISS, bummer."
    elsif @carl_computer.carl_board.cells[@last_shot_player].render == "🔥"
      puts "You SUNK MY SHIP! Noooo!!!!"
    elsif @carl_computer.carl_board.cells[@last_shot_player].render == "💥"
      puts "Your shot at #{@last_shot_player} was a HIT. Ouch, that hurts!"
    end
  end

  def carlcomputer_shot_messages
    if @board.cells[@last_shot_carl].render == "Ⓜ️ "
      puts "NOOO! My shot at #{@last_shot_carl} was a MISS."
    elsif @board.cells[@last_shot_carl].render == "🔥"
      puts "I, Carl, SUNK Your SHIP! Muwhahaha!!"
    elsif @board.cells[@last_shot_carl].render == "💥"
      puts "Yay me! My shot at #{@last_shot_carl} was a HIT."
    end
  end

  def carlcomputer_fires
    guess = @carl_computer.carl_shots.sample
    @last_shot_carl = guess
    @board.cells[guess].fire_upon
    @carl_computer.carl_shots.delete(guess)
  end

  def player_fires
    @carl_computer.carl_board.cells[@player_shot].fire_upon
    @last_shot_player = @player_shot
    @player_shots.delete(@player_shot)
  end

  def carlcomputer_ships_sunk
    computer_cells = @carl_computer.carl_board.cells.values.find_all do |cell|
      cell.ship != nil
    end
    computer_cells.all? do |cell|
      cell.ship.sunk?
    end
  end

  def player_ships_sunk
   player_cells = @board.cells.values.find_all do |cell|
     cell.ship != nil
   end
   player_cells.all? do |cell|
     cell.ship.sunk?
    end
  end
end
