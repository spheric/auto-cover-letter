# frozen_string_literal: true

class CoverLetterComponent < ApplicationComponent
  renders_one :divider, "DividerComponent"
  renders_one :show_button, "PrimaryButtonComponent"

  def initialize(cover_letter:)
    @cover_letter = cover_letter
  end

  def render?
    @cover_letter.content.present?
  end
end
