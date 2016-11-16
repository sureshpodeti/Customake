class AddAttachmentArtifactToCompetitionSubmissions < ActiveRecord::Migration
  def self.up
    change_table :competition_submissions do |t|
      t.attachment :artifact
    end
  end

  def self.down
    remove_attachment :competition_submissions, :artifact
  end
end
