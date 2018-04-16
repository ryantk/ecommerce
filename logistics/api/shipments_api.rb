class ShipmentsApi < Sinatra::Base

  get '/' do
    content_type :json
    { shipments: Shipment.all }.to_json
  end

end