class Play
  attr_accessor :wrong_arr, :correct_arr, :code, :draw
  # attr_reader :code

  def initialize
    @code = "hello"
    puts "Guess The word!"
    @correct_arr = []
    @wrong_arr = []
  end

  def get_char
    puts "Enter Character:"
    @guess = gets.to_s.chomp
  end

  def check_char (turn)
    @code_arr = @code.split("")
    @code_arr.uniq!
    if @code_arr.include?(@guess)
      @correct_arr << @guess
      @correct_arr.uniq!
    else
      puts "#{turn} attemts"
      # puts "hangman : #{@draw.hangman[0]}"
      @draw.hangman[turn] = @draw.hangman_parts[turn]
      @wrong_arr << @guess
      @wrong_arr.uniq!
    end
  end

  def win?
    @correct_arr.length == @code_arr.length
  end    

end