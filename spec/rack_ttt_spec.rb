require 'rack_ttt'
require 'board'
require 'web_player'
require 'game'
require 'web_game'

RSpec.describe RackTTT do
  before (:each) do
    web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), @web_game)
    web_game.start(@game)
    @rack_ttt = RackTTT.new(@game, web_game)
    @enviroment = {}
    @enviroment['PATH_INFO'] = "/move"
    @enviroment['QUERY_STRING'] = "cell=1"
  end

  it "returns 200 http response" do
    expect(@rack_ttt.call(@enviroment).first).to eq('200')
  end

  it "returns the content type of text/html" do
    expect(@rack_ttt.call(@enviroment)[1]['Content-Type']).to eq('text/html')
  end

  it "makes a move when the query string is move" do
    @rack_ttt.call(@enviroment)
    expect(@game.board.cells[1]).to eq('x')
  end
end
