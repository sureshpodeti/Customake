class CreateCompetitionSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_submissions do |t|
      t.integer :competitor_id
      t.integer :competition_task_id	
      t.integer :points_earned
      t.boolean :submitted_status

      t.timestamps
    end
  end
end
