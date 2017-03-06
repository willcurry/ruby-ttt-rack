require 'web_player'

RSpec.describe WebPlayer do
  before (:each) do
    @player = WebPlayer.new('x')
  end

  it "can have its input set" do
    @player.user_input = "1"
    expect(@player.user_input).to eq("1")
  end
end
