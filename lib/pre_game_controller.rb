require 'game_creator'
require 'modes'

class PreGameController
  def initialize(html)
    @html = html
  end

  def parse(env)
     if env['QUERY_STRING'] != ""
      update_options(env['QUERY_STRING'])
      start_game
    end
    ['200', {'Content-Type' => 'text/html'}, [@html.header + @html.body(@html.game_options)]]
  end

  private

  def update_options(query_string)
    values = CGI.parse(query_string)
    @web_game.board_size = values['board_size'].first.to_i
    @web_game.requested_mode = values['mode'].first.to_i
  end

  def start_game
    game_creator = GameCreator.new(@web_game)
    @game = game_creator.create
    @game.start
  end
end
