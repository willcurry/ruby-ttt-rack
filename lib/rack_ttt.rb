require 'cgi'
require 'web_game'
require 'game_controller'
require 'pre_game_controller'

class RackTTT
  attr_reader :game

  def initialize(game = nil, web_game = WebGame.new)
    @game = game
    @web_game = web_game
    @pre_game_controller = PreGameController.new(@web_game)
    @not_set_up = true
  end

  def call(env)
    case env['PATH_INFO']
      when '/move'
        set_up_game if @not_set_up || @game.is_over?
        @game_controller.manage_move(env)
      else
        @pre_game_controller.parse(env)
    end
  end

  private

  def set_up_game
    @game = @pre_game_controller.game 
    @game_controller = GameController.new(@web_game, @game)
    @not_set_up = false
  end
end
