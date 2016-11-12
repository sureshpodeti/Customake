class CustomerPaymentsController < ApplicationController
	before_action :authenticate_customer!
	def index
		@order=CustomerOrder.find(params[:customer_order_id])
		@payments=@order.customer_payment
	end

	def create
		@order=CustomerOrder.find(params[:customer_order_id])
		@payment=@order.create_customer_payment(payment_params)
		@payment.customer_order_id=params[:customer_order_id]
		if @payment.save
			redirect_to customer_profiles_path
		else
			redirect_to customer_orders_path
		end
	end

	
	private

	def payment_params
		params.require(:customer_payment).permit(:customer_order_id, :address)
	end	


	
	
end
