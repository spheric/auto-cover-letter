# frozen_string_literal: true

class TextFieldComponent < ApplicationComponent
  def initialize(form:, name:)
    @form = form
    @name = name
  end

  def call
    @form.text_field @name, class: 'rounded text-black'
  end
end
