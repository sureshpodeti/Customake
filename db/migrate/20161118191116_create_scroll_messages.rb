class CreateScrollMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :scroll_messages do |t|
      t.text :scroll_msg
      t.boolean :current_msg

      t.timestamps
    end
  end
end
