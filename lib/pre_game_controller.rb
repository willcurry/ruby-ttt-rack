require 'game_creator'
require 'modes'

class PreGameController
  attr_reader :game
  attr_reader :game_ready
  
  def initialize(html, web_game)
    @html = html
    @web_game = web_game
    @game_ready = false
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
    @game_ready = true
  end
end