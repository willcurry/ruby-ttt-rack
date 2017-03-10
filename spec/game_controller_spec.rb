require 'web_game'
require 'game_controller'
require 'board'
require 'web_player'

RSpec.describe GameController do
  def generate_enviroment(query)
    enviroment = {}
    enviroment['QUERY_STRING'] = query
    enviroment
  end

  before(:each) do
    web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), web_game)
    @controller = GameController.new(web_game, @game)
  end

  it "returns a correct response" do
    enviroment = generate_enviroment('cell=1')
    expect(@controller.manage_move(enviroment).first).to eq('200')
    expect(@controller.manage_move(enviroment).last).to be_a(Array)
  end

  it "can make a move" do
    enviroment = generate_enviroment('cell=1')
    @controller.manage_move(enviroment)
    expect(@game.board.cells[1]).to eq('x')
  end
end
