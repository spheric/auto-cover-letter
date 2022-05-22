# frozen_string_literal: true

class PrimaryButtonComponent < ApplicationComponent
  def initialize(text: nil, path: '#', action: '')
    @text = text
    @path = path
    @action = action
  end

  def call
    data = {}
    data.merge!(action: @action) if @action

    link_to @path, data: data, class: 'bg-orange-500 px-5 py-3 border border-transparent text-base font-medium rounded-md text-white' do
      @text || content
    end
  end
end
