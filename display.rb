class Draw

  def initialize
    puts "we in Draw class"
  end

  def display    
    puts <<~HANGMAN

~~ The Hangman Game ~~

     ┌───────┐      | 
     │       O      |   Code: #####
     │      /|\\     |
     │      / \\     |   Wrong:
     │              |
  ───┴───────       

    HANGMAN
  end

  def clear_screen
    system("clear") || system("cls")
  end

end
   

