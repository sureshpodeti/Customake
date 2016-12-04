class CompetitionSubmission < ApplicationRecord
	belongs_to :competition_task
	has_attached_file :artifact, styles: { medium: "300x300>",thumb: '100x100>',
    square: '200x200#'}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :artifact, content_type: /^image\/(jpg|jpeg|png)$/, :message => 'file type is not allowed (only jpeg/png images)'

end
