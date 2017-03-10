require 'web_player'

module Modes
  class ComputerVsPlayer
    def initialize
      @key = 4
      @name = "Computer Vs Player"
    end

    def name
      @name
    end

    def key
      @key
    end

    def players
      [ComputerPlayer.new('x'), WebPlayer.new('o') ]
    end
  end
end
