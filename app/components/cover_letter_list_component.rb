# frozen_string_literal: true

class CoverLetterListComponent < ApplicationComponent
  def initialize(cover_letters:)
    @cover_letters = cover_letters
  end
end
