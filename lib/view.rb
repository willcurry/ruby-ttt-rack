class View
  def self.board(board)
    board_binding = binding
    board_binding.local_variable_set(:board, board)
    path = File.expand_path('view/board.html.erb')
    [ERB.new(File.read(path)).result(board_binding)]
  end

  def self.home
    path = File.expand_path('view/index.html.erb')
    [ERB.new(File.read(path)).result]
  end
end
