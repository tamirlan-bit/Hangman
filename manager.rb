class Manager
   attr_accessor :game, :draw
  # need to save: draw.hangman, game.code, game.wrong_arr, game.correct_arr

  def initialize (game, draw)
    draw.clear_screen
    @game = game
    @draw = draw
  end   
  
  def save_game
    draw.clear_screen
    puts "Save Game selected"
  end

  def load_game
    draw.clear_screen
    puts "Load Game selected"
  end

   def new_game
    draw.clear_screen
    draw.reset
    game.reset    
    game.get_word(game.random_word)    
    draw.hangman_display
    while game.wrong_arr.size < 1 
      game.get_char
      game.check_char
      draw.clear_screen
      draw.hangman_display
     if game.win?
        draw.clear_screen
        draw.hangman_display
        puts "\e[1mYou WON! The secret word was indeed #{game.code}🎉🎉\e[0m"
        replay(game.random_word)
      end  
    end
    puts "\e[1mGame Over! 💀\e[0m"
    puts "The secret word was \e[1m#{game.code}\e[0m"
    replay(game.random_word)
  end
 
  def replay(word)
    puts "\n\nWould you like Another Game?\n"
    re = gets.chomp.downcase
    if re == 'y' || re =='yes' 
      new_game
    else
      draw.clear_screen
      return
    end
  end

end