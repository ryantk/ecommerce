class Shipment
  include Mongoid::Document

  field :order_id, type: String
  field :status,   type: String
end