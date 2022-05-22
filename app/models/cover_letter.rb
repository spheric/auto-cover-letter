class CoverLetter < ApplicationRecord
  has_rich_text :content
  belongs_to :job_description

  after_update_commit do
    broadcast_update_to self, :content,
                        target: 'cover-letter-content',
                        html: CoverLetterComponent.new(cover_letter: self).render_in(ActionController::Base.new.view_context)
  end
end
