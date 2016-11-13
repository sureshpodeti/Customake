class CreateManufacturerPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturer_payments do |t|
      t.integer :manufacturer_order_id	
      t.integer :quantity
      t.float :cost_per_piece
      t.float :total_amount

      t.timestamps
    end
  end
end
