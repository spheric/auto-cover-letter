# frozen_string_literal: true

class PageDescriptionComponent < ApplicationComponent
  def initialize(description:)
    @description = description
  end
end
