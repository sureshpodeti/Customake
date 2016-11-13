class ManufacturerPayment < ApplicationRecord
	belongs_to :manufacturer_order

	def index
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@payments=@order.manufacturer_payment

	end
	
	def create
		@order=ManufacturerOrder.find(params[:manufacturer_order_id])
		@payment=@order.create_manufacturer_payment(payment_params)
		@payment.manufacturer_order_id=params[:manufacturer_order_id]
		if @payment.save
			redirect_to manufacturer_profiles_path
		else
			redirect_to manufacturer_orders_path
		end
	end

	
	private

	def payment_params
		params.require(:manufacturer_payment).permit(:manufacturer_order_id, :quantity, :cost_per_piece, :total_amount)
	end	

	
end
