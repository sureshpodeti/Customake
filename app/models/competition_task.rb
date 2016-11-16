class CompetitionTask < ApplicationRecord
	has_attached_file :artifact, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :artifact, content_type: /\Aimage\/.*\z/

  has_many :competition_submissions
end
