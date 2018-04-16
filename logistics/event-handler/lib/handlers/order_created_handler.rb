class OrderCreatedHandler
  attr_reader :data
  attr_reader :logistics_api

  def initialize(data:, logistics_api: LogisticsApi.new)
    @data          = data
    @logistics_api = logistics_api
  end

  def handle
    logistics_api.create_shipment(order_uuid: data['order_uuid'])
  end
end