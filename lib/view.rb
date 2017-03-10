require 'slim'

class View
  def self.board(board)
    path = File.expand_path('view/board.html.slim')
    [Slim::Template.new {File.read(path)}.render(self, :board => board)]
  end

  def self.home
    path = File.expand_path('view/index.html.slim')
    [Slim::Template.new {File.read(path)}.render(self, :modes => ModeRegistry.all_modes)]
  end

  def self.end_game(catalogue)
    path = File.expand_path('view/end_game.html.slim')
    [Slim::Template.new {File.read(path)}.render(self, :catalogue => catalogue)]
  end
end
