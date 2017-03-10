class View
  def self.board(board)
    board_binding = binding
    board_binding.local_variable_set(:board, board)
    path = File.expand_path('view/board.html.erb')
    [ERB.new(File.read(path)).result(board_binding)]
  end

  def self.home
    modes_binding = binding
    modes_binding.local_variable_set(:modes, ModeRegistry.all_modes)
    path = File.expand_path('view/index.html.erb')
    [ERB.new(File.read(path)).result(modes_binding)]
  end

  def self.end_game(game_catalogue)
    game_catalogue_binding = binding
    game_catalogue_binding.local_variable_set(:game_catalogue, game_catalogue)
    path = File.expand_path('view/end_game.html.erb')
    [ERB.new(File.read(path)).result(game_catalogue_binding)]
  end
end
