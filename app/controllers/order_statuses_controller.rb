class OrderStatusesController < ApplicationController
	before_action :authenticate_customer!
	def index
		@order=CustomerOrder.find(params[:customer_order_id])
		@statuses=@order.order_status
	end

	def create
		@order=CustomerOrder.find(params[:customer_order_id])
		@status=@order.create_order_status(status_params)
		@status.customer_order_id=params[:customer_order_id]
		if @status.save
			redirect_to customer_profiles_path
		else
			redirect_to customer_orders_path
		end
	end

	
	private

	def status_params
		params.require(:order_status).permit(:customer_order_id, :status)
	end	

end
