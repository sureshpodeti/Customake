class CreateCustomerOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_orders do |t|
      t.integer :customer_id
      t.string :quotation
      t.text :description
      t.integer :quantity
      t.date :expected_delivery_date
      t.string :status

      t.timestamps
    end
  end
end
