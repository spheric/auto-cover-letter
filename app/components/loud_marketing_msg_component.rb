# frozen_string_literal: true

class LoudMarketingMsgComponent < ApplicationComponent
  def initialize(text: nil, color: 'orange-500')
    @text = text
    @color = color
  end
end
