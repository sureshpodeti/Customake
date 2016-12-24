class CreateActorRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :actor_roles do |t|
      t.integer :role_id

      t.timestamps
    end
  end
end
