class AddAttachmentArtifactToCompetitionTasks < ActiveRecord::Migration
  def self.up
    change_table :competition_tasks do |t|
      t.attachment :artifact
    end
  end

  def self.down
    remove_attachment :competition_tasks, :artifact
  end
end
