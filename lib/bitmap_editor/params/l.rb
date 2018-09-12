require './lib/bitmap_editor/params/base_param'

class BitmapEditor
  module Params
    class L < BaseParam
      argument :x, :integer, 0
      argument :y, :integer, 1
      argument :color, :string, 2

      validates :x, :y, :color, presence: true
      validates :x, :y, numericality: { greater_than: 0, only_integer: true }
      validates :x, numericality: { less_than_or_equal_to: :bitmap_width }
      validates :y, numericality: { less_than_or_equal_to: :bitmap_height }
      validates :color, format: { with: /\A[A-Z]\Z/ }
    end
  end
end
