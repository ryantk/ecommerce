require 'redis'
require 'net/http'
require 'uri'
require 'json'

redis ||= Redis.new(url: ENV.fetch('REDIS_CONNECTION'))
logistics_api = URI.parse(ENV.fetch('LOGISTICS_API'))

redis.subscribe('Events.OrderCreated') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)

    http         = Net::HTTP.new(logistics_api.host, logistics_api.port)
    request      = Net::HTTP::Post.new(logistics_api.request_uri, {})
    request.body = { order_id: data['order_uuid'] }.to_json

    http.request(request)
  end
end