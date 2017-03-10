require 'rack'
require 'view'

class GameController
  def initialize(web_game, game)
    @web_game = web_game
    @game = game
    @game.start
  end

  def manage_move(env)
    give_input(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, View.board(@game.board)]
  end

  def play_recording(recording)
    @game = recording.get
    Thread.new{@game.start}
  end

  private 

  def give_input(query_string)
    values = CGI.parse(query_string)
    cell = values['cell'].first
    @web_game.button_pressed(cell)
  end
end
