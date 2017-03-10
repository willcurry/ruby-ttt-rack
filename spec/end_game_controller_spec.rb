require 'end_game_controller'
require 'web_game'
require 'board'
require 'web_player'
require 'game_controller'

RSpec.describe EndGameController do
  before (:each) do
    @web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), @web_game)
    @game_controller = GameController.new(@web_game, @game)
    @controller = EndGameController.new(@web_game, @game_controller)
  end

  def generate_enviroment(query)
    enviroment = {}
    enviroment['QUERY_STRING'] = query
    enviroment
  end

  it "has the correct response" do
    enviroment = generate_enviroment("")
    expect(@controller.parse_options(enviroment).first).to eq('200')
    expect(@controller.parse_options(enviroment).last).to be_a(Array)
  end
end
