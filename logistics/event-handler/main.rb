require 'redis'
require 'net/http'
require 'uri'
require 'json'

require_relative 'lib/handlers/order_created_handler'
require_relative 'lib/logistics_api'
require_relative 'lib/event_listener'

event_listener = EventListener.new(redis: Redis.new(url: ENV.fetch('REDIS_CONNECTION')))
event_listener.start