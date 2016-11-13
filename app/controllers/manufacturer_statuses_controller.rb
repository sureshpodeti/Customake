class ManufacturerStatusesController < ApplicationController
	before_action :authenticate_manufacturer!
	before_action :get_data, only: [:show, :edit, :update, :destroy]
	def index
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@statuses=@order.manufacturer_status
	end

	def new
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@status=@order.build_manufacturer_status
	end	

	def create
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@status=@order.create_manufacturer_status(status_params)
		@status.manufacturer_order_id=params[:manufacturer_order_id]
		if @status.save
			redirect_to manufacturer_order_manufacturer_statuses_path
		else
			redirect_to new_manufacturer_order_manufacturer_status_path
		end
	end

	def update
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@status = ManufacturerStatus.find(params[:id])
	    if @status.update_attributes(status_params)
	      flash[:success] = "Status Updated Successfully"
	      redirect_to manufacturer_order_manufacturer_statuses_path(@order)
	    else
	      render 'edit'
	    end
  end

	def edit
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@status=ManufacturerStatus.find(params[:id])
	end
		
	private

	def status_params
		params.require(:manufacturer_status).permit(:manufacturer_order_id, :status)
	end	

	def get_data
		@status=ManufacturerStatus.find(params[:id])
	end	

end
