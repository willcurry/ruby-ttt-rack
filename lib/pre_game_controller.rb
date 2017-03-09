require 'game_creator'
require 'modes'
require 'view'

class PreGameController
  def initialize(web_game)
    @web_game = web_game
    @ready = false
  end

  def ready?
    @ready
  end

  def parse(env)
    update_options(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, View.home]
  end

  def create_game
    game_creator = GameCreator.new(@web_game)
    game_creator.create
  end

  private

  def update_options(query_string)
    values = CGI.parse(query_string)
    @web_game.board_size = values['board_size'].first.to_i
    @web_game.requested_mode = values['mode'].first.to_i
    @ready = true
  end
end
