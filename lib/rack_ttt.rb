require 'cgi'
require 'html'
require 'web_game'
require 'game'
require 'web_player'

class RackTTT
  attr_reader :game

  def initialize
    @web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), @web_game)
    @web_game.start(@game)
  end

  def call(env)
    make_move(env["QUERY_STRING"]) if env['PATH_INFO'] == '/move'
    html = HTML.new(@game.board)
    ['200', {'Content-Type' => 'text/html'}, [html.header + html.body(html.create_board)]]
  end

  private

  def make_move(query_string)
    values = CGI.parse(query_string)
    cell = values['cell'].first
    @web_game.cell_pressed(cell)
  end
end
