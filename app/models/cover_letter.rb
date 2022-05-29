class CoverLetter < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_rich_text :content
  belongs_to :job_description

  after_update_commit do
    broadcast_update_to self, :content,
                        target: 'cover-letter-content',
                        html: cover_letter_component.render_in(ActionController::Base.new.view_context)
  end

  def cover_letter_component
    component = CoverLetterComponent.new(cover_letter: self)
    component.edit_button(
      path: edit_cover_letter_path(self),
      frame: "cover_letter#{id}_edit",
      action: "click->hide#hide",
      text: 'Edit',
      data: { 'hide' => true, 'hide-target' => 'source' }
    )
    component
  end
end
