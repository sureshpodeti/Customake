class ManufacturerOrder < ApplicationRecord
	belongs_to :manufacturer
	has_one :manufacturer_payment
	has_one :manufacturer_status
	has_attached_file :artifact, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :artifact, content_type: /\Aimage\/.*\z/
end
