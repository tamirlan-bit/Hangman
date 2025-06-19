class Play
  attr_accessor :wrong_arr, :correct_arr, :code, :draw

  def initialize
    @code = "temporarly"
    reset
  end

  def get_char
    puts "Enter single character:"
    @guess = gets.to_s.chomp.downcase
  end

  def get_word (word)
    @code = word
  end

  def check_char
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

  def win?
    @correct_arr.length == @code_arr.length
  end   
  
  def reset    
    @correct_arr = []
    @wrong_arr = []
  end

  def replay (word)
    puts "\n\nWould you like Another Game?\nPress 'Y' for Yes and 'N' for No"
    re = gets.chomp.downcase
    if re == 'y' || re =='yyes' 
      reset
      get_word(word)      
      draw.clear_screen
      draw.reset
      draw.display      
    else
      puts "\n(ノಠ益ಠ)ノ彡┻━┻\n\n"
      exit
    end
  end

end