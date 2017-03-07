class WebGame
  attr_accessor :board_size
  attr_accessor :requested_mode

  def start(game)
    @game = game
    board_size = 3
    requested_mode = 1
  end

  def cell_pressed(cell)
    @game.active_player.user_input = cell
    @game.handle_input
  end

  def ask_for_board_size
    board_size
  end

  def ask_for_mode
    requested_mode
  end
end
