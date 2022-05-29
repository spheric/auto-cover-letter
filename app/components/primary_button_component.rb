# frozen_string_literal: true

class PrimaryButtonComponent < ApplicationComponent
  def initialize(text: nil, frame: nil, path: '#', action: '', id: '', data: {})
    @text = text
    @path = path
    @action = action
    @frame = frame
    @id = id
    @data = data
  end

  def call
    @data.merge!(action: @action) if @action
    @data.merge!('turbo-frame' => @frame) if @frame

    link_to @path, data: @data, method: 'get', id: @id, class: 'z-50 bg-orange-500 px-5 py-3 border border-transparent text-base font-medium rounded-md text-white' do
      @text || content
    end
  end
end
