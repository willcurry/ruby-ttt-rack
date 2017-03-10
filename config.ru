$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rack_ttt'
require 'rack/static'

use Rack::Static, 
  :urls => ["/css"],
  :root => "public"

run RackTTT.new
