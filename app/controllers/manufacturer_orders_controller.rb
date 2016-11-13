class ManufacturerOrdersController < ApplicationController
	before_action :authenticate_manufacturer!
	before_action :get_data, only: [:show, :destroy, :update, :edit]

	def index
		@orders=current_manufacturer.manufacturer_orders.all.order('created_at DESC')
	end
	
	def new
		@order=current_manufacturer.manufacturer_orders.build	
	end
	
	def create
		@order=current_manufacturer.manufacturer_orders.build(order_params)
		if @order.save
			redirect_to manufacturer_orders_path
		else
			redirect_to new_manufacturer_order_path
		end
	end

	
	private
	def order_params
		params.require(:manufacturer_order).permit(:manufacturer_id, :artifact, :quotation, :description, :quantity, :expected_delivery_date, :status)
	end	

	def get_data
		@order=current_manufacturer.manufacturer_orders.find(params[:id])
	end			
end


