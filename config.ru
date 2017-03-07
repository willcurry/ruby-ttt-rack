$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rack_ttt'

Rack::Handler::WEBrick.run(
  RackTTT.new,
  :Port => 9000
)
