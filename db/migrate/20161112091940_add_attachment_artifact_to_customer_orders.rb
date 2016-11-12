class AddAttachmentArtifactToCustomerOrders < ActiveRecord::Migration
  def self.up
    change_table :customer_orders do |t|
      t.attachment :artifact
    end
  end

  def self.down
    remove_attachment :customer_orders, :artifact
  end
end
