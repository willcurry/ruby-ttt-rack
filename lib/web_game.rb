require 'game_catalogue'

class WebGame
  attr_accessor :board_size
  attr_accessor :requested_mode
  attr_accessor :game_catalogue

  def initialize
    @game_catalogue = GameCatalogue.new
  end

  def start(game)
    @ended = false
    @game = game
    board_size = 3
    requested_mode = 1
    @game.handle_input if @game.active_player.kind_of?(ComputerPlayer) || @game.active_player.kind_of?(ActorPlayer)
  end

  def ended?
    @ended
  end

  def button_pressed(button)
    return if !@game.active_player.kind_of?(WebPlayer)
    @game.active_player.user_input = button
    @game.handle_input
  end

  def ask_for_board_size
    board_size
  end

  def ask_for_mode
    requested_mode
  end

  def end_game
    @ended = true
    @game.end
    @game_catalogue.add(@game.recording) if !@game.active_player.kind_of?(ActorPlayer)
  end
end
