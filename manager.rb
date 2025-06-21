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
    File.write("code.json", game.code.to_json)
    File.write("correct_arr.json", game.correct_arr.to_json)
    File.write("wrong_arr.json", game.wrong_arr.to_json)
    File.write("hangman.json", draw.hangman.to_json)
    puts "Game saved"
  end
  
  def load_game
    game.code = JSON.parse(File.read("code.json"))
    game.correct_arr = JSON.parse(File.read("correct_arr.json"))
    game.wrong_arr = JSON.parse(File.read("wrong_arr.json"))
    draw.hangman = JSON.parse(File.read("hangman.json"))
    puts "Game Loaded"
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