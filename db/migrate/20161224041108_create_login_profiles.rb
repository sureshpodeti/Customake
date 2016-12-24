class CreateLoginProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :login_profiles do |t|
      t.string :profile

      t.timestamps
    end
  end
end
