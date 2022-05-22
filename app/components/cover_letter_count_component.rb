# frozen_string_literal: true

class CoverLetterCountComponent < ApplicationComponent
  def initialize(cover_letter_count:)
    @cover_letter_count = cover_letter_count
  end

  def render?
    @cover_letter_count.positive?
  end
end
