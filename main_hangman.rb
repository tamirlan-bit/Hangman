require_relative 'play'
require_relative 'draw'

play = Play.new
draw = Draw.new
play.draw = draw
draw.play = play
turn = 1

draw.clear_screen
draw.display
while play.wrong_arr.size < 7 
  play.get_char
  play.check_char(turn)
  draw.clear_screen
  draw.display
  if play.win?
    draw.clear_screen
    draw.display
    puts "you WON!!!!!!!!!!!"
    exit
  end
  turn += 1
end
puts "Game Over!!!!!!"
exit


