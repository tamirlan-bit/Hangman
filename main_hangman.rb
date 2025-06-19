

require_relative 'play'
require_relative 'draw'

FILENAME = "google-10000-english-no-swears.txt"
def random_word
  if File.exist?(FILENAME)
    words = File.readlines(FILENAME).map(&:chomp)
    selected = words.select { |word| word.size > 5 && word.size < 12}
    return selected.sample    
  else
    puts "words file wasn't found."
  end
end

play = Play.new (random_word)
draw = Draw.new
play.draw = draw
draw.play = play

puts random_word

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
    puts "\e[1mYou WON! 🎉\e[0m"
    exit
  end  
end
puts "\e[1mGame Over! 💀\e[0m"
exit

