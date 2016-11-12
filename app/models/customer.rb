class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :customer_name, :organization_name, :mobile_num
  validates_uniqueness_of :customer_name, :mobile_num
  has_many :customer_orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:admin, :customer_name, :organization_name, :mobile_num, :email, :encrypted_password])
  end
end