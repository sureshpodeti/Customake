class CreateCustomerPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_payments do |t|
      t.integer :customer_order_id	
      t.integer :quantity
      t.float :cost_per_piece
      t.float :total_cost
      t.text :description

      t.timestamps
    end
  end
end
