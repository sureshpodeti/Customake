class AddAttachmentArtifactToCompetitionWinners < ActiveRecord::Migration
  def self.up
    change_table :competition_winners do |t|
      t.attachment :artifact
    end
  end

  def self.down
    remove_attachment :competition_winners, :artifact
  end
end
