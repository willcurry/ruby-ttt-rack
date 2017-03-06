require 'web_game'
require 'web_player'
require 'game'

RSpec.describe WebGame do
  before (:each) do
    @web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), @web_game)
  end

  it "cell pressed makes a move" do
    @web_game.start(@game)
    @web_game.cell_pressed('1')
    expect(@game.board.cells[1]).to eq('x')
  end
end
