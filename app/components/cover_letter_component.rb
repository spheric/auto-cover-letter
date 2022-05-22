# frozen_string_literal: true

class CoverLetterComponent < ApplicationComponent
  def initialize(cover_letter:)
    @cover_letter = cover_letter
  end

  def render?
    @cover_letter.content.present?
  end
end
