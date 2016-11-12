class CreateOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuses do |t|
      t.integer :customer_order_id	
      t.string :status

      t.timestamps
    end
  end
end
