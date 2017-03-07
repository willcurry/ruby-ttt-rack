class GameController
  def initialize(html, web_game, game)
    @html = html
    @web_game = web_game
    @game = game
  end

  def manage_move(env)
    make_move(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {'Content-Type' => 'text/html'}, [@html.header + @html.body(@html.create_board(@game.board))]]
  end

  def make_move(query_string)
    values = CGI.parse(query_string)
    cell = values['cell'].first
    @web_game.cell_pressed(cell)
  end
end
