# frozen_string_literal: true

class TextFieldComponent < ApplicationComponent
  def initialize(form:, name:, max_length: 100, counter: true)
    @form = form
    @name = name
    @max_length = max_length
    @counter = counter
  end
end
