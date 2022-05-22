# frozen_string_literal: true

class SubmitComponent < ApplicationComponent
  def initialize(form:)
    @form = form
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
    @form.submit 'Create Cover Letter', class: CLASSES
  end
end
