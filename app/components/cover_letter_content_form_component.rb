# frozen_string_literal: true

class CoverLetterContentFormComponent < ApplicationComponent
  def initialize(cover_letter:)
    @cover_letter = cover_letter
  end
end
