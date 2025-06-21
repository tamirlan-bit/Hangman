class Draw
  attr_accessor :hangman, :hangman_parts, :game

  def initialize
    reset    
  end

  def hangman_display 
    code_display
    wrong_guess_display
    # puts "Class Game code is :#{@game.code}"
    puts <<~HANGMAN

~~ The Hangman Game ~~

     #{@hangman[0]}      | 
     │       #{@hangman[1]}      |   Word: #{@secret}
     │      #{@hangman[3]}#{@hangman[2]}#{@hangman[4]}     |
     │      #{@hangman[5]} #{@hangman[6]}     |   Wrong guesses: \e[1m#{@wrong_guess}\e[0m
     │              |
  ───┴───────       

*To go back enter 'menu' instead of a letter

    HANGMAN
  end  

  def menu_display
  puts <<~HANGMAN

~~ The Hangman Game ~~

     ┌───────┐      | 
     │       O      |   Word: SecretWord
     │      /|\\     |
     │      / \\     |   Wrong guesses: _ _ _ _ _ _ _
     │              |
  ───┴───────       

      HANGMAN
    puts "What do you want to do?"
    puts "1. New Game"
    puts "2. Resume Game"
    puts "3. Load Game"
    puts "4. Save Game"
    puts "5. Exit"
    print "> "
  end

  def code_display
    @secret =@game.code.split("").map do |char| 
      if !@game.correct_arr.include?(char)
        char = "-"
      else
        char
      end
    end
    @secret = @secret.join
  end

  def wrong_guess_display
    @wrong_guess =@game.wrong_arr.map { |char| char + " " }.join
  end

  def reset
    @hangman_parts = ["┌───────┐","O","|","/","\\","/","\\"]
    @hangman = ["         "," "," "," "," "," "," "]
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def refresh_hangman
    clear_screen
    hangman_display
  end

end
   



