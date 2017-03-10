require 'view'

class EndGameController
  def initialize(web_game, game_controller)
    @web_game = web_game
    @game_controller = game_controller
  end

  def parse_options(env)
    play_recording(env['QUERY_STRING']) if env['QUERY_STRING'] != ""
    ['200', {}, View.end_game(@web_game.game_catalogue)]
  end

  private

  def play_recording(query_string)
    values = CGI.parse(query_string)
    game_id = values['game'].first.to_i   
    recording = @web_game.game_catalogue.select_game(game_id)
    @game_controller.play_recording(recording)
  end
end
