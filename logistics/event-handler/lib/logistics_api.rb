class LogisticsApi
  attr_reader :logistics_url

  def initialize(logistics_url: ENV.fetch('LOGISTICS_API'))
    @logistics_url = logistics_url
  end

  def create_shipment(order_uuid:)
    http          = Net::HTTP.new(shipments_api_uri.host, shipments_api_uri.port)
    request       = Net::HTTP::Post.new(shipments_api_uri.request_uri, {})
    request.body  = { order_id: order_uuid }.to_json

    http.request(request)
  end

  private

  def shipments_api_uri
    URI.parse(logistics_url + '/shipments')
  end
end