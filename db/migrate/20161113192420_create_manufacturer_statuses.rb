class CreateManufacturerStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturer_statuses do |t|
    t.integer :manufacturer_order_id	
      t.string :status

      t.timestamps
    end
  end
end
