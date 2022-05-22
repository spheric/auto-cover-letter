# frozen_string_literal: true

class PrimaryButtonComponent < ApplicationComponent
  def initialize(text:, path: '#')
    @text = text
    @path = path
  end

  def call
    link_to @text, @path,
            class: 'bg-orange-500 px-5 py-3 border border-transparent text-base font-medium rounded-md text-white'
  end
end
