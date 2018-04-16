require 'sinatra/base'
require 'mongoid'
require 'redis'
require 'json'

$LOAD_PATH.unshift(File.expand_path('.', __dir__))

require 'config/initializers/mongoid'

require 'models/shipment'
require 'api'
require 'shipments_api'

run Rack::URLMap.new(
  '/' => Api,
  '/shipments' => ShipmentsApi
)