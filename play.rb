class Play
  attr_accessor :wrong_arr, :correct_arr, :code
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

  def check_char
    @code_arr = @code.split("").uniq!
    if @code_arr.include?(@guess)
      # puts "Good guess"
      @correct_arr << @guess
      @correct_arr.uniq!
      # p @correct_arr
    else
      # puts "Wrong guess"
      @wrong_arr << @guess
      @wrong_arr.uniq!
      # p @wrong_arr
    end
  end

  def win?
    @correct_arr.length == @code_arr.length
  end    

end