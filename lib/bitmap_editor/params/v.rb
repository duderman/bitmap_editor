# frozen_string_literal: true

require './lib/bitmap_editor/params/base_param'

class BitmapEditor
  module Params
    class V < BaseParam
      argument :x, :integer
      argument :y1, :integer
      argument :y2, :integer
      argument :color, :string

      validates :x, presence: true, coordinate: { axis: :x }
      validates :y1, :y2, presence: true, coordinate: { axis: :y }
      validates :color, presence: true, color: true
    end
  end
end
