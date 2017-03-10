require 'rack_ttt'
require 'board'
require 'web_player'
require 'game'
require 'web_game'

RSpec.describe RackTTT do
  def setup(path, query)
    @web_game = WebGame.new
    @rack_ttt = RackTTT.new(@game, @web_game)
    @enviroment = generate_enviroment(path, query)
  end

  def generate_enviroment(path, query)
    enviroment = {}
    enviroment['PATH_INFO'] = path
    enviroment['QUERY_STRING'] = query
    enviroment
  end

  it "makes a move when the query string is move" do
    setup("/", "board_size=3&mode=1")
    @rack_ttt.call(@enviroment)
    env = generate_enviroment("/move", "cell=1")
    @rack_ttt.call(env)
    expect(@rack_ttt.game.board.cells[1]).to eq('x')
  end

  it "can create a game" do
    setup("/", "board_size=3&mode=1")
    @rack_ttt.call(@enviroment)
    expect(@web_game.board_size).to eq(3)
    expect(@web_game.requested_mode).to eq(1)
  end
end
