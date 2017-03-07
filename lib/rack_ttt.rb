require 'cgi'
require 'html'
require 'web_game'
require 'game_controller'
require 'pre_game_controller'

class RackTTT
  attr_reader :game

  def initialize(game = nil, web_game = WebGame.new)
    @game = game
    @web_game = web_game
    @html = HTML.new
    @game_controller = GameController.new(@html, @web_game, @game)
    @pre_game_controller = PreGameController.new(@html)
  end

  def call(env)
    case env['PATH_INFO']
      when '/move'
        @game_controller.manage_move(env)
      else
        @pre_game_controller.parse(env)
    end
  end
end
