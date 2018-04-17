require 'bunny'
require 'net/http'
require 'uri'
require 'json'

STDOUT.sync = true

require_relative 'lib/handlers/order_created_handler'
require_relative 'lib/logistics_api'
require_relative 'lib/event_listener'

event_listener = EventListener.new(event_queue_connection: Bunny.new(ENV.fetch('RMQ_EVENT_LIST_CONNECTION')).start)
event_listener.start