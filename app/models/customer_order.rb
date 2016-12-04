class CustomerOrder < ApplicationRecord
	belongs_to :customer
	has_one :delivery_address
	has_one :customer_payment
	has_one :order_status
	has_attached_file :artifact, styles: { medium: "300x300>", thumb: "100x100>", square: '200x200#' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :artifact, content_type: /^image\/(jpg|jpeg|png|pdf)$/, :message => 'file type is not allowed (only jpeg/png/pdf images)'
  validates_presence_of :description, :quantity, :expected_delivery_date
end
