class Game
  attr_accessor :wrong_arr, :correct_arr, :code, :draw
  FILENAME = "google-10000-english-no-swears.txt"
  
  def initialize
    @code = "temporarly"
    reset
  end

  def get_char
    @guess = ""
    until @guess.match?(/\A[a-zA-Z]\z/)
      print "Enter a new single english letter: "
      @guess = gets.chomp.downcase
    end
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