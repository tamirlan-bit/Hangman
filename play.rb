class Play
  attr_accessor :wrong_arr, :correct_arr, :code, :draw

  def initialize (word)
    @code = word
    puts "Guess The word!"
    @correct_arr = []
    @wrong_arr = []
  end

  def get_char
    puts "Enter Character:"
    @guess = gets.to_s.chomp.downcase
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

end