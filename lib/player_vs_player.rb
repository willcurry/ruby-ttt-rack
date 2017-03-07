require 'web_player'

module Modes
  class PlayerVsPlayer
    def initialize
      @key = 1
      @name = "Player VS Player"
    end

    def name
      @name
    end

    def key
      @key
    end

    def players
      [WebPlayer.new('x'), WebPlayer.new('o')]
    end
  end
end
