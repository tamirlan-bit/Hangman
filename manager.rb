class Manager
   attr_accessor :game, :draw
   
  def initialize    
    @game = game
    @draw = draw
  end

  def save_stack
    p game.code
    p game.correct_arr
    p game.wrong_arr
    p draw.hangman    
    temp = gets
  end
  
  def resume_game
    draw.clear_screen
    puts "Game Resumed"
    game.game_turns
  end

  def save_game
    data = {
      code: game.code,
      correct_arr: game.correct_arr,
      wrong_arr: game.wrong_arr,
      hangman: draw.hangman
    }
    File.write("savegame.json", JSON.pretty_generate(data))
    puts "Game saved"
    draw.pause
  end

  def load_game
    data = JSON.parse(File.read("savegame.json"))
    game.code = data["code"]
    game.correct_arr = data["correct_arr"]
    game.wrong_arr = data["wrong_arr"]
    draw.hangman = data["hangman"]
    puts "Game Loaded"
    draw.pause
  end

  def new_game
    loop do
      draw.clear_screen
      draw.reset
      game.reset    
      game.get_word(game.random_word)
      result = game.game_turns
      break if result == :menu
    end
  end
   
  def replay
    print "\nPlay again? "
    replay_choice = gets.chomp.downcase
    return :restart if replay_choice == 'y' || replay_choice =='yes'
    return :menu
  end

end
