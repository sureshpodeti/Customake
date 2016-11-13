class CustomerOrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :get_data, only: [:show, :destroy, :update, :edit]

	def index
		@orders=current_customer.customer_orders.all.order('created_at DESC')
	end
	
	def new
		@order=current_customer.customer_orders.build	
	end
	
	def create
		@order=current_customer.customer_orders.build(order_params)
		if @order.save
			flash[:success] = "You order details submitted successfully!"
			redirect_to new_customer_order_delivery_address_path(@order)
		else
			flash[:error] = "Description, Quantity, and expected delivery date fileds are mandatory"
			redirect_to new_customer_order_path
		end
	end
	
	private
	def order_params
		params.require(:customer_order).permit(:customer_id, :artifact, :quotation, :description, :quantity, :expected_delivery_date, :status)
	end	

	def get_data
		@order=current_customer.customer_orders.find(params[:id])
	end			
end
