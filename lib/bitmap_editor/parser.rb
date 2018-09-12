# frozen_string_literal: true

class BitmapEditor
  module Parser
    INTEGER_REGEX = /\A\-?\d+\Z/

    module_function

    def parse(value, type)
      conversion_method_name = "parse_#{type}"
      return value unless respond_to?(conversion_method_name)

      send(conversion_method_name, value)
    end

    def parse_integer(val)
      return val if val.is_a?(Integer) || !val.to_s.match(INTEGER_REGEX)

      Integer(val)
    rescue ArgumentError, TypeError
      raise BitmapEditor::Nan, val
    end
  end
end
