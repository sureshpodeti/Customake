class CreateCompetitionWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_winners do |t|
      t.string :winner_name
      t.string :college
      t.integer :position

      t.timestamps
    end
  end
end
