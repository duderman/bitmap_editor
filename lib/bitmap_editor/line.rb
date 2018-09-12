class BitmapEditor
  class Line
    def initialize(raw)
      @raw = raw
    end

    def command
      parts[0].upcase
    end

    def params
      parts[1..-1]
    end

    private

    def parts
      @parts ||= @raw.to_s.split(' ')
    end
  end
end
