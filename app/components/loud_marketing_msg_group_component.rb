# frozen_string_literal: true

class LoudMarketingMsgGroupComponent < ApplicationComponent
  def initialize(col:, color:, text:, color_gap:)
    @col = col
    @color = color
    @text = text

    halved_color_range = Array.new(col) { |t| t.zero? ? 100 : t * color_gap + 100 }.slice(0..(col / ( color_gap / 100 ).floor))
    @start_to_stop_color_range = (halved_color_range << halved_color_range.reverse.drop(1)).flatten
  end
end
