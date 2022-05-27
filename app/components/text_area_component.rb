# frozen_string_literal: true

class TextAreaComponent < ApplicationComponent
  def initialize(form:, name:, counter: true, max_length: 400)
    @form = form
    @name = name
    @counter = counter
    @max_length = max_length
  end
end
