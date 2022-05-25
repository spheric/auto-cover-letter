# frozen_string_literal: true

class LoudMarketingMsgGroupComponent < ApplicationComponent
  COLORS = {
    100 => { orange: 'text-orange-100', rose: 'text-rose-100', yellow: 'text-yellow-100' },
    200 => { orange: 'text-orange-200', rose: 'text-rose-200', yellow: 'text-yellow-200' },
    300 => { orange: 'text-orange-300', rose: 'text-rose-300', yellow: 'text-yellow-300' },
    400 => { orange: 'text-orange-400', rose: 'text-rose-400', yellow: 'text-yellow-400' },
    500 => { orange: 'text-orange-500', rose: 'text-rose-500', yellow: 'text-yellow-500' },
    600 => { orange: 'text-orange-600', rose: 'text-rose-600', yellow: 'text-yellow-600' },
    700 => { orange: 'text-orange-700', rose: 'text-rose-700', yellow: 'text-yellow-700' },
    800 => { orange: 'text-orange-800', rose: 'text-rose-800', yellow: 'text-yellow-800' },
    900 => { orange: 'text-orange-900', rose: 'text-rose-900', yellow: 'text-yellow-900' },
    1000 => { orange: 'text-orange-1000', rose: 'text-rose-1000', yellow: 'text-yellow-1000' }
  }.with_indifferent_access

  COLS = {
    1 => 'grid-cols-1',
    2 => 'grid-cols-2',
    3 => 'grid-cols-3',
    4 => 'grid-cols-4',
    5 => 'grid-cols-5',
    6 => 'grid-cols-6',
    7 => 'grid-cols-7',
    8 => 'grid-cols-8',
    9 => 'grid-cols-9',
    10 => 'grid-cols-10'
  }

  def initialize(col:, color:, text:, color_gap:)
    @col = col
    @color = color
    @text = text

    halved_color_range = Array.new(col) { |t| t.zero? ? 100 : t * color_gap + 100 }.slice(0..(col / ( color_gap / 100 ).floor))
    @start_to_stop_color_range = (halved_color_range << halved_color_range.reverse.drop(1)).flatten
  end
end
