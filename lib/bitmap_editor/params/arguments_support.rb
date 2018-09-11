class BitmapEditor
  module Params
    module ArgumentsSupport
      INTEGER_REGEX = /\A\d+\Z/

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def argument(name, type, position)
          defined_arguments << name

          attr_writer name

          define_method name do
            var_name = "@#{name}"
            if instance_variable_defined?(var_name)
              instance_variable_get(var_name)
            else
              instance_variable_set(
                var_name, with_conversion(@raw_params[position], type)
              )
            end
          end
        end

        def defined_arguments
          @defined_arguments ||= []
        end
      end

      def to_args
        puts self.class.defined_arguments
        self.class.defined_arguments.each_with_object({}) do |arg, result|
          result[arg] = public_send(arg)
        end
      end

      def with_conversion(value, type)
        conversion_method_name = "parse_#{type}"
        return value unless respond_to?(conversion_method_name)
        send(conversion_method_name, value)
      end

      def parse_integer(val)
        return val if val.is_a?(Integer) || !val.to_s.match(INTEGER_REGEX)
        Integer(val)
      rescue ArgumentError, TypeError
        raise BitmapEditor::Nan.new(val)
      end
    end
  end
end
