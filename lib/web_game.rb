class WebGame
  def start(game)
    @game = game
  end

  def cell_pressed(cell)
    @game.active_player.user_input = cell
    @game.handle_input
  end
end
