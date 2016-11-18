class CreateCompetitorCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :competitor_coins do |t|
      t.integer :competitor_id
      t.integer :competition_task_id
      t.integer :points_earned

      t.timestamps
    end
  end
end
