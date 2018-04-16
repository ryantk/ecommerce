class EventListener
  attr_reader :redis

  def initialize(redis:)
    @redis = redis
  end

  def start
    redis.subscribe('Events.OrderCreated') do |on|
      on.message do |channel, msg|
        OrderCreatedHandler.new(data: JSON.parse(msg)).handle
      end
    end
  end
end