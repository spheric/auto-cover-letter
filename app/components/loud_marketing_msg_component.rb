# frozen_string_literal: true

class LoudMarketingMsgComponent < ApplicationComponent
  def initialize(text:, color:, animate:)
    @text = text
    @color = color
    @animate = animate
  end
end
