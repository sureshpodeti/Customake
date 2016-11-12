class DeliveryAddress < ApplicationRecord
	belongs_to :customer_order
    validates_presence_of :address
end
