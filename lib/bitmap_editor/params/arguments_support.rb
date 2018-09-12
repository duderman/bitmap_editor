require './lib/bitmap_editor/parser'

class BitmapEditor
  module Params
    module ArgumentsSupport
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def argument(name, type)
          var_name = "@#{name}"
          position = defined_arguments.length
          defined_arguments << name

          define_method "#{name}=" do |new_val|
            converted_val = with_conversion(new_val, type)
            instance_variable_set(var_name, converted_val)
          end

          define_method name do
            if instance_variable_defined?(var_name)
              instance_variable_get(var_name)
            else
              public_send("#{name}=", @raw_params[position])
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
        BitmapEditor::Parser.parse(value, type)
      end
    end
  end
end
