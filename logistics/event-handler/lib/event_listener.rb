class EventListener
  attr_reader :queue

  def initialize(event_queue_connection:)
    channel   = event_queue_connection.create_channel
    exchange  = channel.topic('events')
    @queue    = channel.queue('', exclusive: true)

    @queue.bind(exchange, routing_key: 'orders.*')
  end

  def start
    queue.subscribe(block: true) do |delivery_info, properties, body|
      puts " [x] #{delivery_info.routing_key}:#{body}"

      case delivery_info.routing_key
      when 'orders.OrderCreated'
        OrderCreatedHandler.new(data: JSON.parse(body)).handle
      end
    end
  end
end