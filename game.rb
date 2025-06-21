class Game
  attr_accessor :wrong_arr, :correct_arr, :code, :draw, :manager
  FILENAME = "google-10000-english-no-swears.txt"
  
  def initialize
    @code = "temporarly"
    @manager = manager
    reset
  end

  def get_letter
    @guess = ""
    until @guess.match?(/\A[a-zA-Z]\z/)     
      print "Enter a new single english letter: "
      input = gets.chomp.downcase
      if input == 'menu'
        return :menu
      end
      @guess = input
    end
  end

  def get_word (word)
    @code = word
  end

  def check_letter
    @code_arr = @code.split("")
    @code_arr.uniq!
    if @code_arr.include?(@guess)
      @correct_arr << @guess
      @correct_arr.uniq!
    else
      @draw.hangman[wrong_arr.size] = @draw.hangman_parts[wrong_arr.size]
      @wrong_arr << @guess
      @wrong_arr.uniq!
    end
  end

  def game_turns
    draw.hangman_display
    while wrong_arr.size < 7
      letters = get_letter
        if letters == :menu
          draw.refresh_hangman
          return :menu
        end
      check_letter
      draw.refresh_hangman
     if win?
        draw.refresh_hangman
        puts "\e[1mYou WON! The secret word was indeed #{code}🎉🎉\e[0m"
        replay_result = manager.replay        
        return replay_result
      end  
    end
    puts "\e[1mGame Over! 💀\e[0m"
    puts "The secret word was \e[1m#{code}\e[0m"
    replay_result = manager.replay        
    return replay_result
  end

  def win?
    @correct_arr.length == @code_arr.length
  end   
  
  def reset    
    @correct_arr = []
    @wrong_arr = []
  end

  def random_word
    if File.exist?(FILENAME)
      words = File.readlines(FILENAME).map(&:chomp)
      selected = words.select { |word| word.size > 5 && word.size < 12}
      selected.sample    
    else
      puts "words file wasn't found. Using fallback"
    end
  end
end
