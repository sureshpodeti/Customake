class CustomerInstructionsController < ApplicationController
	before_action :authenticate_customer!
end
