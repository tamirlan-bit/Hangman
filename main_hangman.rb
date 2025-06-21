require_relative 'manager'
require_relative 'game'
require_relative 'draw'
require 'json'

game = Game.new
draw = Draw.new
manager = Manager.new

game.draw = draw
game.manager = manager
draw.game = game
manager.game = game
manager.draw = draw

loop do
  draw.clear_screen
  draw.menu_display
  choice = gets.chomp
  case choice
    when "1" then manager.new_game
    when "2" then manager.resume_game
    when "3" then manager.load_game
    when "4" then manager.save_game
    when "5" then break
  else
    draw.clear_screen
    puts "\e[1mInvalid option.\e[0m"
  end
end
