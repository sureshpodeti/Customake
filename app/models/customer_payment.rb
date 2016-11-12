class CustomerPayment < ApplicationRecord
	belongs_to :customer_order
end
