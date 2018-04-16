class ShipmentsApi < Sinatra::Base

  get '/' do
    content_type :json
    { shipments: Shipment.all }.to_json
  end

  post '/' do
    request.body.rewind
    request_payload = JSON.parse(request.body.read)

    order_id = request_payload['order_id']

    shipment = Shipment.find_by(order_id: order_id) || Shipment.new(order_id: order_id)
    shipment.status = 'Order Received'
    shipment.save
  end

end