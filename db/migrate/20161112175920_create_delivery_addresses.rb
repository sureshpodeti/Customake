class CreateDeliveryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_addresses do |t|
      t.integer :customer_order_id	
      t.text :address

      t.timestamps
    end
  end
end
