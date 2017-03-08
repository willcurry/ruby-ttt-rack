require 'game_creator'
require 'modes'

class PreGameController
  def initialize(web_game)
    @web_game = web_game
  end

  def parse(env)
    update_options(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, view]
  end

  def game
    game_creator = GameCreator.new(@web_game)
    game_creator.create
  end

  private

  def view
    path = File.expand_path('view/index.html.erb')
    [ERB.new(File.read(path)).result]
  end

  def update_options(query_string)
    values = CGI.parse(query_string)
    @web_game.board_size = values['board_size'].first.to_i
    @web_game.requested_mode = values['mode'].first.to_i
  end
end
