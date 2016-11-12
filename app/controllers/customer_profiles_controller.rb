class CustomerProfilesController < ApplicationController
	before_action :authenticate_customer!
end
