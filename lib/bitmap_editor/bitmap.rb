class BitmapEditor
  class Bitmap
    DEFAULT_COLOR = 'O'.freeze

    attr_reader :width, :height

    def initialize(width = 0, height = 0)
      @width = width
      @height = height
    end

    def data
      @data ||= Array.new(height) { row }
    end

    def to_s
      data.map(&:join).join("\n")
    end

    def []=(x, y, color)
      data[y][x] = color
    end

    def [](x, y)
      data[y][x]
    end

    private

    def row
      Array.new(width, DEFAULT_COLOR)
    end
  end
end
