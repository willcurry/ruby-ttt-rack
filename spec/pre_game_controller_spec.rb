require 'web_game'
require 'pre_game_controller'

RSpec.describe PreGameController do
  def generate_enviroment(query)
    enviroment = {}
    enviroment['QUERY_STRING'] = query
    enviroment
  end

  it "can create games with specified options" do
    pre_game = PreGameController.new(WebGame.new)
    enviroment = generate_enviroment("board_size=3&mode=1")
    pre_game.parse_options(enviroment)
    expect(pre_game.create_game.board.dimension).to eq(3)
    expect(pre_game.create_game.active_player).to be_a(WebPlayer)
  end

  it "returns a correct response" do
    pre_game = PreGameController.new(WebGame.new)
    enviroment = generate_enviroment("board_size=3&mode=1")
    expect(pre_game.parse_options(enviroment).first).to eq('200')
    expect(pre_game.parse_options(enviroment).last).to be_a(Array)
  end

  it "becomes ready once created" do
    pre_game = PreGameController.new(WebGame.new)
    expect(pre_game.ready?).to eq(false)
    enviroment = generate_enviroment("board_size=3&mode=1")
    pre_game.parse_options(enviroment)
    expect(pre_game.ready?).to eq(true)
  end
end
