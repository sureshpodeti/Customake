class CreateCompetitionTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_tasks do |t|
      t.text :description
      t.date :deadline
      t.boolean :current_task, :default => false

      t.timestamps
    end
  end
end
