require 'rack'
require 'view'

class GameController
  def initialize(web_game, game)
    @web_game = web_game
    @web_game.set_controller(self)
    @game = game
    @game.start
  end

  def manage_move(env)
    make_move(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, View.board(@game.board)]
  end

  def update_view
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
end
