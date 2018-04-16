require 'redis'
require 'json'

require 'mongoid'
require_relative 'config/initializers/mongoid'
require_relative 'models/shipment'

redis ||= Redis.new(url: ENV.fetch('REDIS_CONNECTION'))

redis.subscribe('Events.OrderCreated') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)

    shipment = Shipment.find_by(order_id: data['order_uuid']) || Shipment.new(order_id: data['order_uuid'])
    shipment.status = 'Order Received'
    shipment.save
  end
end