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
  end

  def call(env)
    set_up_game if @pre_game_controller.ready? && @game.nil?
    case env['PATH_INFO']
      when '/move'
        @game_controller.manage_move(env)
      else
        @pre_game_controller.parse(env)
    end
  end

  private

  def set_up_game
    @game = @pre_game_controller.create_game
    @game_controller = GameController.new(@web_game, @game)
  end
end
