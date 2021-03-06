class DeliveryAddressesController < ApplicationController
	before_action :authenticate_customer!
	before_action :get_data, only: [:show,:edit, :destory, :update]
	def index
		@order=CustomerOrder.find(params[:customer_order_id])
		@addresses=@order.delivery_address
	end
	
	def new
		@order=CustomerOrder.find(params[:customer_order_id])
		@address=@order.build_delivery_address
	end	

	def create
		@order=CustomerOrder.find(params[:customer_order_id])
		@address=@order.create_delivery_address(address_params)
		@address.customer_order_id=params[:customer_order_id]
		if @address.save
			flash[:success] = "your Order placed successfully!"
			redirect_to customer_profiles_path
		else
			redirect_to new_customer_order_delivery_address_path(@order)
		end
	end

	def show
	end

	def edit 
	end 	

	def update
		@order=CustomerOrder.find(params[:customer_order_id])
	    @addresses=@order.delivery_address

	    if @addresses.update_attributes(address_params)
	      flash[:success] = "Your Deliery Address updated successfully!"
	      redirect_to customer_order_delivery_addresses_path(@order)
	    else
	      render 'edit'
	    end
  	end


	private

	def address_params
		params.require(:delivery_address).permit(:customer_order_id, :address)
	end	


	def get_data
		@order=CustomerOrder.find(params[:customer_order_id])
		@address=DeliveryAddress.find(params[:id])
	end	


end
