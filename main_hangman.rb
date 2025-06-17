require_relative 'play'
require_relative 'draw'

play = Play.new
draw = Draw.new
play.draw = draw
draw.play = play


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

