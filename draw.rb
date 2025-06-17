class Draw
  attr_accessor :hangman, :hangman_parts, :play

  def initialize
    @hangman_parts = ["┌───────┐","O","|","/","\\","/","\\"]
    @hangman = ["         "," "," "," "," "," "," "]
    
  end

  def display 
    code_display
    wrong_guess_display
    puts "Class Play code is :#{@play.code}"
    puts <<~HANGMAN

~~ The Hangman Game ~~

     #{@hangman[0]}      | 
     │       #{@hangman[1]}      |   Word: #{@secret}"
     │      #{@hangman[3]}#{@hangman[2]}#{@hangman[4]}     |
     │      #{@hangman[5]} #{@hangman[6]}     |   Wrong guesses: \e[1m#{@wrong_guess}\e[0m
     │              |
  ───┴───────       

    HANGMAN
  end  

  def code_display
    @secret = @play.code.split("").map do |char| 
      if !@play.correct_arr.include?(char)
        char = "-"
      else
        char
      end
    end
    @secret = @secret.join
  end

  def wrong_guess_display
    @wrong_guess = @play.wrong_arr.map { |char| char + " " }.join
  end

  def clear_screen
    system("clear") || system("cls")
  end

end
   



