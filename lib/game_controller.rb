require 'rack'

class GameController
  def initialize(web_game, game)
    @web_game = web_game
    @web_game.set_controller(self)
    @game = game
    @game.start
  end

  def manage_move(env)
    make_move(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, view]
  end

  def update_display
    response = Rack::Response.new
    response.redirect('/move')
    response.finish
  end

  private 

  def make_move(query_string)
    values = CGI.parse(query_string)
    cell = values['cell'].first
    @web_game.cell_pressed(cell)
  end

  def view
    board_binding = binding
    board_binding.local_variable_set(:board, @game.board)
    path = File.expand_path('view/board.html.erb')
    [ERB.new(File.read(path)).result(board_binding)]
  end
end
