class Api < Sinatra::Base

  get '/' do
    content_type :json
    { health: :good }.to_json
  end

  post '/' do
    order_id = @request_payload['order_id']

    shipment = Shipment.find_by(order_id: order_id) || Shipment.new(order_id: order_id)
    shipment.status = 'Order Received'
    shipment.save
  end

end