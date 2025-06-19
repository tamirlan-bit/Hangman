

require_relative 'play'
require_relative 'draw'

FILENAME = "google-10000-english-no-swears.txt"

def random_word
  if File.exist?(FILENAME)
    words = File.readlines(FILENAME).map(&:chomp)
    selected = words.select { |word| word.size > 5 && word.size < 12}
    selected.sample    
  else
    puts "words file wasn't found. Using fallback"
  end
end

play = Play.new 
draw = Draw.new
play.draw = draw
draw.play = play

loop do
  play.get_word(random_word)
  draw.clear_screen
  draw.display
  while play.wrong_arr.size < 7 
    play.get_char
    play.check_char
    draw.clear_screen
    draw.display
    if play.win?
      draw.clear_screen
      draw.display
      puts "\e[1mYou WON! The secret word was indeed #{play.code}🎉🎉\e[0m"
      play.replay(random_word)
    end  
  end
  puts "\e[1mGame Over! 💀\e[0m"
  puts "The secret word was \e[1m#{play.code}\e[0m"
  play.replay(random_word)
end

