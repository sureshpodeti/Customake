class AddAttachmentArtifactToManufacturerOrders < ActiveRecord::Migration
  def self.up
    change_table :manufacturer_orders do |t|
      t.attachment :artifact
    end
  end

  def self.down
    remove_attachment :manufacturer_orders, :artifact
  end
end
