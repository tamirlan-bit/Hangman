require_relative 'play'
require_relative 'draw'

play = Play.new
draw = Draw.new(play)

while play.wrong_arr.size < 7
  draw.clear_screen
  draw.display
  play.get_char  
  play.check_char

  if play.win?
    draw.clear_screen
    draw.display
    puts "you WON!!!!!!!!!!!"
    exit
  end
end
puts "Game Over!!!!!!"
exit


