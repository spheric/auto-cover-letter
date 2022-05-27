# frozen_string_literal: true

class TextAreaComponent < ApplicationComponent
  def initialize(form:, name:)
    @form = form
    @name = name
  end

  def call
    @form.text_area @name, maxlength: 400, class: 'rounded h-48 text-black'
  end
end
