require 'web_player'

module Modes
  class PlayerVsComputer
    def initialize
      @key = 2
      @name = "Player VS Computer"
    end

    def name
      @name
    end

    def key
      @key
    end

    def players
      [WebPlayer.new('x'), ComputerPlayer.new('o')]
    end
  end
end
