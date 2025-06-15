require_relative 'play'
require_relative 'display'

draw = Draw.new
play = Play.new
draw.clear_screen
draw.display
play.get_char
play.check_char
play.turn

