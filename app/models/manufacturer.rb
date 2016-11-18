class Manufacturer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :manufacturer_orders
  validates_presence_of :manufacturer_name, :manufacturing_unit_name, :address, :mobile_num
  validates_uniqueness_of :mobile_num, :manufacturing_unit_name, :address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 15.minutes
end


class Manufacturer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:manufacturer_name, :manufacturing_unit_name, :address, :mobile_num, :email, :encrypted_password])
  end
end
