class BitmapEditor
  module Matchers
    def define_argument(arg)
      DefineArgumentMatcher.new(arg)
    end

    class DefineArgumentMatcher
      def initialize(arg)
        @arg = arg
        @position = nil
      end

      def at(position)
        @position = position
        self
      end

      def description
        "expect :#{@arg} to be defined".tap do |desc|
          desc << " at position #{@position}" if @position
        end
      end

      def matches?(instance)
        @instance = instance
        return false if no_argument? || index_doesnt_match?
        true
      end

      def index
        @instance.class.defined_arguments.index(@arg)
      end

      def no_argument?
        index.nil?
      end

      def index_doesnt_match?
        return false unless @position
        index != @position
      end

      def failure_message
        if no_argument?
          "missing argument #{@arg}"
        elsif index_doesnt_match?
          "argument appears at index #{index} instead of #{@position}"
        else
          "unknown error"
        end
      end
    end
  end
end
