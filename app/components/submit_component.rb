# frozen_string_literal: true

class SubmitComponent < ApplicationComponent
  def initialize(form:, text:)
    @form = form
    @text = text
  end

  CLASSES = %w[
    bg-orange-500
    px-5
    py-3
    mt-2
    border
    border-transparent
    text-base
    font-medium
    rounded-md
    text-white
    cursor-pointer
  ]

  def call
    @form.submit @text, class: CLASSES
  end
end
