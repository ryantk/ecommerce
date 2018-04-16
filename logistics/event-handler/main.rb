require 'redis'
require 'net/http'
require 'uri'
require 'json'

redis ||= Redis.new(url: ENV.fetch('REDIS_CONNECTION'))

redis.subscribe('Events.OrderCreated') do |on|
  def create_shipment(order_uuid)
    logistics_api = URI.parse(ENV.fetch('LOGISTICS_API') + '/shipments')

    http          = Net::HTTP.new(logistics_api.host, logistics_api.port)
    request       = Net::HTTP::Post.new(logistics_api.request_uri, {})
    request.body  = { order_id: order_uuid }.to_json

    http.request(request)
  end

  # Event handling here:

  on.message do |channel, msg|
    data = JSON.parse(msg)
    create_shipment(data['order_uuid'])
  end
end