require 'rack_ttt'
require 'board'
require 'web_player'
require 'game'
require 'web_game'

RSpec.describe RackTTT do
  def setup(path, query)
    web_game = WebGame.new
    @game = Game.new(Board.new, WebPlayer.new('x'), WebPlayer.new('o'), @web_game)
    web_game.start(@game)
    @rack_ttt = RackTTT.new(@game, web_game)
    @enviroment = {}
    @enviroment['PATH_INFO'] = path
    @enviroment['QUERY_STRING'] = query
  end

  it "returns 200 http response" do
    setup("/move", "cell=1")
    expect(@rack_ttt.call(@enviroment).first).to eq('200')
  end

  it "returns the content type of text/html" do
    setup("/move", "cell=1")
    expect(@rack_ttt.call(@enviroment)[1]['Content-Type']).to eq('text/html')
  end

  it "makes a move when the query string is move" do
    setup("/move", "cell=1")
    @rack_ttt.call(@enviroment)
    expect(@game.board.cells[1]).to eq('x')
  end

  it "can create a game" do
    setup("/", "board_size=3&mode=1")
    @rack_ttt.call(@enviroment)
    expect(@rack_ttt.game.board.dimension).to eq(3)
    expect(@rack_ttt.game.active_player).to be_a(WebPlayer)
  end
end
