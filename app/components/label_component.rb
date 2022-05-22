# frozen_string_literal: true

class LabelComponent < ApplicationComponent
  def initialize(form:, name:, text: nil)
    @form = form
    @name = name
    @text = text
  end

  def call
    @form.label @name, @text
  end
end
