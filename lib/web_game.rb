class WebGame
  attr_accessor :board_size
  attr_accessor :requested_mode

  def start(game)
    @game = game
    board_size = 3
    requested_mode = 1
  end

  def cell_pressed(cell)
    return if !@game.active_player.kind_of?(WebPlayer)
    @game.active_player.user_input = cell
    @game.handle_input
    end_game if @game.is_over?
  end

  def ask_for_board_size
    board_size
  end

  def ask_for_mode
    requested_mode
  end

  private

  def end_game
    @game.end
    recording = @game.recording
  end
end
